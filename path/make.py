import sys
import os
if(len(sys.argv) == 1):
    sys.exit("FILE NAME NOT GIVEN")
arg = str(sys.argv[1])
ext = arg.split(".")[-1]
name = ".".join(arg.split(".")[:-1])
# name = name.split("\\")[-1]
# print(name)
if(ext == "py"):
    os.system(f"py {arg}")
elif(ext == "rs"):
    src = name.split("\\")
    if src[-2] == "src":
        os.system("cargo build && cargo run")
    else:
        os.system(f"rustc {arg} && {name}")
else:
    print(arg)
    sys.exit("Build function for filetype" + ext + "not given")
