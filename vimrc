" colorscheme
colorscheme koehler

" line numbers
set nu

" line numbers in grey 
highlight LineNr ctermfg=grey

" set leader
let mapleader=','

" Disabling auto-commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Indent correctly on new line
imap <C-Return> <CR><CR><C-o>k<Tab>

" Searching parameters
set incsearch
set hlsearch
set ignorecase
set smartcase " ignores case if no pattern with uppercase found, takes it into account otherwise
set nowrapscan " doesn't get back to first match when the last match is found

" Shows matching parenthesis
set showmatch

" Indentation
set autoindent
" set smartindent
set nosmartindent
filetype indent on

" Loads all plugins with pathogen and make documentation available
call pathogen#infect()
call pathogen#helptags() " this is done manually by running :helptags ~/.vim/<plugin-name>/doc

" From vimcasts #1
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>

" From vimcasts #1
" Use the same symbols as TextMate for tabstops and EOLs
set listchars=tab:▸\ ,eol:¬

" From vimcasts #2
" Only do this part when compiled with support for autocommands
if has("autocmd")
  " Enable file type detection
  filetype on

  " cpp files
  autocmd FileType cpp setlocal ts=8 sts=4 sw=4 expandtab

  " py files
  autocmd FileType python setlocal ts=8 sts=4 sw=4 expandtab

  " Syntax of these languages is fussy over tabs Vs spaces
  autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
  autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

  " Customisations based on house-style (arbitrary)
  autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
  autocmd FileType javascript setlocal ts=4 sts=4 sw=4 noexpandtab

  " Treat .rss files as XML
  autocmd BufNewFile,BufRead *.rss setfiletype xml
endif

" From vimcasts #8
" Path from the current file
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

command! -nargs=* Wrap set wrap linebreak nolist showbreak=…

" From vimcasts #26
" Bubble single lines (with unimpaired plugin)
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines (with unimpaired plugin)
vmap <C-Up> [egv
vmap <C-Down> ]egv

" From vimcasts #26
" Visually select the text that was last edited/pasted (with unimpaired plugin)
nmap gV `[v`]

" Gundo plugin
noremap <F5> :GundoToggle<CR>

" Shortcuts to show TagbarToggle
nnoremap <silent> <leader>b :TagbarToggle<CR>

if &term =~ '^screen'
  " tmux will send xterm-style keys when its xterm-keys option is on
  execute "set <xUp>=\e[1;*A"
  execute "set <xDown>=\e[1;*B"
  execute "set <xRight>=\e[1;*C"
  execute "set <xLeft>=\e[1;*D"
endif


" timeouts
set timeout
set ttimeoutlen=10
set timeoutlen=500
