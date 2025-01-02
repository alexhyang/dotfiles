# C Programs

This document contains notes about C tips in assignment 4.

Contents:
:InsertToc

## Notes

1.  structure of C program

    ```c
    #include <stdlib.h>
    #include <string.h>
    #include <stdio.h>

    // stdlib.h: malloc()
    // stdio.h : printf()
    ```

1.  compiling C program

    ```bash
    gcc -std=gnu11 -g -o example example.c
    # -std       : determine the language standard
    # -o example : output file with name "example"
    # -g         : producing debugging information
    # -Og        : optimizing debugging experience
    # -Wall      : enable most compiler warnings
    # -Wno-unused-function : disables warnings about used functions
    ```

1.  debugging C program

    ```bash
    gcc -std=gnu11 -g -o example example.c
    gdb example
    ```

    commands in debugger:
    *   b <location>: set breakpoint (e.g. b test.c:13)
    *   run [arguments]: run the program
    *   bt: print out a back-trace
    *   p <variable>: print out the given value/expression
    *   s, n: step into the call, step to the next line
    *   cont: countinue
    *   help: get help
    *   <Enter>: repeat the last command

1.  Makefile

    1.  syntax: make sure to use tab to indent commands_to_make_output

        ```make
        target: input1 input2 input3
                commands_to_make_output
        ```

    1.  example:

        ```make
        CFLAGS += -std=gnu11 -g
        EXES    = greet

        all: $(EXES)
        clean:
                rm -f $(EXES)
        greet: greet.c

        # do not treat `all` and `clean` as file targets
        # `all` and `clean` will be the arguments of `make` command
        # e.g. make all, make clean
        .PHONY: all clean
        ```

    1.  build

        without an argument, `make` builds the very first target in the file,
        i.e., `all` in this case.

    1.  other notes about make

        *   make has built-in implicit rules for several common compilers and
            tools, e.g. C compiler (cc, gcc for *.c), C++ compiler (g++, c++
            for *.cpp, *.cc, *.C, *.cxx), assembler (as for *.s)
            ([ref](https://www.gnu.org/software/make/manual/html_node/Catalogue-of-Rules.html))

        *   An object file (xxx.o) will be created for each source file,
            before linking them together and generating the final executable.

1.  memory check

    ```bash
    valgrind --tool=memcheck --leak-check=yes ./example
    # --leack-check: no, summary, full
    # --tool: memcheck, etc.
    # more see
    man valgrind
    ```

    memory check error fix tips:

    *   memory leaks:
        not freeing allocated memory

    *   invalid free:
        freeing unallocated memory

    *   invalid read/write:
        *   when: accessing memory that you shouldn't (eg. out-of-bounds array
            or using a dangling point)

    *   uninitialised value was created by a heap allocation:
        *   when: use variables or memory that have not been initialized,
            leading to unpredictable behavior.
        *   why: the newly allocated space has garbage values
        *   how to fix: assign initial values to this space

    *   bad permissions for mapped region at address

## References
*   [C standard library - wikipedia](https://en.wikipedia.org/wiki/C_standard_library)
*   [GDB: The GNU Project Debugger](https://www.sourceware.org/gdb/)
*   [make documentation - GUN](https://www.gnu.org/software/make/manual/make.html)
