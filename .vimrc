set nu
set autowrite
" Commenting after removing oh-my-zsh
execute pathogen#infect()
syntax enable
filetype plugin on
filetype plugin indent on

" Neovim python virtualenvs
let g:python3_host_prog='/Users/cdunda/.pyenv/versions/neovim3/bin/python'
let g:python_host_prog='/Users/cdunda/.pyenv/versions/neovim2/bin/python'

"" python3 plugins
call remote#host#RegisterPlugin('python3', '~/.nvim/rplugin/python3/snake.py', [
      \ {'sync': 1, 'name': 'SnakeStart', 'type': 'command', 'opts': {}},
      \ ])
call remote#host#RegisterPlugin('python3', '~/.nvim/plugged/deoplete.nvim/rplugin/python3/deoplete.py', [
      \ {'sync': 1, 'name': 'DeopleteInitializePython', 'type': 'command', 'opts': {}},
      \ ])

" Use vim-plug for plugins
call plug#begin('~/.config/nvim/plugged')
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'ervandew/supertab'
  Plug 'SirVer/ultisnips'
  Plug 'honza/vim-snippets'
  Plug 'guns/vim-sexp'
  Plug 'ternjs/tern_for_vim', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'carlitux/deoplete-ternjs', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'othree/jspc.vim', { 'for': ['javascript', 'javascript.jsx'] }
  Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
  Plug 'zchee/deoplete-go', { 'do': 'make'}
  Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
  Plug 'edkolev/tmuxline.vim'
  Plug 'AndrewRadev/splitjoin.vim'
  Plug 'vim-airline/vim-airline'
  Plug 'cwood/ultisnips-terraform-snippets'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'jpalardy/vim-slime'
  Plug 'hashivim/vim-terraform'
  Plug 'eraserhd/parinfer-rust'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
call plug#end()

" Map vim-sexp
nnoremap <Space> <Nop>
let maplocalleader=" "

" Map deoplete pop up selection to tab
let g:deoplete#enable_at_startup = 1
autocmd FileType javascript let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
" UltiSnipsExpandTrigger with supertab
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<s-j>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
set completeopt=longest,menuone,preview

let g:deoplete#sources = {}
let g:deoplete#sources['javascript.jsx'] = ['file', 'ultisnips', 'ternjs']
let g:tern#command = ['tern']
let g:tern#arguments = ['--persistent']
" close the preview window when you're not using it
let g:SuperTabClosePreviewOnPopupClose = 1
" or just disable the preview entirely
set completeopt-=preview

" Set deoplete for golang recommended settings
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
" If these are not set these types will be hidden from auto complete
let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']

" deoplete.nvim recommend
set completeopt+=noselect

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

"""""vim-slime
"""""let g:slime_target = "tmux"
"""""let g:slime_default_config = {"socket_name": split($TMUX, ",")[0], "target_pane": "%1"}

"Markdown preview
augroup markdown
  au!
  au BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown
augroup END

"Airline
if !has('gui_running') && !has('win32')
  let g:airline_powerline_fonts=1
endif
set laststatus=2
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#branch#empty_message='no repo'
let g:airline#extensions#hunks#enabled=0
let g:airline#extensions#whitespace#enabled=1
let g:airline#extensions#whitespace#mixed_indent_algo=1 "Tabs before spaces

aug airlinethemejosh
  autocmd!
  autocmd VimEnter * AirlineTheme papercolor
aug end
let g:airline_solarized_bg='dark'


"Tmuxline - :TmuxlineSnapshot! ~/.dotfiles/.tmuxline.tmux.conf
"Far bottom right shows DHCP WiFi IP, with an H appended at home
let g:tmuxline_preset = {
      \'a'       : '#S:#I',
      \'b disabled'       : '',
      \'c disabled'       : '',
      \'win'     : ['#I', '#W'],
      \'cwin'    : ['#I', '#W'],
      \'x'       : '#(~/.dotfiles/bin/tmux-battery)',
      \'y'       : ['%a', '%Y-%m-%d', '%l:%M%p'],
      \'z'       : ['#(whoami)', '#(~/.dotfiles/bin/getipfortmux || echo raspi)'],
      \'options' : {'status-justify': 'left'}}



let g:tmuxline_theme = 'icebert'

set modelines=0

set encoding=utf-8
set autoindent
set ttyfast
set backspace=indent,eol,start
set laststatus=2
set relativenumber
set undofile


let mapleader =","

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set hlsearch
nnoremap <leader><space> :noh<cr>

set wrap
set textwidth=80
set formatoptions=qrn1
set list
set listchars=tab:▸\ ,eol:¬

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
nnoremap j gj
nnoremap k gk

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

noremap ; :
au FocusLost * :wa

nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>a :Ack
nnoremap <leader>q gqip
nnoremap <leader>v V`]
nnoremap <leader>ev <C-w><C-l>:e $MYVIMRC<cr>
inoremap jj <ESC>

nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

tnoremap <Esc> <C-\><C-n>


" Preseve indentation while pasteing text from the OS X clipboard
noremap <leader>p :set paste<CR>:put *<CR>:set nopaste<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set tags=~/.tags
set complete=.,w,b,u,t,i
set foldmethod=syntax

" Tell the clipboard to use system clipboard
set clipboard+=unnamedplus
" Yank text to the OS X clipboard
noremap <leader>y "*y
noremap <leader>yy "*Y

" JSDocs
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1

"Golang
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
" uses the helper function below
"autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
let g:go_fmt_command = "goimports"


" Terraform plugin
let g:terraform_fmt_on_save=1
let g:terraform_align=1
let g:terraform_fold_sections=1
let g:terraform_remap_spacebar=1
autocmd FileType terraform setlocal commentstring=#%s

" Emmet html plugin
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

" Set Javascript Format
"autocmd FileType javascript set formatprg=prettier\ --stdin

" Use ALE syntax checker
let g:ale_sign_column_always = 1
let g:ale_linters = {
\ 'javascript': ['eslint'],
\ }
""\ 'python'    : ['autopep8', 'isort', 'remove_trailing_lines', 'trim_whitespace'],
let g:ale_fixers = {
\ 'javascript': ['eslint'],
\ 'sh'        : ['shfmt'],
\ }
let g:ale_fix_on_save = 1
let g:ale_sh_shfmt_options = '-i 2'
let g:ale_python_autopep8_options = '--max-line-length=200'
let g:ale_python_autopep8_executable= '/usr/local/bin/autopep8'
let g:ale_python_autopep8_use_global = 1


" Put these lines at the very end of your vimrc file.
" Load all plugins now.
" Plugins need to be added to runtimepath before helptags can be generated.
packloadall
" Load all of the helptags now, after plugins have been loaded.
" All messages and errors will be ignored.
silent! helptags ALL
