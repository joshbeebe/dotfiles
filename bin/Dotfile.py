import os
import subprocess
from pathlib import Path
Dotfile_local_home: str = '~'

class DotfileExecuter():
    '''
    Wrapper class to interface between Command and Dotfile classes
    '''
    dotfile_list = None

    def apply_fn(**kwargs):
        # global DotfileMap.dotfile_map
        if DotfileExecuter.dotfile_list is None:
            Exception('Error: No dotfile map set')
        dotfile = DotfileExecuter.dotfile_list[list(kwargs)[1]]
        file = list(kwargs)[2] if len(kwargs) > 2 else None
        getattr(dotfile, list(kwargs)[0])(file)

    fn_map = {
        'unlink': apply_fn,
        'link': apply_fn,
    }

class Dotfile():
    def __init__(self,name: str, 
                 files = None, 
                 path: str = '~', 
                 local_path: str = '~/dotfiles/',
                 extra_cmds: list[list[str]] = [],
                 ) -> None:
        """Represents a list of dotfiles for a program

        Args:
            name (str): Name of dotfile/program
            files (dict[str, str], optional): List of files to manage config for. Default to take name as the only file (e.g. .bashrc)
            path (str, optional): path to link the files to. Defaults to '~'.
            local_path (str, optional): path of the dotfile directory where actual files are. Defaults to '~/dotfiles/'.
        """
        self.path = path.replace('~', Dotfile_local_home)
        self.local_path = local_path.replace('~', Dotfile_local_home)
        if files is None:
            # exp_name = f'/{name}'
            files = [name]
        elif files is []:
            files = os.listdir(local_path)
        self.files = files
        self.name = name
        self.extra_cmds = extra_cmds

    def get_filename(self, file:str = None):
        filename = file if file is not None else self.files[0]
        return filename

    def unlink(self, file = None):
        if file is None:
            for f in self.files:
                self.dounlink(f)
        else:
            self.dounlink(file)

    def dounlink(self, file):
        if type(file) is tuple:
            originfile = file[0]
            destfile = file[1]
        else:
            originfile = file
            destfile = file
        fullpath = Path(self.path)/Path(self.get_filename(destfile))
        print(f'Unlinking {fullpath}')
        if os.path.islink(fullpath):
            os.unlink(fullpath)
            # TODO: Iterate up directory structure deleting every empty dir
            print('Done.')

    def link(self, file: str = None):
        if file is None:
            for f in self.files:
                self.dolink(f)
            self.postrun()
        else:
            self.dolink(file)

    def dolink(self, file):
        if type(file) is tuple:
            originfile = file[0]
            destfile = file[1]
        else:
            originfile = file
            destfile = file
        fullpath = Path(self.path)/Path(self.get_filename(destfile))
        local_fullpath = Path(self.local_path)/Path(self.get_filename(originfile))
        print(f'Linking {fullpath} from {local_fullpath}')
        if local_fullpath.exists():
            fullpath.parent.mkdir(exist_ok=True, parents=True)
            try:
                fullpath.symlink_to(local_fullpath)
                # os.symlink(local_fullpath, fullpath)
            except FileExistsError:
                print('File already exists')
            print('Done.')
        else:
            print(f"File {local_fullpath} doesn't exist")

    def postrun(self):
        for cmd in self.extra_cmds:
            fcmd = [s.replace('~',Dotfile_local_home) for s in cmd]
            print(fcmd)
            subprocess.run(fcmd)

def Dotfiles(dotfiles: list[Dotfile]) -> dict[str, Dotfile]:
    return {d.name:d for d in dotfiles}