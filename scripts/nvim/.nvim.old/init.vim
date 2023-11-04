
set number relativenumber
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set clipboard+=unnamedplus
set signcolumn=yes
set t_Co=256
set t_ut=

set termguicolors
syntax enable
set background=dark

call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'} "coc-prettier,coc-tsserver,coc-go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
"Plug 'pangloss/vim-javascript'
Plug 'mattn/emmet-vim'
Plug 'ap/vim-css-color'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'turbio/bracey.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
"Plug 'rose-pine/neovim'
"Plug 'tpope/vim-fugitive'
"Plug 'projekt0n/github-nvim-theme'
Plug 'nyoom-engineering/oxocarbon.nvim'
"Plug 'manzeloth/live-server'
Plug 'EdenEast/nightfox.nvim' " Vim-Plug
Plug 'windwp/nvim-ts-autotag'
Plug 'leafOfTree/vim-matchtag'
Plug 'folke/tokyonight.nvim'
Plug 'rose-pine/neovim'
" https://github.com/ults-io/vscode-react-javascript-snippets
Plug 'dsznajder/vscode-es7-javascript-react-snippets', { 'do': 'yarn install --frozen-lockfile && yarn compile' }
Plug 'dense-analysis/ale'
Plug 'bufbuild/vim-buf'
"Plug 'lewis6991/gitsigns.nvim'
"Plug 'tomasiser/vim-code-dark'
"Plug 'morhetz/gruvbox'
call plug#end()

colorscheme carbonfox 
"hi StatusLine guifg=#217aff guibg=#ffffff
"hi TabLine guifg=#000000 guibg=#ffffff
"hi TabLineFill guifg=#000000 guibg=#217aff
"hi TabLineSel guifg=#ffffff guibg=#217aff
"hi Normal guibg=NONE ctermbg=NONE
"hi SignColumn guibg=NONE
" use <tab> for trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()
" Use <C-@> on vim
inoremap <silent><expr> <c-@> coc#refresh()

inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
inoremap <silent><expr> <CR> pumvisible() ? "\<C-e>\<CR>" : "\<CR>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

autocmd BufWritePre * :TSEnable highlight
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')

nnoremap gd <Plug>(coc-definition)
nnoremap gy <Plug>(coc-type-definition)
nnoremap gi <Plug>(coc-implementation)
nnoremap gr <Plug>(coc-references)    

"let NERDTreeMinimalUI = 1
"let NERDTreeDirArrows = 1
"nnoremap <C-t> :NERDTreeToggle<CR>

let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\}

let g:ale_linters = {
\   'proto': ['buf-lint',],
\}
let g:ale_lint_on_text_changed = 'never'
let g:ale_linters_explicit = 1

let g:netrw_localrmdir='rm -rf'
let g:netrw_winsize = 25
nnoremap <S-w> :Vexplore<CR>
nnoremap <leader>m <cmd>MarkdownPreviewToggle<CR>
let g:netrw_liststyle = 3
let g:netrw_banner = 0

function! CreateInPreview()
  let l:filename = input("please enter filename: ")
  execute 'silent !touch ' . b:netrw_curdir.'/'.l:filename 
  redraw!
endf
autocmd filetype netrw call Netrw_mappings()
function! Netrw_mappings()
  noremap <buffer>% :call CreateInPreview()<cr>
endfunction

"inoremap { {}<Esc>ha
"inoremap ( ()<Esc>ha
"inoremap [ []<Esc>ha
"inoremap " ""<Esc>ha
"inoremap ' ''<Esc>ha
"inoremap ` ``<Esc>ha

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

au BufReadPost *.gohtml set syntax=html
au BufReadPost *.js set filetype=javascriptreact.javascript

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

let g:mkdp_auto_start = 1
let g:mkdp_auto_close = 1
let g:mkdp_browser = '/bin/chromium'
let g:mkdp_theme = 'dark'
let g:neovide_transparency = 0.95
set guifont=Noto\ Sans\ Mono:h11

lua <<EOF
require'nvim-treesitter.configs'.setup {
	ensure_installed = "javascript", "html", "css",     -- one of "all", "language", or a list of languages
	highlight = {
		enable = true,              -- false will disable the whole extension
		disable = {},  -- list of language that will be disabled
	}
}
require'nvim-ts-autotag'.setup {}
EOF

"lua <<EOF
"require'gitsigns'.setup {
"	signs = {
"
"	    add          = { text = '█' },
"	    change       = { text = '█' },
"	    -- add          = { text = '│' },
"	    -- change       = { text = '│' },
"	    delete       = { text = '_' },
"	    topdelete    = { text = '‾' },
"	    changedelete = { text = '~' },
"	    untracked    = { text = '┆' },
"	},
"	signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
"	numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
"	linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
"	word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
"	watch_gitdir = {
"	  interval = 1000,
"	  follow_files = true
"	},
"	attach_to_untracked = true,
"	current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
"	current_line_blame_opts = {
"	  virt_text = true,
"	  virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
"	  delay = 1000,
"	  ignore_whitespace = false,
"	},
"	current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
"	sign_priority = 6,
"	update_debounce = 100,
"	status_formatter = nil, -- Use default
"	max_file_length = 40000, -- Disable if file is longer than this (in lines)
"	preview_config = {
"	  -- Options passed to nvim_open_win
"	  border = 'single',
"	  style = 'minimal',
"	  relative = 'cursor',
"	  row = 0,
"	  col = 1
"	},
"	yadm = {
"	    enable = false
"	},
"}
"EOF