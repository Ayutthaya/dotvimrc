" Loads all plugins with pathogen and make documentation available
call pathogen#infect()
call pathogen#helptags() " this is done manually by running :helptags ~/.vim/<plugin-name>/doc

" GENERAL SETTINGS

" Automatic coloring
if version >= 600
    syntax enable " This command executes :source $VIMRUNTIME/syntax/syntax.vim. With this command you can use the :highlight command to set your preferred colors.
else	
    syntax on " With this command Vim will overrule your settings.
endif

" Hides buffer automatically when switching to another buffer
set hidden 

" Shows line numbers
set number

" Colors suitable for dark background
set background=dark

" Sets filetype detection on (this uses file extension)
if has("autocmd")
    " the if has("autocmd") is there to ensure portability since the following option doesn't work if vim hasn't been compiled with the autocmd flag. You can check if it is the case with the command :version
    filetype plugin indent on
end

" Avoids 'Hit return to continue' message
set shortmess=a

" Prevents long line to go off screen
set wrap

" Sets limit of lines width (0 if no limit)
set textwidth=80

" Prevents vim to cut a word in the middle of a word 
set linebreak " doesn't work if the list option is on! set nolist

" Searching parameters
set smartcase
set incsearch
set hlsearch

" Shows matching parenthesis
set showmatch

" Indentation
set autoindent
set smartindent
set shiftwidth=2

" Tabs and spaces
set expandtab " converts tab in a number of spaces
set tabstop=4 " sets tab character to correspond to x columns. When there is an offset of x columns it is automatically converted to a tab character. If the expandtab option is set then the tab character will in turn be converted to x spaces.
set softtabstop=4 " sets the number of columns offset when PRESSING the tab key or the backspace key. It doesn't necessarily inserts or remove a tab character, just the proper number of columns.
set shiftwidth=4 " sets the number of columns offset when in normal mode using the shift keys '>' and '<'

" GENERAL MAPPINGS

" Switches between buffers
map <C-L> :bn<CR>
map <C-H> :bp<CR>

" Unlists the current buffer and switch to the next/previous one
command! BDN :bn | :bd#
command! BDP :bp | :bd#
map <S-L> :BDN<CR>
map <S-H> :BDP<CR>

" Reminder : noremap avoids recursive resolution of mapping but as long as we don't remap g<C-]> it is fine here
" Displays the list of multiple match for a tag by default. (Initially <C-]> is mapped to :tag which jumps to the first match, whereas g<C-]> is mapped to :tjump which displays the list if multiple matches exist.
noremap <C-]> g<C-]>

" Switches from one match for a tag to another
map <C-Down> :tnext<CR>
map <C-Up> :tprevious<CR>

" Bubbles single lines
nmap <C-K> ddkP
nmap <C-J> ddp

" Bubbles multiple lines (`[ is the default mark for the last selection start point, `] for last selection end point)
vmap <C-K> xkP`[V`] 
vmap <C-J> xp`[V`]


" PLUGINS MAPPINGS

" Targets the current opened buffer in NERDTree
map ,n :NERDTreeFind <CR>

" Shortcuts to show GundoToggle
nnoremap <F5> :GundoToggle<CR>

" ----- ARJUN STUFF, to clean

 " -------------------------------------------------------- Source display
 " Unix files
 set fileformat=unix
 " do not allow actual rendering of html tags content
 let html_no_rendering=1
 " backspace control
 set bs=indent,eol,start
 " automatic syntax coloring

 " ----------------------------------------------- status line
 " also see colorscheme in tgo.vim
 " status line looks like
 " filename modified readonly type buffernum,modified line,column
 " percentinfile hexofcharundercursor
 set statusline=%-5t%-1m%r%y%=[%n%M]\ %l,%c\ %p%%\ 0x%B
 set laststatus=2


 " ----------------------------------------------- default folding behaviour
 if (v:version >= 600)
 " we want simple block folding by indent
 set foldmethod=indent
 set foldlevel=1
 endif

 " -------------------------------------------------------- Searching
 " search incrementaly and smartly

 " ------------------------------------------------------- Programming
 " for correct ctags and cscope handling (alternative is required
 " in case there is already a file/directory names tags or ctags
 " additional names could be added if both names exits
 let $WDIR=getcwd() "get the working directory
 if has("unix")
 set tags=$WDIR/tags
 endif
 "setup scope info only is available
 if has("cscope")
 let cscope=filereadable("$WDIR/cscope.out")
 if exists("cscope")
 set csprg=/usr/local/bin/cscope "direct path
 set csto=1 "seach scope before ctags
 set cst
 set nocsverb
 cs add $WDIR/cscope.out
 set csverb
 endif
 endif
 " ------------------------------------------------------- Scripts
 "source ~tgo/personnel/vim/matchit.vim
 let g:calendar_weeknm = 1 " WK01

 " ------------------------------------------------------ Key Maps
 map <F3> n
 map <S-F3> [I
 map <F4> :nohl<CR>

 " ,e/,w to open/save a file in the same directory as the currently edited
 file
 if has("unix")
 map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
 map ,w :w <C-R>=expand("%:p:h") . "/" <CR>
 map ,r :r <C-R>=expand("%:p:h") . "/" <CR>
 " ,f creates a filesystem tree starting at the current directory
 map ,f :exe CreateMenuPath(expand("%:p:h"),"Tgo&Path") <CR>
 else
 map ,e :e <C-R>=expand("%:p:h") . "\\"<CR>
 map ,w :w <C-R>=expand("%:p:h") . "/" <CR>
 map ,r :r <C-R>=expand("%:p:h") . "/" <CR>
 endif
 " use CTRL-UP & CTRL-DOWN & CTRL-= to manage folds
 map <C-UP> zc
 map <C-DOWN> zO
 map <C-PAGEUP> :Df 0<CR>
 map <C-S-PAGEUP> :Df 1<CR>
 map <C-PAGEDOWN> zR


 " Vimcasts.org 

 " #1 Show invisibles

nmap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬
" ▸ = u25b8, ¬ = u00ac (insert unicode symbol with crtl-V in insert mode) 
" ctrl-V ctrl-I inserts tab character


" #3 Whitespace preferences and filetype

" autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
" The first part of this command means to execute automatically the end of the command if the filetype of the file is make. Setlocal is like the set command but affects only the current buffer.i
" You need vim to be compiled with the autocmd option on. To check that run :version and check there is a '+' sign in front of autocmd.
" You can inquire about the filetype of a buffer with :set filetype?, and you can set it with set filetype myFileType.

" #4 Tidying whitespaces
" To convert spaces in tab and conversely use :retab!
" To remove trailing spaces usr :%s/\s\+$//e. \s stands for space, \+ means it should occur once or several times, the e at the end tells vim to ignore errors.
