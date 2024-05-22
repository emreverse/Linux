" Plugins will be downloaded under the specified directory.
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'

call plug#begin()
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
call plug#end()

" List ends here. Plugins become visible to Vim after this call.
call plug#end()
nmap <F6> :NERDTreeToggle<CR>

syntax on
set incsearch
set history=1000
set wildmenu
set wildmode=list:longest

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
call NERDTreeHighlightFile('sh', 'red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('yml', 'cyan', 'none', 'cyan', '#151515')
