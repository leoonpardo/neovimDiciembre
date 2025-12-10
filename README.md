# neovimDiciembre

## instalar neovim en windows
### en power shell como administrador
```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

```
## verificar la version
```
choco -v

```
## intalar neovim
```
choco install neovim -y

```
