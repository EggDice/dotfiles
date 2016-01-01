# EggDice's Dotfiles 


```
cd; mkdir -p .dotfiles; wget -O - -o /dev/null https://github.com/EggDice/dotfiles/tarball/master | tar -xzv --strip-components 1 -C .dotfiles
su -c 'ln -s '$(pwd)'/.dotfiles/bin/dotfiles /usr/local/bin; dotfiles'
```
