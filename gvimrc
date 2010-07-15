" Example Vim graphical configuration.
" Copy to ~/.gvimrc or ~/_gvimrc.

set guifont=Monaco:h12            " Font family and font size.
set antialias                     " MacVim: smooth fonts.
set encoding=utf-8                " Use UTF-8 everywhere.
set guioptions-=T                 " Hide toolbar.
set background=light              " Background.
set lines=45 columns=150          " Window dimensions.

colorscheme zmrok                 " Set color scheme
set background=dark               " Set colors to handle dark backgrounds

set guioptions-=T                 " Turn off needless toolbar on gvim/mvim

set guioptions-=r                 " Don't show right scrollbar
set guioptions-=l                 " Don't show left scrollbar
