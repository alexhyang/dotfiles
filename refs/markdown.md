# Markdown 

This document contains notes about markdown syntax basics.

Contents:

* [Headings](#headings)
* [Paragraphs](#paragraphs)
* [Line Breaks](#line-breaks)
* [Emphasis](#emphasis)
* [Blockquotes](#blockquotes)
* [Lists](#lists)
* [Code Blocks](#code-blocks)
* [Horizontal Rules](#horizontal-rules)
* [Links](#links)
* [Images](#images)
* [Escaping Characters](#escaping-characters)
* [Next heading 2](#next-heading-2)
* [Markdown to PDF conversion](#markdown-to-pdf-conversion)
* [References](#references)

## Headings
```
# Heading 1
## Heading 2
### Heading 3
...
```

Notes:
leave space before heading and between heading marker (#) and content.

## Paragraphs
Notes: 
1.  use a blank line to create a paragraph
2.  don't indent paragraphs unless under a list

## Line Breaks
Notes: 
1.  \<br\> is not recommended because "some editors and IDEs will have trailing 
    whitespace presubmit check in place, and many IDEs will clean it up"
2.  trailing whitespace is not recommended because some IDE or autoformmater 
    will trim spaces
3.  simply use blank lines to create new paragraphs

## Emphasis
```
**bold**
*italic*
***bold and italic***
```

## Blockquotes
```
> blockquote
>> nested blockquote
```

## Lists
1.  ordered lists
    ```
    1.  item 1
        1.  nested item 1-1
        2.  nested itme 1-2
    2.  item 2
    1.  item 3
    ```
2.  unordered lists
    ```
    *   item 1
    *   item 2
    ```
3.  unordered list with starting numbers
    ```
    *   1968\. A great year!
    ```
4.  adding elements in lists

    indent the element four spaces to preserve the continuity of the list
    ```
    *   first item
        description about the first item
    *   seconde item
        > description about the second item
    ```

## Code Blocks
1.  inline code
    ```
    `inline code`
    ```

2.  code blocks
    ````
    ```
    code block with triple backticks
    ```
    ````

    see [Escaping Characters](#escaping-characters)

## Horizontal Rules
Notes:
add blank lines before and after horizontal rules
```
text 1

---

text 2
```

## Links
1.  titles for links
    ```markdown
    [link](<url> "title")
    ```

2.  URLs and Email Addresses
    ```markdown
    <https://google.com>
    <firstname.lastname@example.com>
    ```

3.  formatting links
    ```
    This is a **[bold link](https://google.com)**.
    This is a *[italic link](https://google.com)*.
    This is a [`link in code form`](#code-blocks).
    ```

4.  reference-style links
    ```markdown
    [reference][1] in context
    [1]: http://google.com "title of this reference"

    this is equavilent to:
    [reference](http://google.com "title of this reference")
    ```

    example: A reference to [Google][1]

## Images
1.  use markdown syntax
    ```markdown
    ![image alternate text](<img-url or relative path> "title")
    [![clickable image alternate text](<img-url or relative path> "title")](<another link>)
    ```

    ![fox image](https://pbs.twimg.com/media/Fik1kbbWIAIYv5m?format=jpg&name=small "unclickable image")

    [![fox image](https://pbs.twimg.com/media/Fik1kbbWIAIYv5m?format=jpg&name=small "clickable image")](https://pbs.twimg.com/media/Fik1kbbWIAIYv5m?format=jpg&name=small)

    ```markdown
    ![fox image](https://pbs.twimg.com/media/Fik1kbbWIAIYv5m?format=jpg&name=small "unclickable image")
    [![fox image](https://pbs.twimg.com/media/Fik1kbbWIAIYv5m?format=jpg&name=small "clickable image")](https://pbs.twimg.com/media/Fik1kbbWIAIYv5m?format=jpg&name=small)
    ```

2.  use HTML syntax

    Markdown was originally designed with the capability to be converted to 
    valid XHTML or HTML. Basic inline HTML tags may be supported.

    <img src="https://pbs.twimg.com/media/Fik1kbbWIAIYv5m?format=jpg&name=small" 
    alt="fox" title="formatted image with raw HTML tag" width="50%">

    ```html
    <img src="https://pbs.twimg.com/media/Fik1kbbWIAIYv5m?format=jpg&name=small" alt="fox" title="formatted image with raw HTML tag" width="50%">
    ```

    or with figure caption:

    ```html
    <figure>
      <img src="https://pbs.twimg.com/media/Fik1kbbWIAIYv5m?format=jpg&name=small" alt="fox" title="formatted image with raw HTML tag" width="50%">
      <figcaption style="text-align: center;"> this is figure caption</figcaption>
    </figure>
    ```

## Escaping Characters
Escape literal characters by placing a backslash (\\) in front of them.

A list of characters that can be escaped:
*   `\` | backslash
*   `` ` `` | backtick

        ``use double backticks to escape single backtick ` for inline code``

        ````
        ```
        use quadruple backticks to escape triple backticks in code block
        ```
        ````
    see [Code](#code-blocks)
*   `*` | asterisk
*   `_` | underscore
*   `{ }` | curly braces
*   `[ ]` | brackets
*   `< >` | angle brackets
*   `( )` | parentheses
*   `#` | pound sign
*   `+` | plus sign
*   `-` | minus sign/hyphen
*   `.` | dot
*   `!` | exclamation mark

## Next heading 2
<mark>continue from extended syntax</mark>.

## Markdown to PDF conversion
[Markdown to PDF](https://www.npmjs.com/package/md-to-pdf)
    ```
    npm i -g md-to-pdf
    md-to-pdf [options] <path-to-file.md>
    ```

## References
*   [Markdown Guide - Basic Syntax](https://www.markdownguide.org/basic-syntax/)
*   [Markdown Guide - Extended Syntax](https://www.markdownguide.org/extended-syntax)
*   [CommonMark Spec (v0.30, 2021-06-19)](https://spec.commonmark.org/0.30/)
*   [Markdown Widipedia page](https://en.wikipedia.org/wiki/Markdown)
*   [1]: https://google.com "title for this reference"
