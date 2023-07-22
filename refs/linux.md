# Linux

This document contains notes about Linux.

Contents:
:InsertToc

## Check system information
*   system information:

    ```bash
    uname -a            # show all information
    uname -r            # show Linux kernel version
    cat /etc/os-release # show OS release information
    ```

## Package Management
*   package management systems
    *   Debian/Ubuntu: `.deb` packages by `apt` and `dpkg`
    *   Rocky/Fedora/RHEL: `.rpm` packages by `yum`
    *   FreeBSD: `.txz` packages by `pkg`

*   apt: high level package manager
    ```bash
    # apt
    sudo apt update                # update local database of packages available, run especially before installing or upgrading packages
    sudo apt upgrade               # upgrade installed packages
    sudo apt install <package>     # install package from repositories
    sudo apt remove <package>      # remove installed packages
    apt search <search_string>     # search a package using keyword
    apt show <package>             # show detailed descriptions of packages
    apt list --installed <pattern> # show installed packages matching given pattern, similar to dpkg -l <pattern>

    # apt-get (same as apt)
    apt-get update
    apt-get upgrade
    apt-get install
    apt-get remove

    # apt-cache (nearly the same as apt)
    apt-cache search <query>
    apt-cache show <package>
    apt-cache policy <package>   # show whether package is installed and up to date
    apt-cache depends <package>  # show dependencies for a package
    apt-cache rdepends <package> # show packages that depend on this package
    ```

*   dpkg: low level package manager
    ```bash
    sudo dpkg -i <path_to_file.deb> # install package from local files
    sudo dpgk -r <package_name>     # remove a package
    dpkg -l <pattern>               # list installed packages

    dpkg-deb                        # pack, unpack and provide information about Debian archives
    dpkg-query                      # shows information about installed packages
    dpkg-query --list               # list all installed packages
    dpkg-query --list <pattern>     # list installed packages matching a pattern
    dpkg-query --status <package>   # show information about a package
    ```

*   configurations:
    ```bash
    [sudo] update-alternatives --config editor # show text editors, * in use
    ```

## File Management
```bash
bash; shopt -s dotglob; mv <source-files> <desti-files>  # move hidden files

```


## References
*   [Tutorial: Package Management Essentials: apt, yum, dnf, pkg](https://www.digitalocean.com/community/tutorials/package-management-basics-apt-yum-dnf-pkg)
*   [How to check OS version in Linux terminal](https://www.cyberciti.biz/faq/how-to-check-os-version-in-linux-command-line/)

## See Also
*   [Tutorial: Ubuntu and Debian Package Management Essentials](https://www.digitalocean.com/community/tutorials/ubuntu-and-debian-package-management-essentials)
