
## Why?

This minimal setup of **Dear ImGui** is intended to serve, in the future, as starting point for
- C++ tutorial/notes about
    - inheritance, polymorphism, use of virtual, vtable, pure virtual function/abstract class/interface, class layout, ...
    - OOP in C, polymorphism/vtable in C
- 2D CAD, start with reproducing what javidx9 did [here](https://www.youtube.com/watch?v=kxKKHKSMGIg)
- further GUI-related tinkering
- ...


## Setting up **Dear ImGui** for MinGW on Windows, using GLFW + OpenGL3

The goal of this project was to find a minimal setup that allows to use GCC as compiler and that wouldn't require the installation of Visual Studio.
The required tools are `Git, MinGW, GLFW, ImGui`.
This following explains (on way) how to get started with **Dear ImGui** on Windows. 

### How to reproduce, step-by-step

- requirements:
    - Git, Git Bash     (download/install from 'https://git-scm.com/downloads')
    - MinGW             (download/install from 'https://sourceforge.net/projects/mingw/')
    - GLFW              (see further below)
- git clone **Dear ImGui** using `git clone --recurse-submodules https://github.com/ocornut/imgui.git -b docking`. Repo will be in folder `imgui\`.
- create project-folder `PROJ`
- copy all files in `imgui\` that match `im*` to `PROJ`
- copy the license `imgui\LICENSE.txt` to `PROJ`
- copy files the following files to to `PROJ` (GLFW + OpenGL3):
    - `imgui_impl_glfw.h`
    - `imgui_impl_glfw.cpp`
    - `imgui_impl_opengl3.h`
    - `imgui_impl_opengl3.cpp`
    - `imgui_impl_opengl3_loader.h`
- copy `main.cpp` from `imgui\examples\example_glfw_opengl3` to `PROJ`

- download GLFW (compiled lib + headers) from 'https://www.glfw.org/download => 32-bit Windows binaries',
  e.g. to `Downloads\glfw-3.3.8.bin.WIN32`, and extract all
- copy `glfw3.dll` from `Downloads\glfw-3.3.8.bin.WIN32\glfw-3.3.8.bin.WIN32\lib-mingw` to `PROJ`
- add `Downloads\glfw-3.3.8.bin.WIN32\glfw-3.3.8.bin.WIN32\lib-mingw` in makefile to compiler/linker library search path (`-L`)
- add `Downloads\glfw-3.3.8.bin.WIN32\glfw-3.3.8.bin.WIN32\include` in makefile to compiler include paths (`-I`)

### Build & run

To build & run, execute the script `build.sh` in Git Bash shell:
```bash
bash build.sh
```

### Multiple Makefiles

Multiple makefiles for building the code are available.

The makefile `Makefile` builds all in one go, and is created with the goal of being simple and readable. The disadvantage of this is that you have to compile everything each time the build is triggered. Regardless of maybe only having made changes to one file, e.g. to `main.cpp`.

The makefile `Makefile_objs` compiles every obj individually and puts all build artefacts in one directory `build\`. This has the advantage that, once compiled, only changed files will be re-compiled in subsequent builds (followed by linking all to one exe).

Edit `build.sh` to set the makefile that's used when running the script.
For further details, inspect `Makefile`, `Makefile_objs`, `build.sh`.

To individually build/run/clean, directly call Make by running `mingw32-make.exe` in Git Bash as follows:
```bash
mingw32-make.exe --file=Makefile all
mingw32-make.exe --file=Makefile run
mingw32-make.exe --file=Makefile clean
```
Edit name of makefile as needed in the above command, i.e. `--file=Makefile` or `--file=Makefile_objs`.

To remove build artefacts and the ini-file created by ImGui of the respective build, use the following commands:
```bash
mingw32-make.exe --file=Makefile clean
mingw32-make.exe --file=Makefile_objs clean
```


## Notes

- used resources:
    - [Cherno :: BEST WAY to make Desktop Applications in C++](https://www.youtube.com/watch?v=vWXrFetSH8w)
    - [How to install Dear ImGUI on Visual Studio Code + MinGW + DirectX9!!!](https://www.youtube.com/watch?v=te29wTao-dA)
    - [ImGui + GLFW Tutorial - Install & Basics](https://www.youtube.com/watch?v=VRwhNKoxUtk)
    - [javidx9 :: Practical Polymorphism C++](https://www.youtube.com/watch?v=kxKKHKSMGIg)
- tested on systems:

    | OS         | GPU                    | GPU driver                   | MinGW's g++ version |
    |------------|------------------------|------------------------------|---------------------|
    | Windows 10 | Nvidia GeForce GT 525M | Nvidia driver version 376.54 | 6.3.0               |
    | Windows 10 | Nvidia RTX A2000       | Nvidia driver version 529.08 | 6.3.0               |
    |            |                        |                              |                     |
