# Mah-vimrc

My .vimrc file for Ruby development

![Screenshot](https://github.com/SFzxc/mah-vimrc/blob/master/screenshot.png)

## Setup

#### Install iTerm2 Material Design (Option)

- Requirement: iTerm2

- Clone the repo or download the file [iTerm2 Material Design](https://github.com/MartinSeeler/iterm2-material-design)
- iTerm2 > Preferences > Profiles > Colors Tab
- Click Color Presets...
- Click Import...
- Select the material-design-colors.itermcolors file
- Select the material-design-colors from Load Presets...

#### Implement mah-vimrc

```
$ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
$ git clone https://github.com/SFzxc/mah-vimrc.git

$ cp mah-vimrc/vimrc ~/.vimrc

$ vim
    :PluginInstall
    :q!
```

## General Mappings

- I map leader to comma, because it is much easier on OS-X.
- Disable arrows key, it will help us to avoid habbit of using arrows to do things
- By pressing jj i can escape to normal mode any time instead of pressing ESC
- Move to beginning/end of line with `B`/`E`
- ... Check vimrcfile for more mapping informations

## Plugins

- https://github.com/MarcWeber/vim-addon-mw-utils (interpret a file by function and cache file automatically)
- https://github.com/tomtom/tlib_vim (Some utility functions for VIM )
- https://github.com/honza/vim-snippets (vim-snipmate default snippets)
- https://github.com/garbas/vim-snipmate
- https://github.com/tpope/vim-fugitive (a Git wrapper so awesome)
- https://github.com/tpope/vim-rails (Ruby on Rails power tools)
- https://github.com/tomtom/tcomment_vim (An extensible & universal comment vim-plugin)
- https://github.com/tomasr/molokai (Color Scheme for Vim but i dont use it)
- https://github.com/jiangmiao/auto-pairs (Vim plugin, insert or delete brackets, parens, quotes in pair)
- https://github.com/ervandew/supertab (Perform all your vim insert mode completions with Tab)
- https://github.com/scrooloose/nerdtree (A tree explorer plugin for vim.)
- https://github.com/ctrlpvim/ctrlp.vim (Fuzzy file, buffer, mru, tag, etc finder)
- https://github.com/tpope/vim-dispatch (Asynchronous build and test dispatcher)
- https://github.com/vim-ruby/vim-ruby (Ruby power tools)

