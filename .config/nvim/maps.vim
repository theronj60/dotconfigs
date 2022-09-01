"-------------Key-Bindings--------------"
"Custom key bindings"

" Vim exit modes
inoremap jk <Esc>
" switched movement for new keyboard
nnoremap t l
vnoremap t l

" Vim Buffers
" These commands will navigate through buffers in order regardless of which mode you are using
" e.g. if you change the order of buffers :bnext and :bprevious will not respect the custom ordering
nnoremap <silent><Space>] :BufferLineCycleNext<CR>
nnoremap <silent><Space>{ :BufferLineCyclePrev<CR>
nnoremap <silent><Space><< :BufferLineMovePrev<CR>
nnoremap <silent><Space>>> :BufferLineMoveNext<CR>

nnoremap <silent><Space>1 <Cmd>BufferLineGoToBuffer 1<CR>
nnoremap <silent><Space>2 <Cmd>BufferLineGoToBuffer 2<CR>
nnoremap <silent><Space>3 <Cmd>BufferLineGoToBuffer 3<CR>
nnoremap <silent><Space>4 <Cmd>BufferLineGoToBuffer 4<CR>
nnoremap <silent><Space>5 <Cmd>BufferLineGoToBuffer 5<CR>
nnoremap <silent><Space>6 <Cmd>BufferLineGoToBuffer 6<CR>
nnoremap <silent><Space>7 <Cmd>BufferLineGoToBuffer 7<CR>
nnoremap <silent><Space>8 <Cmd>BufferLineGoToBuffer 8<CR>

" These commands will move the current buffer backwards or forwards in the bufferline
nnoremap <Space>br :BufferLineMoveNext<CR>
nnoremap <Space>bl :BufferLineMovePrev<CR>
" Close selected buffer
nnoremap <Space>db :bd<CR>

" Vim Windows
nnoremap <Space>C :close<CR>
nnoremap <leader>ss :split<return><C-w>w
nnoremap <leader>sv :vsplit<return><C-w>w
nnoremap <leader><Space> <C-w>w
nnoremap <silent><C-w>e :vertical resize +10<CR>
nnoremap <silent><C-w>s :vertical resize -10<CR>
"navigate to left window
" nnoremap <Space>h <C-w>h
"navigate to right window
" nnoremap <Space>l <C-w>l

" clear highlight search
nnoremap <leader>cl :let @/ = ""<CR> 
" NvimTree mappings
nnoremap <F2> :NvimTreeToggle<CR>
nnoremap <leader>e :NvimTreeRefresh<CR>
" nnoremap <leader>e :NvimTreeFocus<CR>

"---------movements---------"
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z
nnoremap <C-u> <C-u>zzzv
nnoremap <C-d> <C-d>zzzv

"---------text---------"
" moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>j :m.+1<CR>==
nnoremap <leader>k :m.-2<CR>==
" clipboard, c = copy, p = paste
vnoremap <leader>c "*y<CR>
nnoremap <leader>v "*p<CR>
" new line up/down
nnoremap <leader>o o<Esc>
nnoremap <leader>O O<Esc>
