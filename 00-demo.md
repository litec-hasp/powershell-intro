# What is reveal.js?

> "reveal.js is an open source HTML presentation framework. It enables anyone with a web browser to create beautiful presentations for free."

- To see it in action visit [reveal.js](https://revealjs.com/).
- Also have a look at the [github-repository](https://github.com/hakimel/reveal.js).

---

## reveal.js Feature Set

- Nested slides
- **Markdown support** *(that's the really cool stuff for us!)*
- Auto-Animate
- PDF export
- Speaker notes and preview
- LaTeX typesetting
- syntax highlighted code
- ...

-----

# Reaveal.js<br> Basic Usage & Showcase

## Shortcuts

- Slide overview: `Esc`
- Zoom:
  - Windows: `Alt+Click`
  - Linux: `Ctrl+Click`
- Speaker view: `S`

---

## Slide Transition

### Horizontal Transition

- Either create a new section in your `index.html`,
- or seperate your slides in your markdown document by
  - adding a newline and  
  - `-----` (5x)
  - and a newline

### Vertical Transition

- seperate you slides in your markdown dokument by
  - adding a newline and  
  - `---` (3x)
  - and a newline

---

## Fragments

- Use Arrow keys to see step by step fragments.
- HTML-comments are used for that: `<!-- .element: class="fragment" -->` <!-- .element: class="fragment" data-fragment-index="1" -->
- However, markdown file itself doesnt look that great. <!-- .element: class="fragment" data-fragment-index="3" -->
- Strange ordering is possible... <!-- .element: class="fragment" data-fragment-index="2" -->

---

## Speaker Notes

- To add notes to your slides (not visible during presentation).
- Add `Note:` and your text at the end of your slide.
- Try it our here - press `S` and see the note below in Speaker view.

Note:

This text is not visible in presentation mode!

---

<!-- .slide: data-background-gradient="linear-gradient(to bottom, #ff1493, #ffb6c1)" data-transition="zoom" -->
# PINK BACKGROUND WITH ZOOM IN! WHOO!

- For slide transitions (like zoom here) see [reveal.js transition](https://revealjs.com/transitions/).
- Different Backgrounds are possible
  - single colors (`data-background`)
  - gradients (shown here) (`data-background-gradient`)
  - gifs, videos
  - See [reveal.js background](https://revealjs.com/backgrounds/)
- **For the *important* pink color codes see [this link](https://html-color.codes/pink).**

-----

# Markdown Showcase

- Code Higlighting
- Classic markdown stuff, like
  - lists
  - tables
  - links and images
  - **bold** *italic* ~~striketrough~~
- See for example [Markdown CheatSheet](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet)
- ...and some examples below

---

### Code

with highlighting

```java [1-2|3|4]
public class foo {
    private int baa;
    public foo() {
    baa = 0;
    }
}
```

---

## Lists

### Unordered

- one
- two
  - sub
- three

### Ordered

1. one
1. two
   1. sub
1. three

---

## Math Example

`$$ J(\theta_0,\theta_1) = \sum_{i=0}^{10} a_i $$`

---

## Image Examples

### Link

![Github](https://pngimg.com/uploads/github/small/github_PNG67.png)

### Local

![LiTec-Logo](./img/LiTec-Logo.jpg)
