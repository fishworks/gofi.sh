---
title: "Install"
date: 2018-04-06
anchor: "install"
weight: 12
---

MacOS/Linux:

```
curl -fsSL https://raw.githubusercontent.com/fishworks/fish/master/scripts/install.sh | bash
```

Windows (Powershell, as Administrator):

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force
iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/fishworks/fish/master/scripts/install.ps1'))
```

After running one of the install scripts:

```
gofish init
```

Once you have fish up and running, you can upgrade at any time using

```
gofish install gofish
```

Then:

```
gofish upgrade gofish
```

{{% block note %}}
Please inspect the install scripts prior to running them to ensure your OS's safety. I trust my own code, but you should verify the security and contents of any script from the internet you are not familiar with.
{{% /block %}}
