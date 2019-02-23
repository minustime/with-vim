call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-surround'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()

" Airline 
let g:airline_powerline_fonts = 1

" Nerdtree 
map <F2> :NERDTreeToggle<CR>

" Nerdcommenter
filetype plugin on
nmap <C-_> <Plug>NERDCommenterToggle
vmap <C-_> <Plug>NERDCommenterToggle<CR>gv

set number
:highlight LineNr ctermfg=grey