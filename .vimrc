" para solucionar problema que provoca que no funcionen cursores arrow
set nocompatible
set backspace=2

"------------------------

" text wraping
set tw=150 

" modo de text wraping (2 -> hard, inserta saltos de línea reales)
set wm=2

" habilita números de linea
set colorcolumn=+1
set number
set numberwidth=1

" para hacer saltos de n líneas, por ejemplo: 5j
set relativenumber

" las tabulaciones a 2 espacios
set ts=2 

" los indentados a 2 espacios
set sw=2

" habilita la recarga automática tras 1 segundo, empezando a contar después
" del evento cursor parado, foco o cambio en el buffer
set autoread             
set updatetime=1000                                                                                                                                                                      
au CursorHold * checktime  
au FocusGained,BufEnter * :checktime

" habilita el portapapeles del sistema cuando copiamos con ctrl+y en VISUAL
" no hace falta con el vim-gnome, ya funciona solo. pero es necesario para nvim
set clipboard=unnamed

" muestra en la barra de estado el encoding del fichero
set laststatus=2 statusline=%f\ %m\ %{&fileencoding?&fileencoding:&encoding} 

" resaltar paréntesis actual
set showmatch
set showcmd

" habilita el uso del mouse, puede ser útil para hacer alguna selección
set mouse=a

syntax enable


" usando el gestor de extensiones vim plug: https://github.com/junegunn/vim-plug
call plug#begin('~/.vim/plugged')
" theme
Plug 'morhetz/gruvbox'

" moverse a saltos usando una búsqueda de caracteres
Plug 'easymotion/vim-easymotion'

" arbol de ficheros
Plug 'scrooloose/nerdtree'
 
" muestra el estado de los ficheros (git) en nerdtree
Plug 'xuyuanp/nerdtree-git-plugin'

" Para movernos entre splits
Plug 'christoomey/vim-tmux-navigator'

" Para buscar ficheros con ctrl+p (similar a vscode)
Plug 'ctrlpvim/ctrlp.vim'

" Búsqueda mejorada
Plug 'haya14busa/incsearch.vim'

" Líneas de indentación
Plug 'Yggdroot/indentLine'

" Inserta pares de comillas, paréntesis automáticamente
Plug 'jiangmiao/auto-pairs'

" descripción del commit y autor en la misma linea al estilo gitlens
Plug 'tveskag/nvim-blame-line'

call plug#end()

" seleccionamos el theme
colorscheme gruvbox
let g:gruvbox_contrast_dark = "hard"
let mapleader=" "

"==incSearch========
" Maps requeridos
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)

" Quitar resaltado luego de buscar
let g:incsearch#auto_nohlsearch = 1
"===================


"==indentLine=======
" No mostrar en ciertos tipos de buffers y archivos
let g:indentLine_fileTypeExclude = ['text', 'sh', 'help', 'terminal']
let g:indentLine_bufNameExclude = ['NERD_tree.*', 'term:.*']
"===================

"==CtrlP config=====
" Archivos ignorados
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|node_modules)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

" Ignorar archivos en .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
"=================

" nvim-blame-line
autocmd BufEnter * EnableBlameLine
let g:blameLineVirtualTextPrefix = '// '

" custom shortcuts
nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>nt :NERDTreeFind<CR>
nmap <C-Up> <Up>ddp<Up>
nmap <C-Down> ddp
nnoremap <C-b> <C-v>
" para solucionar el problema que no dejaba funciona C+h
" https://github.com/christoomey/vim-tmux-navigator/issues/71
if has('nvim')
    nmap <BS> :<C-u>TmuxNavigateLeft<CR>
else
    nmap <C-h> <C-w>h
endif
