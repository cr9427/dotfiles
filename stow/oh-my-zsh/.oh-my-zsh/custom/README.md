# oh-my-zsh cutsom

## Install oh-my-zsh

```shell
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Install my customization reposotory


```shell
    rm -rf $HOME/.oh-my-zsh/custom
    git clone --recurse-submodules https://git.local.crylle.net/holm/oh-my-zsh.git $HOME/.oh-my-zsh/custom
```


## Updating


```shell
    omz update
    cd $HOME/.oh-my-zsh/custom
    git pull
    git submodule update --remote
```

