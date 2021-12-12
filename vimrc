" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
nmap <F6> :NERDTreeToggle<CR>

" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('sum', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('txt', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('go', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('pdf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('sum', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('yml', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('yaml', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('js', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('py', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('log', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('mod', 'Magenta', 'none', '#ff00ff', '#151515')
