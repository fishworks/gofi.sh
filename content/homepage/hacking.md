---
title: "Hacking up GoFish 🍣"
date: 2018-04-08
anchor: "hacking"
weight: 41
---

This guide is for developers who want to improve Fish. These instructions will help you set up a
development environment for working on the GoFish source code.

## Prerequisites

To compile and test GoFish, you will need:

- [git](https://git-scm.com/)
- [Go](https://golang.org/) 1.10 or later

In most cases, install each prerequisite according to its instructions.

## Fork the Repository

Begin at Github by forking GoFish, then clone your fork locally. Since GoFish is a Go package, it
should be located at $GOPATH/src/github.com/fishworks/gofish.

```
$ mkdir -p $GOPATH/src/github.com/fishworks
$ cd $GOPATH/src/github.com/fishworks
$ git clone git@github.com:<username>/gofish.git
$ cd gofish
```

Add the conventional [upstream](https://help.github.com/articles/fork-a-repo/) git remote in order
to fetch changes from GoFish's main master branch and to create pull requests:

```
$ git remote add upstream https://github.com/fishworks/gofish.git
```

## Make your Changes

With the prerequisites installed and your fork of GoFish cloned, you can make changes to local GoFish
source code.

Run `make` to build GoFish:

```
$ make bootstrap
$ make
```

## Test your Changes

GoFish includes a suite of tests:

- `make test-lint`: runs linter/style checks
- `make test-unit`: runs basic unit tests
- `make test`: runs all of the above
