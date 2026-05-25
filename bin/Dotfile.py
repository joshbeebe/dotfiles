import os
import subprocess
from pathlib import Path
from collections import defaultdict
Dotfile_local_home: str = '~'


class Dotfile():
    def __init__(self,name: str, 
                 files = None, 
                 path: str = '~', 
                 local_path: str = '~/dotfiles/',
                 extra_cmds: list[list[str]] = [],
                 install_all: bool = True
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
        self.install_all = install_all

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
                do_delete = input('Delete? (y/N)')
                if do_delete == 'y':
                    fullpath.unlink()
                    print('Original file deleted.')
            print('Done.')
        else:
            print(f"File {local_fullpath} doesn't exist")

    def postrun(self):
        for cmd in self.extra_cmds:
            fcmd = [s.replace('~',Dotfile_local_home) for s in cmd]
            print(fcmd)
            subprocess.run(fcmd)

class DotfileExecuter():
    '''
    Wrapper class to interface between Command and Dotfile classes
    '''
    dotfile_list = defaultdict(Dotfile)

    def apply_fn(**kwargs):
        # global DotfileMap.dotfile_map
        if DotfileExecuter.dotfile_list is {}:
            Exception('Error: No dotfile map set')
        dotfile = DotfileExecuter.dotfile_list[list(kwargs)[1]]
        file = list(kwargs)[2] if len(kwargs) > 2 else None
        getattr(dotfile, list(kwargs)[0])(file)

    def list_all(**kwargs):
        for dotfile_name, dotfile in DotfileExecuter.dotfile_list.items():
            print(dotfile.name)

    def link_all(**kwargs):
        for dotfile_name, dotfile in DotfileExecuter.dotfile_list.items():
            if dotfile.install_all:
                dotfile.link()

    fn_map = {
        'unlink': apply_fn,
        'link': apply_fn,
        'list': list_all,
        'link_all': link_all,
    }

def Dotfiles(dotfiles: list[Dotfile]) -> dict[str, Dotfile]:
    return {d.name:d for d in dotfiles}