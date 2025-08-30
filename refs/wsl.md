# Title

This document contains notes about WSL2.

Contents:
:InsertToc

## Notes

*   Tilix: a terminal enumerator (similar to Windows Terminal)
*   WSL: Linux on Windows
*   WSL 2 improves file system performance and adds full system call
    compatibility

*   commands
    ```powershell
    wsl --install

    # list available distros online
    wsl --list --online

    # list installed distros
    wsl --list --verbose

    # check wsl status, version, update wsl
    wsl --status
    wsl --version
    wsl --update

    # help file
    wsl --help
    ```

## References
*   [WSL Documentation](https://learn.microsoft.com/en-ca/windows/wsl/)
*   [Run Linux GUI apps on WSL](https://learn.microsoft.com/en-ca/windows/wsl/tutorials/gui-apps)
*   [WSL2-Linux-Kernel releases](https://github.com/microsoft/WSL2-Linux-Kernel/releases)
*   [WSL 1 vs. WSL 2](https://learn.microsoft.com/en-ca/windows/wsl/compare-versions)
*   [Tilix](https://gnunn1.github.io/tilix-web/)
