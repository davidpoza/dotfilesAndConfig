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


" muestra en la barra de estado el encoding del fichero
set laststatus=2 statusline=%f\ %m\ %{&fileencoding?&fileencoding:&encoding}  
