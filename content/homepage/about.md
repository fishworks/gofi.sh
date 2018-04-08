---
title: "About"
date: 2018-04-06
anchor: "about"
weight: 11
---

Fish works across all three major operating systems (Windows, MacOS, and Linux). It installs packages into its own directory and symlinks their files into `/usr/local` (or `C:\ProgramData` for Windows). You can think of it as the cross-platform Homebrew.

```shell
$ cd /usr/local/Fish
$ find Barrel
Barrel
Barrel/helm
Barrel/helm/2.8.2
Barrel/helm/2.8.2/darwin-amd64
Barrel/helm/2.8.2/darwin-amd64/LICENSE
Barrel/helm/2.8.2/darwin-amd64/README.md
Barrel/helm/2.8.2/darwin-amd64/helm
$ ls -l /usr/local/bin | grep helm
helm -> ../Fish/Barrel/helm/2.8.2/darwin-amd64/helm
```

Fish takes the ideas of [Homebrew Formulas](https://docs.brew.sh/Formula-Cookbook#homebrew-terminology) to the next level by installing pre-packaged tools. Fish food are simple Lua scripts:

```lua
local name = "helm"
local version = "2.8.2"

food = {
    name = name,
    description = "The Kubernetes Package Manager",
    homepage = "https://github.com/kubernetes/helm",
    version = version,
    packages = {
        {
            os = "darwin",
            arch = "amd64",
            url = "https://storage.googleapis.com/kubernetes-helm/helm-v" .. version .. "-darwin-amd64.tar.gz",
            sha256 = "a0a8cf462080b2bc391f38b7cf617618b189cdef9f071c06fa0068c2418cc413",
            resources = {
                {
                    path = "darwin-amd64/" .. name,
                    installpath = "bin/" .. name,
                    executable = true
                }
            }
        },
        {
            os = "linux",
            arch = "amd64",
            url = "https://storage.googleapis.com/kubernetes-helm/helm-v" .. version .. "-linux-amd64.tar.gz",
            sha256 = "614b5ac79de4336b37c9b26d528c6f2b94ee6ccacb94b0f4b8d9583a8dd122d3",
            resources = {
                {
                    path = "linux-amd64/" .. name,
                    installpath = "bin/" .. name,
                    executable = true
                }
            }
        },
        {
            os = "windows",
            arch = "amd64",
            url = "https://storage.googleapis.com/kubernetes-helm/helm-v" .. version .. "-windows-amd64.tar.gz",
            sha256 = "cb6ea5d60f202c752f1f0777e4bebd98c619a2c18e52468df7a302e783216f23",
            resources = {
                {
                    path = "windows-amd64\\" .. name .. ".exe",
                    installpath = "bin\\" .. name .. ".exe"
                }
            }
        }
    }
}
```
