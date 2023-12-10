Setup steps that have been taken to configure this Repl that are not self evident in the `.replit` and `replit.nix` file.

## 1. Install Quicklisp in to the `.quicklisp` folder

From bash:

```
curl https://beta.quicklisp.org/quicklisp.lisp -o .setup/quicklisp-setup.lisp
sbcl --load .setup/quicklisp-setup.lisp
```

From sbcl:

```
(quicklisp-quickstart:install :path ".quicklisp")
```

## 2. Build the lem-language-server

### Prerequisites

Required `lem` libraries:

 * From [`lem`](https://github.com/lem-project/lem/)
     * `lib/language-server`
     * `lib/lisp-syntax`
     * `lib/lsp-base`
     * `lib/socket-utils`
     * `src/base`
 * [`micros`](https://github.com/lem-project/micros)

Download the required libraries from the `lem` repo  (`lem` is a full-featured IDE and we just want the language-server).  Copy the required projects into the `.quicklisp/local-projects` folder.

> Note: I tried symlinking these folders into the `.quicklisp/local-projects` directory but it did not seem to work.

### Eliminating Dependency on `lem`

The `lem-language-server` has an unfortunate dependency on `lem` itself, but it's really just for the contents of `lem-base`. Making sure the systems that need it reference `lem-base` and replacing `lem:` references with `lem-base:` references might work?

### Fork the micros process without using Roswell

Out of box the `lem-language-server` runs the `micros` server in a separate process using the [Roswell](https://roswell.github.io/) cli. I was having issues with this, so I changed it to use [fork](https://gitlab.common-lisp.net/qitab/poiu/-/blob/master/fork.lisp?ref_type=heads).

### Installing

Quickload all the dependencies by launching a `quicklisp` + `sbcl` repl: `sbcl --load .quicklisp/setup.lisp` and then run:

```
(ql:register-local-projects)
(ql:quickload "lem-language-server")
```
