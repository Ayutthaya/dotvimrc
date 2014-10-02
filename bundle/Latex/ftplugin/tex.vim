let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_MultipleCompileFormats='pdf, aux'

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" This Latex plugin defines mapping for <C-J> for IMAP_JumpForward which is very
" annoying.  The script includes a check hasmapto before defining those mapping
" so we will define some mapping here (made them complicated on purpose)
map <C-space>\, <Plug>IMAP_JumpForward 
imap <C-space>\, <Plug>IMAP_JumpForward
" Other approach : go to the place where those mappings are defined in script (use
" :map to get a list of the mappings, vimgrep /<mapping>/ bundle/Latex/**) 
" and add map <unique> ... this lets vim
" perfrom an additional check that this mapping has not already been defined
" before and throws an error otherwise.
" Anyway I believe the first approach is cleaner.

