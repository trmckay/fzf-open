import os
import sys
from shutil import copyfile
import subprocess

RESOURCES_PATH = "/usr/share/fzf-open/"
CONFIG_REL_PATH = "/.config/fzf-open/"
CONFIG_PATH = os.environ["HOME"] + CONFIG_REL_PATH

def open_file(path, config):
    os.system(config["OPENER"] + " " + path)

def get_path(config):
    if (config["SPAWN_TERM"]):
        cmd =\
            config["TERMINAL"] +\
            " " + config["WIN_TITLE_FLAG"] + " " + config["WIN_TITLE"] + " -e" +\
            "/bin/sh -c \'cd " + config["STARTING_DIR"] +\
            "; fzf > /tmp/fzf-open; echo $# >> /tmp/fzf-open\'"
    else:
        cmd ="cd " + config["STARTING_DIR"] + "; fzf > /tmp/fzf-open; echo $# >> /tmp/fzf-open"
    os.system(cmd)
    try:
        lines = open("/tmp/fzf-open", "r").readlines()
        return config["STARTING_DIR"] + "/" + lines[0]
    except:
        return ""

def create_config_dir():
    os.mkdir(CONFIG_PATH)
    copyfile(RESOURCES_PATH + "lopen.sh", CONFIG_PATH + "lopen.sh")
    os.system("chmod 777 " + CONFIG_PATH + "lopen.sh")

def read_flags(argv, config):
    for i in range(1, len(argv)):
        if argv[i] == "-n":
            config["SPAWN_TERM"] = True
        if argv[i] == "-o" and i < len(argv)-1:
            config["OPENER"] = argv[i+1]
        if argv[i] == "-d" and i < len(argv)-1:
            config["STARTING_DIR"] = argv[i+1]
        if argv[i] == "-t" and i < len(argv)-1:
            config["TERMINAL"] = argv[i+1]
    return config

def read_config(config):
    try:
        with open(CONFIG_PATH + "config", "r") as f:
            lines = f.readlines()
            for line in lines:
                keyval=line.split("=")
                if keyval[0] == "SPAWN_TERM":
                    config[keyval[0]] = bool(keyval[1][:-1])
                else:
                    config[keyval[0]] = keyval[1][:-1]
    except IOError:
        print("No config file found, creating one")
        open(CONFIG_PATH + "config", "w+")

    return config

def main():
    config = {
        "OPENER": CONFIG_PATH + "lopen.sh",
        "TERMINAL" : "xterm",
        "STARTING_DIR" : os.environ["HOME"],
        "WIN_TITLE_FLAG" : "--title",
        "WIN_TITLE": "fzf-open-run",
        "SPAWN_TERM": False
    }
    if not os.path.exists(CONFIG_PATH):
        create_config_dir()
    config = read_config(config)
    config = read_flags(sys.argv, config)
    path = get_path(config)
    open_file(path, config)

if __name__ == "__main__":
    main()
