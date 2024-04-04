# Dotfiles  

This repository contains my dotfiles. I use [GNU Stow](https://www.gnu.org/software/stow/) to manage them.  

## Installation  

```bash
git clone
cd dotfiles
stow git
stow profile
```

## Un-installation  

```bash
cd dotfiles
stow -D git
stow -D profile
```

### TODO

- [ ] Add bashrc to profile
- [ ] Install FZF and do bash integration
