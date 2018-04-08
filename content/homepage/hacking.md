---
title: "Hacking up Fish 🍣"
date: 2018-04-08
anchor: "hacking"
weight: 41
---

This guide is for developers who want to improve Fish. These instructions will help you set up a
development environment for working on the Fish source code.

## Prerequisites

To compile and test Fish, you will need:

- [git](https://git-scm.com/)
- [Go](https://golang.org/) 1.10 or later

In most cases, install each prerequisite according to its instructions.

## Fork the Repository

Begin at Github by forking Fish, then clone your fork locally. Since Fish is a Go package, it
should be located at $GOPATH/src/github.com/fishworks/fish.

```shell
$ mkdir -p $GOPATH/src/github.com/fishworks
$ cd $GOPATH/src/github.com/fishworks
$ git clone git@github.com:<username>/fish.git
$ cd fish
```

Add the conventional [upstream](https://help.github.com/articles/fork-a-repo/) git remote in order
to fetch changes from Fish's main master branch and to create pull requests:

```shell
$ git remote add upstream https://github.com/fishworks/fish.git
```

## Make your Changes

With the prerequisites installed and your fork of Fish cloned, you can make changes to local Fish
source code.

Run `make` to build Fish:

```shell
$ make bootstrap
$ make
```

## Test your Changes

Fish includes a suite of tests:

- `make test-lint`: runs linter/style checks
- `make test-unit`: runs basic unit tests
- `make test`: runs all of the above

## PR your Changes

Once you're finished with your changes, read through the [Contributing Guidelines](#contributing) to
get your code merged upstream.
