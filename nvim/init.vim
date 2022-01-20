syntax on
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set wrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set colorcolumn=80
set exrc
set guicursor=
set nohlsearch
set hidden
set scrolloff=8
set colorcolumn=80
set signcolumn=yes
set updatetime=50
set shortmess+=c
set cursorline

call plug#begin('~/.config/nvim/autoload')

"Plug 'morhetz/gruvbox'
"Plug 'jremmen/vim-ripgrep'
"Plug 'tpope/vim-fugitive'
"Plug 'lyuts/vim-rtags'
"Plug 'git@github.com:kien/ctrlp.vim.git'
"Plug 'Valloric/YouCompleteMe'
Plug 'mbbill/undotree'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'fannheyward/telescope-coc.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'arzg/vim-colors-xcode'
Plug 'kyoz/purify'

Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build', 'branch': 'main' }

"Autocomplete plugin
"Also do :CocInstall coc-clangd coc-tsserver coc-eslint coc-json coc-prettier coc-css coc-python coc-java
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Language packs
Plug 'sheerun/vim-polyglot'

Plug 'fatih/vim-go'

"Markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'jonathanfilip/vim-lucius'


call plug#end()

colorscheme onehalfdark
set background=dark
highlight Normal guibg=none

"let mapleader = " "
"nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep for > ")})

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup ALPASFLY
    autocmd!
    autocmd BufWritePre * :call TrimWhitespace()
augroup END

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}


"""""""""""""""""""""""""""
" Markdown Preview Config "
"""""""""""""""""""""""""""

" set to 1, nvim will open the preview window after entering the markdown buffer
" default: 0
let g:mkdp_auto_start = 0

" set to 1, the nvim will auto close current preview window when change
" from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 1

" set to 1, the vim will refresh markdown when save the buffer or
" leave from insert mode, default 0 is auto refresh markdown as you edit or
" move the cursor
" default: 0
let g:mkdp_refresh_slow = 1

" set to 1, the MarkdownPreview command can be use for all files,
" by default it can be use in markdown file
" default: 0
let g:mkdp_command_for_global = 0

" set to 1, preview server available to others in your network
" by default, the server listens on localhost (127.0.0.1)
" default: 0
let g:mkdp_open_to_the_world = 0

" use custom IP to open preview page
" useful when you work in remote vim and preview on local browser
" more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
" default empty
let g:mkdp_open_ip = ''

" specify browser to open preview page
" default: ''
let g:mkdp_browser = 'firefox'

" set to 1, echo preview page url in command line when open preview page
" default is 0
let g:mkdp_echo_preview_url = 0

" a custom vim function name to open preview page
" this function will receive url as param
" default is empty
let g:mkdp_browserfunc = ''

" options for markdown render
" mkit: markdown-it options for render
" katex: katex options for math
" uml: markdown-it-plantuml options
" maid: mermaid options
" disable_sync_scroll: if disable sync scroll, default 0
" sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
"   middle: mean the cursor position alway show at the middle of the preview page
"   top: mean the vim top viewport alway show at the top of the preview page
"   relative: mean the cursor position alway show at the relative positon of the preview page
" hide_yaml_meta: if hide yaml metadata, default is 1
" sequence_diagrams: js-sequence-diagrams options
" content_editable: if enable content editable for preview page, default: v:false
" disable_filename: if disable filename header for preview page, default: 0
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }

" use a custom markdown style must be absolute path
" like '/Users/username/markdown.css' or expand('~/markdown.css')
let g:mkdp_markdown_css = ''

" use a custom highlight style must absolute path
" like '/Users/username/highlight.css' or expand('~/highlight.css')
let g:mkdp_highlight_css = ''

" use a custom port to start server or random for empty
let g:mkdp_port = ''

" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'

" recognized filetypes
" these filetypes will have MarkdownPreview... commands
let g:mkdp_filetypes = ['markdown']
