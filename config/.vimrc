" ----------------------------------------------------------------------
"   BASIC
" ----------------------------------------------------------------------
set encoding=utf-8
set nobackup                " don't make foo~ files
set noswapfile
set updatetime=100

set number                  " show line numbers
se mouse+=a                 " don't select line numbers


" ----------------------------------------------------------------------
"   UI
" ----------------------------------------------------------------------
if (has("termguicolors"))
  set termguicolors         " enable 24bit true color
endif

syntax on
set ruler                   " always show ruler at the bottom
set laststatus=2
set noshowmode              " hide mode since displayed by 'lighline.vim'

highlight LineNr ctermfg=magenta

let g:lightline = {
  \   'colorscheme': 'Tomorrow_Night_Blue',
  \   'component_expand': {
  \     'linter_checking': 'lightline#ale#checking',
  \     'linter_warnings': 'lightline#ale#warnings',
  \     'linter_errors': 'lightline#ale#errors',
  \     'linter_ok': 'lightline#ale#ok',
  \   },
  \   'component_type': {
  \     'linter_checking': 'left',
  \     'linter_warnings': 'warning',
  \     'linter_errors': 'error',
  \     'linter_ok': 'left',
  \   },
  \   'active': {
  \     'right': [[
  \       'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok', 'lineinfo', 'percent', 'fileformat', 'fileencoding', 'filetype'
  \     ]]
  \   }
  \ }


" ----------------------------------------------------------------------
"   INDENTATION
" ----------------------------------------------------------------------
set autoindent
set smarttab


" ----------------------------------------------------------------------
"   SEARCHING
" ----------------------------------------------------------------------
set ignorecase              " Case-insensitive search
set smartcase               " Case-sensitive search if query contains uppercase
set incsearch               " Show first search result as query is typed


" ----------------------------------------------------------------------
"   PLUGINS
" ----------------------------------------------------------------------

" emmet
let g:user_emmet_leader_key=','       " press ,, to unleash emmet magic

" javascript syntax
let g:javascript_plugin_jsdoc = 1     " enable jsdoc syntax highlighting

" prettier
"let g:prettier#quickfix_enabled = 0
"let g:prettier#autoformat = 0
"autocmd BufWritePre,TextChanged,InsertLeave *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" ale (linting)
let g:ale_fix_on_save = 1
let g:ale_lint_delay = 100
let g:ale_lint_on_text_change = "always"
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\}
