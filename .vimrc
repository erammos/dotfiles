vim9script
filetype plugin on
filetype indent on
set mouse=a
set nobackup
set nowb
set noswapfile
set autoread
g:mapleader = " "
call plug#begin()
  Plug 'preservim/nerdtree',
  Plug 'yegappan/lsp',
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim',
  Plug 'ervandew/supertab'
  Plug 'sheerun/vim-polyglot',
  Plug 'morhetz/gruvbox',
  Plug 'itchyny/lightline.vim'
call plug#end()


var lspOpts = {autoHighlightDiags: true,
showDiagInPopup: true, autoHighlight: false}	
autocmd User LspSetup call LspOptionsSet(lspOpts)

var lspServers = [{
		  name: 'clang',
		  filetype: ['c', 'cpp'],
		  path: '/usr/bin/clangd',
		  args: ['--background-index']
	 }]
autocmd User LspSetup call LspAddServer(lspServers)

autocmd VimEnter * NERDTree | wincmd p
#autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | call feedkeys(":quit\<CR>:\<BS>") | endif
#autocmd BufWinEnter * if &buftype != 'quickfix' && getcmdwintype() == '' | silent NERDTreeMirror | endif
set keywordprg=:LspHover
set termguicolors
set background=dark
colorscheme gruvbox

nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader><Leader> :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>g :Commits<CR>
nnoremap <silent> <Leader>H :Helptags<CR>
nnoremap <silent> <Leader>hh :History<CR>
nnoremap <silent> <Leader>h: :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR>
nnoremap <silent> <Leader>ca :LspCodeAction<CR>
nnoremap <silent> <Leader>ca :LspCodeAction<CR>
nnoremap <silent> <Leader>t :botright terminal<CR>
nnoremap <silent> gd :LspGotoDefinition<CR>
nnoremap <silent> gi :LspGotoImpl<CR>
nnoremap <silent> gt :LspGotoTypeDef<CR>

