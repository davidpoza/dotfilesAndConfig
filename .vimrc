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

" Para movernos entre splits
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

" seleccionamos el theme
colorscheme gruvbox
let g:gruvbox_contrast_dark = "hard"
let mapleader=" "

" custom shortcuts
nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>nt :NERDTreeFind<CR>

" para solucionar el problema que no dejaba funciona C+h
" https://github.com/christoomey/vim-tmux-navigator/issues/71
if has('nvim')
    nmap <BS> :<C-u>TmuxNavigateLeft<CR>
else
    nmap <C-h> <C-w>h
endif
