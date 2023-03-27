# Dotfile workflow

This document contains notes about how dotfiles interact with each other.

*   Zsh
    ```plaintext
    .zshrc  ----- .aliases       // cross-machine aliases
              |
               -- .shell_utils   // cross-machine shell utilities
              |
               -- .local_env     // local paths and environment variables
    ```

*   Bash
    ```plaintext
    .bashrc  ----- .aliases       // cross-machine aliases
               |
                -- .shell_utils   // cross-machine shell utilities
               |
                -- .local_env     // local paths and environment variables
               |
                -- .bash_aliases  // zsh plugin aliases (git)
    ```
