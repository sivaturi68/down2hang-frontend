import os
import subprocess

# !!! IMPORTANT: run this from the down_two_hang dir

files = os.listdir('./lib/icons/')
files = list(filter(lambda x: x.endswith('.svg'), files))

if len(files) == 0:
    print('no files found, exiting')
    exit(1)

for fi in files:
    command = f'dart run vector_graphics_compiler -i ./lib/icons/{fi} -o ./lib/icons/{fi}.vec'
    command = command.split()
    print(f'command: {command}')
    p = subprocess.Popen(command, shell=True)
    p.wait()
