""" Misc 
syntax on
filetype plugin indent on
setlocal shiftwidth=2 tabstop=2 expandtab
set t_Co=256

set hls is          " search highlighting

set number relativenumber
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

set noshowmode      " don't show mode because airline replaces it
""" End Misc


""" Plugins
" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
 \| endif


call plug#begin('~/.vim/bundle')
Plug 'neoclide/coc.nvim', {'branch': 'release'}     " autocomplete
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fuzzy finder
Plug 'junegunn/fzf.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'junegunn/seoul256.vim'
Plug 'sickill/vim-monokai'
Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
call plug#end()
""" End Plugins


""" seoul256
" (dark):
"   Range:   233 (darkest) ~ 239 (lightest)
"   Default: 237
let g:seoul256_background = 234
colo seoul256
""" end seoul256


""" Languages
augroup javascript
  autocmd!
  autocmd FileType setlocal javascript shiftwidth=2 tabstop=2 expandtab
augroup end

augroup python
  autocmd!
  autocmd BufWritePost,BufWritePre *.py call flake8#Flake8()
augroup end

autocmd FileType elixir setlocal formatprg=mix\ format\ -
""" End Languages


"""" Mappings 
map <Space> <Leader>
set timeoutlen=500   " Set timeout length to 500ms
set showcmd          " Show leader key in bottom right during timeout duration

nmap <leader>gd <Plug>(coc-definitions) " jump to definition
nmap <leader>gd <Plug>(coc-references)  " jump to references
nnoremap <C-p> :GFiles<CR>              " file navigation

" coc completion
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>" " CR selects completion suggestion if menu is visible
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"        " moves to next suggestion
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"    " moves to previous suggestion
"""" End Mappings
