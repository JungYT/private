" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
Plug 'sheerun/vim-polyglot'
Plug 'vim-syntastic/syntastic'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'lervag/vimtex'
" NERDTree: file tree
Plug 'scrooloose/nerdtree'
" Initialize plugin system
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fannheyward/coc-pyright'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'phanviet/vim-monokai-pro'
" Plug 'itchyny/lightline.vim'
call plug#end()

" autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE
filetype plugin indent on
syntax on
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
if (has("autocmd"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white })
  augroup END
endif
colorscheme onedark
" colorscheme monokai_pro
" colorscheme gruvbox
set mouse=a
set nu
set hlsearch
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set showcmd
let python_highlight_all=1
" let g:airline_theme='gruvbox'
let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tmuxline#enabled = 0
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args='--ignore=F401,E226,W503,E731,E501,E402'
let g:syntastic_loc_list_height = 3
let mapleader=","
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }
let g:ctrlp_open_multiple_files = '1r'
let g:ctrlp_working_path_mode = 0
let g:vimtex_view_general_viewer = 'sumatraPDF'
let g:vimtex_view_general_options = '-reuse-instance @pdf'
let g:vimtex_view_general_options_latexmk = '-reuse-instance'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
nmap nt <ESC>:NERDTreeToggle<CR>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
au BufNewFile,BufRead *.py
  \ setl tabstop=4 |
  \ setl softtabstop=4 |
  \ setl shiftwidth=4 |
  \ setl expandtab |
  \ setl autoindent |
  \ setl fileformat=unix |
  \ setl colorcolumn=80 |
  \ highlight ColorColumn ctermbg=0 guibg=lightgrey
au BufNewFile,BufRead *.m
  \ setl autoindent |
  \ setl colorcolumn=80 |
  \ highlight ColorColumn ctermbg=0 guibg=lightgrey
hi ColorColumn ctermbg=166


au BufNewFile,BufRead *.tex
  \ setl spell spelllang=en_us |
  \ setl tabstop=4 |
  \ setl softtabstop=4 |
  \ setl shiftwidth=4 |
  \ setl expandtab |
  \ setl autoindent


" if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
" endif

