# Latex

This document contains notes about latex syntax.

Contents:
:InsertToc

## Notes Dump
*   Structure

    ```latex
    \part{PartName}
    \chapter{ChapName}
    \section{SecName}
    \subsection{SubSecName}
    \subsubsection{SubSubSecName}
    \paragraph{PName}
    \subparagraph{SubPName}
    ```

*   Equations
    ```latex
    $equation$
    ```

*   LaTex to PDF conversion

    [TexLive](https://tug.org/texlive/)
    ```bash
    # install TexLive
    cd /tmp; wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
    zcat < install-tl-unx.tar.gz | tar xf -
    cd install-tl-*; sudo perl ./install-tl --no-interaction

    # add to PATH
    # /usr/local/texlive/YYYY/bin/PLATFORM

    tlmgr install <package>
    pdflatex <source.tex>
    pdftex <source.tex>
    ```

## See also
*   [Tex - A sophisticated typesetting engine](https://ctan.org/pkg/tex)
*   [Tex Live - Quick install for Unix](https://tug.org/texlive/quickinstall.html)

