# 0 | Configure the environment for develop operating system
> If you want to develop an operating system, the first thing you need to do is configure the environment.  
> So let's configure it on linux.  
> Of course, you aslo can do it on windows or macos, but you can't use the method below.

## Step 0: Create project folder
* Create a folder that you want to use as a project folder.
* Open it in **Visual Studio Code** or other text editer.

## Step 1: Install nasm
* Launch your terminal in your project floder, and then enter the command to install the assembly compiler **nasm**:
  ```bash
  sudo apt install nasm
  ```
* After that, please enter the command `nasm --version` to make sure nasm is installed.

## Step 2: Install qemu
* Enter the command `sudo apt install qemu qemu-system-x86` to install qemu in your terminal.
* After that, please enter the command `qemu-system-x86_64` to make sure qemu is installed.

## Step 3: Create system image
* Enter the command `qemu-img create [system_name].img size=64M` (Replace **[system_name]** with your system name) in your terminal.

> You are done. Enjoy the code!
