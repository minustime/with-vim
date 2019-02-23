# With Vim

Container with pre-configured shell and editor. Used to keep a familiar dev experience when exploring new languages, tools, etc.

## Usage

### With local files

To work on local files inside a `./workspace` directory:

```
$ docker run -it -v `pwd`/workspace:/opt/workspace minustime/with-vim:ubuntu-bionic
```

_OR_

Create a function in your .bashrc file to execute the container against any directory:

```

// In .bashrc
function with-vim {
        local WS="$PWD/workspace"
        if [[ ! -z "$1" ]]; then
                if [[ -d "$1" ]]; then
                        cd "$1"
                        WS="$(pwd)"
                        cd -
                else
                        WS="$PWD/$1"
                fi
        fi
        docker run -it -v "$WS:/opt/workspace" minustime/with-vim:ubuntu-bionic
}

```

```
$ with-vim ./workspace
```

### As base for another Dockerfile

As temporary base for another project:

```
FROM minustime/with-vim:ubuntu-bionic

USER root

RUN which nvim

USER ${USER}

CMD ["sleep", "infinity"]
```

## Development

1. Clone this repo:

```
$ git clone git@github.com:minustime/with-vim.git && cd with-vim
```

2. Build, run and access the container: 

```
$ make code

or

$ make code WORKSPACE=some-directory
```

## Fun features

* Oh My Zsh + vim-mode
* Neovim
