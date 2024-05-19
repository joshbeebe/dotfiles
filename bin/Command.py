class Command():
    def __init__(self, sys_argv: [str], fn_map: dict[str, callable]) -> None:
        """Simple class to interpret and run commands
        Arguments may be provided with '='
        In the form of
        cmd arg1 arg2=123 arg3

        Args:
            sys_argv (str]): input received from user (usually sys.argv)
            fn_map (dict[str, callable]): Map of sub-commands to executable functions
        """
        self.sys_argv = sys_argv
        self.function_map = fn_map
        self.parsed_kwargs = {}
        self.run()
        
    def run(self):
        # argv[0] is executable path
        fn = self.sys_argv[1]
        for a in self.sys_argv[1:]:
            arg_val = a.split('=')
            arg = arg_val[0]
            val = arg_val[1] if len(arg_val) == 2 else None
            self.parsed_kwargs[arg] = val

        if fn in self.function_map:
            self.function_map[fn](**self.parsed_kwargs)
