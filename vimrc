autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

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
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
let mapleader=','
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
