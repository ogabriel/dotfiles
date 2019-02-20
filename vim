if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'romainl/apprentice'
Plug 'scrooloose/nerdtree'
Plug 'yggdroot/indentline'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'vim-airline/vim-airline'
Plug 'djoshea/vim-autoread'
Plug 'matze/vim-move'
Plug 'qpkorr/vim-bufkill'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sleuth'
Plug 'ervandew/supertab'
Plug 'junegunn/vim-slash'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'kien/rainbow_parentheses.vim'

call plug#end()

" ------ sensible defaults ------
let mapleader = "\<Space>"
set hlsearch
set incsearch
set number
set noswapfile
set hidden
set wrap!
set splitbelow
set splitright
set clipboard=unnamedplus
set visualbell
set mouse=a
set lazyredraw
if has('mouse_sgr')
    set ttymouse=sgr
endif

" ------ extra config ------
let g:airline#extensions#tabline#enabled  = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:buffergator_suppress_keymaps        = 1
let g:buffergator_mru_cycle_loop          = 1
let g:buffergator_viewport_split_policy   = 'R'
let g:NERDTreeWinSize                     = 30
let g:move_key_modifier                   = 'C'
let g:indentLine_char                     = '¦'

" ------ mappings ------
" buffergator
nmap <leader>jj :BuffergatorMruCyclePrev<cr>
nmap <leader>kk :BuffergatorMruCycleNext<cr>
nmap <leader>bl :BuffergatorOpen<cr>

" vim move
vnoremap < <gv
vnoremap > >gv

" FZF
nnoremap <silent> <C-p> :FZF<CR>
nnoremap <silent> <C-f> :Ag<CR>

" better search
noremap <plug>(slash-after) zz

" nerdtree
nmap <leader>n  :NERDTree<cr>
nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>
map <C-n>       :NERDTreeToggle<cr>

" cgn
nnoremap <Leader>x *``cgn
nnoremap <Leader>X #``cgN

if !has('nvim')
  if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\e[5 q\<Esc>\\"
    let &t_SR = "\<Esc>Ptmux;\<Esc>\e[4 q\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
  else
    let &t_SI = "\e[6 q"
    let &t_SR = "\e[4 q"
    let &t_EI = "\e[2 q"
  endif
endif

" ------ autocmd ------
" rainbow parens
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

autocmd BufWritePre * %s/\s\+$//e

 " when quitting a file, save the cursor position
augroup save_cursor_position
    autocmd!
    autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

 " enable cursorline in the currently active window
augroup cursorline
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    autocmd WinLeave * setlocal nocursorline
augroup END

" ------ colorscheme ------
colorscheme apprentice