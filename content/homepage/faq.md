---
title: "FAQ"
date: 2018-04-07
anchor: "faq"
weight: 30
---

## How do I get started?

After running one of the [install scripts](#install):

```
gofish init
```

## How do I update my local packages?

First update the rigs:

```
gofish update
```

You can now find out what is outdated with:

```
gofish rotten
```

Upgrade everything with:

```
gofish upgrade
```

Or upgrade a particular fish food with:

```
gofish upgrade <food>
```

For example, to upgrade GoFish:

```
gofish upgrade gofish
```

## How do I uninstall old versions of a fish food?

By default, GoFish does not uninstall old versions of fish food, so over time you will accumulate old
versions. To remove them, simply use:

```
gofish cleanup <food>
```

or clean up everything at once:

```
gofish cleanup
```

or to see what would be cleaned up:

```
gofish cleanup -n
```

## Where does stuff get downloaded?

GoFish stores downloaded files to either `~/Library/Caches/gofish` for macOS, `~/.gofish` for Linux, and
`%APPDATA%/Local/gofish` for Windows. See `gofish tank` to know more about GoFish's environment.

## Why can't you support Homebrew formulas?

GoFish aims to work across all three major operating systems. Most Homebrew formulas in core work
based on compiling a package from source and symlinking the result in other parts of `/usr/local`.
Because compiling from source differs vastly between all three operating systems, it didn't feel
right to provide such a system for the initial release.

However, certain formulae provide pre-compiled versions known as bottles, which are available at
https://bintray.com/homebrew/bottles. GoFish can use these pre-compiled bottles to get *some*
compatibility with Homebrew.

## I have packages I installed with Homebrew, however I want to use GoFish instead. How?

```
brew unlink foo
gofish install foo
```

## How can I add something to the FAQ?

Something missing? Feel like [making a contribution?](https://github.com/fishworks/gofi.sh)
