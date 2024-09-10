# Latex

This document contains notes about latex syntax.

Contents:
:InsertToc

## Examples

```latex
% Document preamble, i.e., document setup
\documentclass{article} % article, report, book, letter, slides
\usepackage[T1]{fontenc} % package with name "fontenc", and argument "T1"

% Document body
\begin{document}
Hello World!

This is a my first document made with LaTeX.
\end{document}
```

## Misc
```latex
-    % hyphen
--   % en-dash
---  % em-dash
```

## Concepts

1.  *environments*: `\begin{...}` and `\end{...}` pairs
1.  *command*: `\xx{...}`


## Mathematics

In math mode, spaces are ignored and the correct spacing between characters is
(almost always) applied.

```latex
$a^{b}$ % superscript
$a_{b}$ % subscript
$\frac{x}{y}$ % fractions x/y

% equation
\begin{equation}
\end{equation}

\begin{align}  % requires amsmath package
\end{align}

% symbols
\mathbb{}

% size of brackets
\big, \Big, \bigg, \Bigg
\left, \right
```

## Structure

```latex
\part{PartName}
\chapter{ChapName}
\section{SecName}
\subsection{SubSecName}
\subsubsection{SubSubSecName}
\paragraph{PName}
\subparagraph{SubPName}
```

## Format

### text

```latex
% Italic, bold, underlined
\textbf{bold text}
\textit{italicized text}
\underline{underlined text}

% Font
\mathrm{} % requires amsmath package

% Ordered list
\begin{enumerate}
    \item first item
    \item second item
    \item third item
\end{enumerate}

% Unordered list
% use "itemize" environment rather than "enumerate"

% Quote
\begin{quote}
\end{quote}

% Table
\begin{tabular}{lll} % {lll} all three columns aligned to the left, also c, r
    (0,0) & (0,1) & (0,2) \\
    (1,0) & (1,1) & (1,2) \\
    (2,0) & (2,1) & (2,2) \\
\end{tabular}
```

### spacing

```latex
% line break
\\ % two back slashes
\newline
\hfill \break

% spacing
\hspace{}
\vspace{}
```

## Extending functionality

```latex
% Packages

% fontenc:  select font encodings
\usepackage[T1]{fontenc}
% geometry:  customize page layout
\usepackage[paper=letterpaper,left=25mm,right=25mm,top=3cm,bottom=25mm]{geometry}
% amsmath:  math typesetting
\usepackage{amsmath, amsfonts, amssymb}
% xcolor:  color extensions for LaTeX
\usepackage{xcolor}
% lipsum:  generate dummy text
\usepackage{lipsum}

\usepackage{graphicx}
\usepackage{array}

% New commands
\newcommand{\shorttitle}{short title of the document and more info} % define
\chead{\shorttitle} % use
```

## Command Line

```bash
# install TexLive
cd /tmp; wget https://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
zcat < install-tl-unx.tar.gz | tar xf -
cd install-tl-*; sudo perl ./install-tl --no-interaction

# add to PATH
# /usr/local/texlive/YYYY/bin/PLATFORM

# install packages
tlmgr install <package>

# compile to pdf
pdflatex <source.tex>
pdftex <source.tex>
```

## See also

*   [Learn LaTex](https://www.learnlatex.org/en/)
*   [Learn LaTex in 30 minutes](https://www.overleaf.com/learn/latex/Learn_LaTeX_in_30_minutes)
*   [amsmath user guide](https://texdoc.org/serve/amsmath/0)
*   [LaTeX 2e cheat sheet](https://mirror.csclub.uwaterloo.ca/CTAN/info/latexcheat/latexcheat/latexsheet.pdf), [local version](../cheatsheets/LaTeX_2e.pdf)
*   [LaTex 2e ref sheet for a thesis](https://mirror.csclub.uwaterloo.ca/CTAN/info/latex-refsheet/LaTeX_RefSheet.pdf), [local_version](../cheatsheets/LaTeX_2e_RefSheet.pdf)
*   [Tex - A sophisticated typesetting engine](https://ctan.org/pkg/tex)
*   [Tex Live - Quick install for Unix](https://tug.org/texlive/quickinstall.html)
*   [Base sources of LaTeX - CTAN](https://ctan.org/pkg/latex-base)
*   [CTAN packages - Comprehensive TeX Archive Network](https://ctan.org/pkg)
