# Advanced Vim Commands

This document lists some of the most commonly used advanced Vim commands.

Contents:

* [Tabs & Windows](#tabs-&-windows)
* [Key Mappings](#key-mappings)
* [Programming](#programming)
* [References](#references)

## Tabs & Windows
```vim
:sp         " split window horizontally
:vs(p)      " split window vertically
^w + hjkl   " navigate to window
^w + HJKL   " move window
^w + x      " switch window with next one
^w + r      " rotate windows
^w + >      " increase window width
^w + <      " decrease window width
^w + +      " increase window height
^w + -      " decrease window height

:tabnew     " create new tab
:tabedit    " open file in new tab
:ls         " show all buffers
gt/gT       " go to next/previous tab (:tabnext, :tabprevious)
```

## Key Mappings
```vim
:verbose map {key}    " display mapping if it exist
:filter /pattern/ map " search pattern in key mapping
:map                  " create mappings for both normal and visual modes
:noremap              " similar to :map but non-recursivve
:nmap                 " normal mode map
:nnoremap             " normal mode non-recursive map
:imap                 " insert mode map
:inoremap             " insert mode non-recursive map
:vmap                 " vnsert mode map
:vnoremap             " vnsert mode non-recursive map
" recursive:
"     triggers other mappings that are defined, potentially
"     overriding existing mappings
" non-recursive:
"     does not trigger other mappings,
"     generally preferred to prevent unexpected side effects
```

## Programming

### general
```vim
^p      " (plug-ctrlp) file fuzzy finder
^j / ^k " (plug-ale) navigate between errors
gd      " go to definition
```

### markdown
```vim
za/zc   " expand/collapse the current header
zA/zC   " expand/collapse the current header to the bottom/top
zr/zm   " expand/collapse all headers of the same level
zR/zM   " expand/collapse all headers
]]/[[   " go to next/previous header
][/[]   " go to next/previous sibling header
]c      " go to current header
]u      " go to parent header
:Toc    " open table of contents panel
```

## References

- [Mapping keys in Vim (Part 1) - Vim Tips Wiki](https://vim.fandom.com/wiki/Mapping_keys_in_Vim_-_Tutorial_\(Part_1\))
- [Using tab pages - Vim Tips Wiki](https://vim.fandom.com/wiki/Using_tab_pages)
