# EggDice's Dotfiles 


```
cd; mkdir -p .dotfiles; curl -#L https://github.com/EggDice/dotfiles/tarball/master | tar -xzv --strip-components 1 -C .dotfiles
su -c 'ln -s '$(pwd)'/.dotfiles/bin/dotfiles /usr/local/bin; dotfiles'
```
