# reveal.js-template

A template to generate [reveal.js](https://revealjs.com/) markdown presentation repositories with reaveal.js as submodule.

This template uses reveal.js version 4.4.0 (see [reveal.js (github)](https://github.com/hakimel/reveal.js) for latest reveal.js tag).
See [how to host reveal.js on github-pages](https://martinomensio.medium.com/how-to-host-reveal-js-slides-on-github-pages-and-have-a-tidy-repository-1a363944c38d) on how to update to a newer version.

## Demo

Have a look at the demo github pages of this template repo: <https://litec-lectures.github.io/tmpl-reveal.js/>.

## Setup

1. Create a new github repo which uses this template.
   - start with a public repo and change this to a private after complete setup
3. Activate github pages within this repository (see `Settings -> Pages`) - most of the time using the main branch is ok.
4. If you clone the repo locally:
   1. Get the submodule files with `git submodule update --init --recursive`.
   2. Checkout the latest reveal.js commit from master with `git submodule update --remote`.
   3. For testing purposes run a local server - for example with `vscode` and `live server` plugin.
5. Add own markdown files (sadly without yaml header!) and adapt `index.html` accordingly.
6. Upload (commit/push) changes to github.

For a detailed explanation see [pachanero-revealjs-template](https://github.com/pacharanero/create-new-revealjs-template).

## Sources

- [reveal.js](https://revealjs.com/)
- [reveal.js (github)](https://github.com/hakimel/reveal.js)
- [how to host reveal.js on github-pages](https://martinomensio.medium.com/how-to-host-reveal-js-slides-on-github-pages-and-have-a-tidy-repository-1a363944c38d)
- [pacharanero-revealjs-template](https://github.com/pacharanero/create-new-revealjs-template)
