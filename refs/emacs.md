# Emacs

This document contains notes about Emacs.

## Notes

*   system:
    C-x C-c: quit emacs
    C-x C-s: save file
    C-u [n] <command>: repeat command n times

*   motion:                backward     forward

    character              C-b          C-f
    word                   M-b          M-f
    line                   C-p          C-n
    line beginning/end     C-a          C-e
    sentence               M-a          M-e
    paragraph              M-{          M-}
    page                   C-x [        C-x ]
    sexp                   C-M-b        C-M-f
    function               C-M-a        C-M-e
    buffer begining/end    M-<          M->

    scroll to next screen           C-v
    scroll to previous screen       M-v
    scroll left/right               C-x <,  C-x >

    goto line                       M-g g
    goto char                       M-g c
    back to indentation             M-m

*   editing:

    undo                   C-x u, or C-/
    start marking          C-SPC
    mark paragraph         M-h
    mark page              C-x C-p

    delete:                backward     forward

    character              del          C-d
    word                   M-del        M-d
    line                   M-0 C-k      C-k
    sentence               C-x del      M-k
    sexp                   M-- C-M-k    C-M-k

    (killed content can be yanked)
    kill region            C-w
    yank content           C-y

## References
*   [fff]()
