# One Midnight theme for Emacs

![Atom One Dark theme screenshot](http://i.imgur.com/qDnlEYc.png)

## Installation

### With `straight.el`

```elisp
(use-package one-midnight :straight (:type git :host github :repo "one-midnight-theme/one-midnight.el"))
```

### Manual

First, clone this repo:

```console
$ git clone https://github.com/jonathanchu/one-midnight.el.git
```

Then, add this to your Emacs config:

```elisp
(add-to-list 'custom-theme-load-path "~/.emacs.d/path/to/one-midnight.el/")
```

## Configuration

To load this theme on Emacs startup and make it the default, add this
to your Emacs config:

```elisp
(load-theme 'one-midnight t)
```