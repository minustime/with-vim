# With Vim

Container with pre-configured shell and editor. Used to keep a familiar dev experience when exploring new languages, tools, etc.

![with-vim](./with-vim.gif)


## Usage

### With local files

To work on local files inside a `./workspace` directory:

```
$ docker run -it -v `pwd`/workspace:/opt/workspace minustime/with-vim:ubuntu-bionic
```

_OR_

Even better, create a shortcut for it!

1. Update your `~/.bashrc` file with this function:

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

2. Source it 

```
$ source ~/.bashrc
```

3. Run it against any directory:

```
$ with-vim .
```

### As base image

This can also be used as a temporary base image for another project:

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
```

## Fun features

* Oh My Zsh + vim-mode
* Neovim
