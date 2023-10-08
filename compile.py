#!/usr/bin/python3
import subprocess
import sys, platform

def main():
    system = platform.system()
    if system == "Linux":
        subprocess.call(['./compiler/compile.sh']+sys.argv[1:])
    if system == "Windows":
        subprocess.call(['.\compiler\compile.bat']+sys.argv[1:])
    return

if __name__=="__main__":
    main()