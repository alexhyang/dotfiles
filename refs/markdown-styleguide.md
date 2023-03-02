# Markdown Style Guide Notes

This is my notes about Markdown Style Guide created by Google.

Contents:

* [Philosophy](#philosophy)
* [Document Layout](#document-layout)
* [Character line limit](#character-line-limit)
* [Lists](#lists)
* [Code](#code)
* [Links](#links)
* [HMTL](#hmtl)
* [References](#references)

## Philosophy
1.  Radical simplicity
2.  Readable source text
3.  Minimum viable documentation
4.  Better is better than perfect

## Document Layout
```
# Document Title
Short introduction.

[TOC]

## Topic
Content.

## See also

```
1.  `Document Title`: level one heading, should be the same as file name
2.  `Short introduction`: 1~3 sentences high-level overview of the topic
3.  `TOC`: can be generated automatically in Vim
4.  `Topic`: the rest of headings start from level 2
5.  `See also`: miscellaneous links

## Character line limit
```markdown
Lorem ipsum dolor sit amet. See the
[foo docs](https://gerrit.googlesource.com/gitiles/+/master/Documentation/markdown.md)
for details.
```

## Headings
Use ATX-style headings with (#).

## Lists
1.  use lazy numbering for long lists, use ordered list for small list
    ```
    1. foo
    1. bar
        1. foofoo
        1. barbar
    1. baz
    ```

2.  nested list spacing 
    ```markdown
    1.  2 spaces after a numbered list.
        4 space indent for wrapped text.
    2.  2 spaces again.

    *   3 spaces after a bullet.
        4 space indent for wrapped text.
        1.  2 spaces after a numbered list.
            8 space indent for the wrapped text of a nested list.
        2.  Looks nice, don't it?
    *   3 spaces after a bullet.
    ```

## Code
1.  inline `for short code quotations and field names`
2.  codeblocks `for code quotations more than one line`
    *   declare language
    *   four-space indenting also interpreted as a code block
    *   escape newlines with \
    *   nested codeblocks within lists
        ```markdown
        *   bullet 1
            
            ```c++
            int foo;
            ```
            
        *   bullet 2
        ```

        or use four-space indenting

        ```markdown
        *   bullet 1
            
            ```c++
            int foo;
            ```
            
        *   bullet 2
        ```

## Links
1.  whenever possible, shorten your links
2.  use informative Markdown link titles

## HMTL
Please prefer standard Markdown syntax wherever possible and avoid HTML hacks.

## References
* [Google Markdown style guide](https://google.github.io/styleguide/docguide/style.html)
* [Google Markdown Philosophy](https://google.github.io/styleguide/docguide/philosophy.html)

