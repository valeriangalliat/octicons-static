# Static Octicons [![npm version](http://img.shields.io/npm/v/static-octicons.svg?style=flat-square)](https://www.npmjs.org/package/static-octicons)

> A static version of GitHub [Octicons](https://primer.style/octicons/).

## Overview

This package allows to use Octicons in vanilla HTML, with support for
changing their colors, using the following markup:

```html
<svg class="octicon octicon-rocket" width="16" height="16">
  <title>Rocket</title>
  <use href="node_modules/static-octicons/svg/rocket-16.svg#icon"></use>
</svg>
```

**Note:** for this to work the SVG must be [hosted on the same domain](https://stackoverflow.com/a/39663457/4324668).

All other methods (`<img>`, `<embed>`, `<object>`) don't allow for
manipulating the color or other attributes of the SVG. If you don't care
about this, you don't need this module and can can directly link to the
Octicons SVGs:

```html
<img alt="Rocket" class="octicon octicon-rocket" src="node_modules/@primer/octicons/build/svg/rocket-16.svg">
```

The reason we can't do the same with the `<use>` trick above is because
`<use>` [requires an ID](https://stackoverflow.com/q/47595422/4324668#comment82148461_47595422)
in the URL, and Octicons SVGs don't have an ID out of the box.

The only purpose of this package is to add `id="icon"` to all Octicons
SVGs so they can be used that way.

## Installation

```sh
npm install static-octicons
```

The icons are [built automatically](Makefile) from `@primer/octicons`
during the installation phase. Nothing is included in the package
itself to keep it as lightweight as possible.

## Usage

Icons are present in `node_modules/static-octicons/svg`. Use them like
this:

```html
<svg class="octicon octicon-rocket" width="16" height="16">
  <title>Rocket</title>
  <use href="node_modules/static-octicons/svg/rocket-16.svg#icon"></use>
</svg>
```

## A note about class names

In the above example, the `octicon-rocket` class is not really
necessary, I just include it to mimic what the Octicons library would
otherwise be doing. But it seems that only the `octicon` class matters.

You can use the following command to see all the Primer CSS styles that
depend on specific Octicons:

```sh
npx prettier --stdin-filepath primer.css < node_modules/@primer/css/dist/primer.css | grep '\.octicon-'
```

**Note:** here, we pretty print the minified CSS instead of looking
directly in the Sass code because that allows to get the full context of
the classes, as opposed to nested selectors. Also we pass the input CSS
to Prettier through stdin because it will otherwise ignore anything in
`node_modules` even if explicitly passed as an argument.

This gives us the following list:

```
.status-indicator-success .octicon-check {
.status-indicator-success .octicon-x {
.status-indicator-failed .octicon-check {
.status-indicator-failed .octicon-x {
.dropdown-item[aria-checked="false"] .octicon-check {
.markdown-body h1 .octicon-link,
.markdown-body h2 .octicon-link,
.markdown-body h3 .octicon-link,
.markdown-body h4 .octicon-link,
.markdown-body h5 .octicon-link,
.markdown-body h6 .octicon-link {
.markdown-body h1:hover .anchor .octicon-link,
.markdown-body h2:hover .anchor .octicon-link,
.markdown-body h3:hover .anchor .octicon-link,
.markdown-body h4:hover .anchor .octicon-link,
.markdown-body h5:hover .anchor .octicon-link,
.markdown-body h6:hover .anchor .octicon-link {
```

If you don't use any of those components, feel free to omit the specific
icon class and just keep `class="octicon"`.
