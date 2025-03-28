# My Dotfiles 
## Who cares?
This repo is mostly meant as a personal backup for the dotfiles on my daily driver, for when the inevitable day it stops turning on and it isn't the cmos battery. I also wanted to have this available for anyone to use as inspiration, it definitely helped me a lot to check out other people's dotfiles for inspiration.

## Scripts & Aliases
These should be found in the .zsh and .zshrc but who knows maybe I put a sneaky something somewhere.
### Super Awesome Wallpaper Switcher
This is my favorite part about this rice, with the help of pywal and a bunch of scripts made by people smarter than me, I managed to cobble together an easy script with great results for on the fly theming based on any given wallpaper. Just drop your wallpaper photos in the ```.config/wallpapers``` directory and run:
```
> wallpaper myPhoto.png
```
[idgaf show me](#photo-gallery)

### ```"config"``` alias
Cool trick using a bare Git repo to use ```$HOME``` as the root directory without including every file in ```$HOME```. If I ever need to update the repo for my dotfiles I can run the git commands from any directory but with the prefix ```config``` like such:
```
> config add ./zsh
> config commit -m "Bare Git repos are neat!"
> config push
```
### ```"sleep"``` alias
I'm lazy and would rather type ```sleep``` instead of ```systemctl suspend```.


## Dotfiles Backed up
Here's a quick list of what I've customized and have backed up in this repo:
- .zshrc
- hyprland (hyprland, hyperidle, hyprlock, hyprpaper)
- kitty
- mako
- neofetch (shut up i'll switch to fastfetch eventually
- nvim (I haven't done much visual customizing here)
- spicetify (spotify themer)
- waybar
- wlogout
- wofi
- yazi

## Photo Gallery
Here's a few photos with some of my favorite color pallets generated along with a few applications that sync with the theme.
![image](https://github.com/user-attachments/assets/b0cf3472-64a2-44c0-a762-10cefef44c8f)
![image](https://github.com/user-attachments/assets/55eb6ee2-7139-4533-b3a0-40c06d5ccc17)
![image](https://github.com/user-attachments/assets/189a9b53-16a4-4a25-826e-cc601e93c3fa)
![image](https://github.com/user-attachments/assets/4018d820-0f73-40fe-8b55-3efdd788831f)


