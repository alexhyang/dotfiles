# Advanced Vim Commands

This document lists some of the most commonly used advanced Vim commands.

Contents:
:InsertToc

## Tasks

```vim
" Tabs & Windows
:sp         " split window horizontally
:vsp        " split window vertically
:tabnew     " create new tab
:tabedit    " open file in new tab
:ls         " display a list of all open tabs
gt/gT       " go to next/previous tab (:tabnext, :tabprevious)

" Key Mappings
:verbose map {key} " display mapping if it exist
:map               " create mappings for both normal and visual modes
:noremap           " similar to :map but non-recursivve
:nmap              " normal mode map
:nnoremap          " normal mode non-recursive map
:imap              " insert mode map
:inoremap          " insert mode non-recursive map
:vmap              " vnsert mode map
:vnoremap          " vnsert mode non-recursive map
" recursive:
"     triggers other mappings that are defined, potentially
"     overriding existing mappings
" non-recursive:
"     does not trigger other mappings,
"     generally preferred to prevent unexpected side effects

```

## References

- [Mapping keys in Vim (Part 1) - Vim Tips Wiki](https://vim.fandom.com/wiki/Mapping_keys_in_Vim_-_Tutorial_(Part_1))
- [Using tab pages - Vim Tips Wiki](https://vim.fandom.com/wiki/Using_tab_pages)
