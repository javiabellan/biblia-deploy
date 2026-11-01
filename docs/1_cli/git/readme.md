# Git




## Git basics

Undo local changes:
```bash
git checkout .  # Revert modified files (in this . directory)
git clean -fd   # Remove new untracked files (-f) and new directories (-d): 
```


Update all repos at once:
```bash
# See all repos status
find . -name .git -type d -execdir sh -c 'echo "\n\033[1m$(pwd)\033[0m"; git status' \;

# Update all repos
find . -name .git -type d -execdir sh -c 'echo "\n\033[1m$(pwd)\033[0m"; git pull' \;
```

https://stackoverflow.com/questions/24390040/is-it-possible-to-do-git-status-for-all-repos-in-subfolders



## Git setup

### 1. Git

Install git: `sudo pacman -S github-cli`

Configure git:
```bash
$ git config --global user.name "Javi"
$ git config --global user.email franfdk17@gmail.com
$ git config --global core.editor nano
```

### 2. Github


1. Go to Github.com -> Settings -> Developer settings -> Personal access tokens [https://github.com/settings/tokens](https://github.com/settings/tokens)
2. Generate a Personal Access Token (PAT) with the minimum required scopes are 'repo', 'read:org', 'workflow'
3. Copy the Personal Access Token
4. Go to the terminal and install the GitHub CLI
   - On Mac: `brew install gh`
   - On Archlinux: `sudo pacman -S github-cli`
5. In the terminal, enter `gh auth login`, then follow the prompts.
   - What account do you want to log into? **GitHub.com**
   - What is your preferred protocol for Git operations? **HTTPS**
   - Authenticate Git with your GitHub credentials? **Yes**
   - How would you like to authenticate GitHub CLI? **Paste an authentication token here**

> #### Old way (deprecated and unsecure)
> 1. Save in `~/.git-credentials` -> https://USER:PASS@github.com
> 2. Execute `git config --global credential.helper store `

https://atareao.es/software/programacion/github-en-el-terminal/






## Github Actions

Archivo YAML ubicado en: `.github/workflows/mi_nombre.yml`


### Basic syntax

Minimal action example:

```yaml
name: Simple workflow          # 1) Nombre de la acción/workflow [OPTIONAL]
on: [push]                     # 2) Cuando se ejecutará (el trigger) [REQUIRED]
jobs:                          # 3) Que hará
   example-job-1:              #    Trabajo 1
      runs-on: ubuntu-latest   #    Maquina virtual donde se ejecuta
      steps:                
         - run: echo "The job 1 was automatically triggered!"
```


### Ejemplos de triggers disponibles

```yaml
on:
   # MANUALMENTE (desde la interfaz de github)
   workflow_dispatch:

   # PERIODICAMENTE ( with delay :( )
   # Generally, the delay time is about 3 to 10 minutes.
   # Sometimes, it may be more, even dozens of minutes, or more than one hour.
   schedule:
      # * is a special character in YAML so you have to quote this string
      - cron:  '30 5,17 * * *'

   # Cuando haces un push al repo
   [push]

   # Cuando haces un push en la rama master
   push:
      branches:
            - master

   # Cuando te hacen crean un pull request o un issue
   [pull_request_target, issues]
```

### Ejemplos de acciones disponibles

- `run`: Acciones propias para ejecutar comandos
- `uses`: Acciones de terceros disponibles el github actions marketplace. sintaxis: `user/repo@version`.

```yaml
# ACCION QUE TE CLONA EL REPO EN LA MAQUINA VIRTUAL
- name: ⬇️ Checkout the repo
  uses: actions/checkout@master
  with:
    fetch-depth: 1

#######################

# ACCION QUE PONE EL PYTHON EN LA MAQUINA VIRTUAL
- name: 🐍 Set up Python 3.8
  uses: actions/setup-python@v2
  with:
    python-version: '3.8'

# ACCION QUE TE INSTALA ALGUN PAQUETE DE PYTHON
- name: 💿 Install Zotero2Readwise Python package
  run: pip install zotero2readwise

# ACCION QUE EJECUTA ALGUN SCRIPT DE PYTHON
- name: 🚀 Run Automation
  run: python run.py ${{ secrets.READWISE_TOKEN }} ${{ secrets.ZOTERO_KEY }} ${{ secrets.ZOTERO_ID }}

##################

- name: Give permision to some script
  run: chmod +x my_script

- name: Run script
  run: ./permision

##################

- name: Commit and push changes
  run: |
    git config --global user.name "your username"
    git config --global user.email "your email"

    git add -A
    git commit -m "commit message"
    git push
```



### Ejecucion de trabajos en paralelo

```yaml
name: Simple workflow  # Nombre de la acción/workflow
on: [push]             # Cuando se ejecuta (el trigger)
jobs:
   example-job-1:     # Trabajo 1
      runs-on: ubuntu-latest # Maquina virtual donde se ejecuta
      steps:
         - run: echo "The job 1 was automatically triggered!"
   
   example-job-1:     # Trabajo 2 (se ejecuta en paralelo al trabajo 1)
      runs-on: windows-latest # Maquina virtual donde se ejecuta
      steps:
         - run: echo "The job 2 was automatically triggered!"
```


### Ejecucion condicional

```yaml
name: Simple workflow  # Nombre de la acción/workflow
on: [push]             # Cuando se ejecuta (el trigger)
jobs:
   example-job-1:     # Trabajo 1
      runs-on: ubuntu-latest # Maquina virtual donde se ejecuta
      steps:
         - run: echo "The job 1 was automatically triggered!"
   
   example-job-1:     # Trabajo 2 (se ejecuta despues del trabajo 1)
      needs: example-job-1
      runs-on: windows-latest # Maquina virtual donde se ejecuta
      steps:
         - run: echo "The job 2 was automatically triggered!"
```

### References

- [Using Github Actions & Pages to Publish Static Pages Based on Dynamic Data](https://www.aaronsaray.com/2021/github-actions-pages-scheduled-data-updates) (Oct 2, 2021)
- [CI/CD for Machine Learning: Test and Deploy Your ML Model with GitHub Actions](https://dagshub.com/blog/ci-cd-for-machine-learning-test-and-and-deploy-your-ml-model-with-github-actions) (Jun 08, 2022)
