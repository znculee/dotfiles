" DEPRECATED. Plz refer to https://github.com/znculee/lazyvim
"                                _
"                         _   __(_)___ ___  __________
"                        | | / / / __ `__ \/ ___/ ___/
"                        | |/ / / / / / / / /  / /__
"                        |___/_/_/ /_/ /_/_/   \___/
"    https://raw.githubusercontent.com/znculee/dotfiles/master/vim/.vimrc
"                 _  __ _       __                       __    _
"                | |/ /(_)___  / /_____  ____  ____ _   / /   (_)
"                |   // / __ \/ __/ __ \/ __ \/ __ `/  / /   / /
"               /   |/ / / / / /_/ /_/ / / / / /_/ /  / /___/ /
"              /_/|_/_/_/ /_/\__/\____/_/ /_/\__, /  /_____/_/
"                                           /____/

" GENERAL
  set nocompatible
  set noswapfile
  set encoding=utf-8
  set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
  let mapleader=';'
  let maplocalleader=','
  nnoremap <space> :
  xnoremap <space> :
  set history=1024
  set wildmode=longest,list,full
  set clipboard=unnamed
  if has('nvim')
    let g:python3_host_prog='/opt/homebrew/bin/python3.12'
  endif

" vim-plug

  call plug#begin('~/.vim/plugged')

  " Plugin: UI
    Plug 'Yggdroot/indentLine'
    Plug 'mhinz/vim-startify'
    Plug 'qpkorr/vim-bufkill'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'znculee/gruvbox' " morhetz/gruvbox
    Plug 'pseewald/vim-anyfold'

  " Plugin: Encoding
    Plug 'mbbill/fencview', {'on': 'FencAutoDetect'}

  " Plugin: Editing
    Plug 'bronson/vim-trailing-whitespace'
    Plug 'dkarter/bullets.vim'
    Plug 'junegunn/vim-easy-align'
    Plug 'matze/vim-move'
    Plug 'scrooloose/nerdcommenter'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-surround'

  " Plugin: Finder & Motions
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.8' }
    Plug 'Yggdroot/LeaderF', {'do': './install.sh'}
    if has('nvim')
      Plug 'znculee/hop.nvim'
    endif

  " Plugin: Git
    Plug 'tpope/vim-fugitive'

  " Plugin: Completion & Syntastic
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
      " coc-clangd
      " coc-cmake
      " coc-css
      " coc-git
      " coc-html
      " coc-json
      " coc-pyright
      " coc-rust-analyzer
        " rustup component add rust-src rust-analyzer clippy
      " coc-sh
      " coc-tsserver
      " coc-vimlsp
      " coc-vimtex
    Plug 'rhysd/vim-grammarous', {'on': 'GrammarousCheck'}

  " Plugin: AI
    "Plug 'nvim-lua/plenary.nvim'  " duplicated
    Plug 'nvim-treesitter/nvim-treesitter'
    Plug 'olimorris/codecompanion.nvim'

  " Filetype: markdown
    Plug 'godlygeek/tabular', {'for': 'markdown'}
    Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

  " Filetype: tex
    Plug 'lervag/vimtex', {'for': 'tex'}

  " Filetype: fish
    Plug 'dag/vim-fish', {'for': 'fish'}

  " Filetype: julia
    Plug 'JuliaEditorSupport/julia-vim', {'for': 'julia'}

  " Filetype: asm
    Plug 'philj56/vim-asm-indent', {'for': 'asm'}

  " Filetype: rust
    Plug 'rust-lang/rust.vim'

  call plug#end()

" bullets.vim
  nnoremap <silent> <m-c> :ToggleCheckbox<cr>

" coc.nvim
  inoremap <silent><expr> <c-x><c-o> coc#refresh()
  nmap <silent> [g <plug>(coc-diagnostic-prev)
  nmap <silent> ]g <plug>(coc-diagnostic-next)
  nmap <silent> [e <plug>(coc-diagnostic-prev-error)
  nmap <silent> ]e <plug>(coc-diagnostic-next-error)
  nmap <silent> gd <cmd>Leaderf! coc definitions --auto-jump<cr>
  nmap <silent> gr <cmd>Leaderf! coc references --auto-jump<cr>
  nmap <silent> g<s-d> <cmd>Leaderf! coc declarations --auto-jump<cr>
  nmap <silent> gy <cmd>Leaderf! coc typeDefinitions --auto-jump<cr>
  nmap <silent> gi <cmd>Leaderf! coc implementations --auto-jump<cr>
  if !empty(system('poetry env info -p'))
    let s:current_python_path=trim(system('poetry env info -p')).'/bin/python'
  elseif !empty($CONDA_PREFIX)
    let s:current_python_path=$CONDA_PREFIX.'/bin/python'
  else
    let s:current_python_path=$CONDA_PYTHON_EXE
  endif
  call coc#config('python', {'pythonPath': s:current_python_path})
  nmap <silent> gist :!isort %<cr>
  nmap <silent> gblk :!black %<cr>
  nmap <silent> grsf :!rustfmt %<cr>

" hop.nvim
  if has('nvim')
    lua require('hop').setup()
    map <silent> <leader>j <cmd>HopLineStartAC<cr>
    map <silent> <leader>k <cmd>HopLineStartBC<cr>
    map <silent> <leader>f <cmd>HopChar1AC<cr>
    map <silent> <leader>F <cmd>HopChar1BC<cr>
    map <silent> <leader>w <cmd>HopWord<cr>
    map <silent> <leader>/ <cmd>HopPattern<cr>
  endif

" indentLine
  let g:indentLine_char='|'
  let g:indentLine_enabled=0
  let g:indentLine_setColors = 0
  nnoremap <silent> <leader>i :IndentLinesToggle<cr>

" LeaderF
  let g:Lf_ShortcutF='<leader><leader>e'
  let g:Lf_ShortcutB='<leader><leader>b'
  let g:Lf_WildIgnore={
    \ 'dir': ['.svn','.git','.hg'],
    \ 'file': ['*.sw?','~$*','*.o','*.so','*.gz','*.zip',
             \ '.DS_Store','.localized','*.bak','*.exe',
             \ '*.pdf','*.jpg','*.png',
             \ '*.py[co]','*.np[yz]']
    \ }
  let g:Lf_DefaultMode='NameOnly'
  let g:Lf_CursorBlink=0
  let g:Lf_HideHelp=1
  let g:Lf_UseCache=0
  let g:Lf_IgnoreCurrentBufferName=1
  let g:Lf_ShowHidden=1
  let g:Lf_ShowDevIcons=0
  let g:Lf_UseVersionControlTool=0
  let g:Lf_WindowPosition='popup'
  let g:Lf_PreviewInPopup=1
  let g:Lf_PopupColorscheme='gruvbox_default'
  nmap <silent> <leader><leader><s-b> :LeaderfBufferAll<cr>
  nmap <silent> <leader><leader>l :LeaderfLine<cr>
  nmap <silent> <leader><leader><s-l> :LeaderfLineAll<cr>
  nmap <silent> <leader><leader>f :LeaderfFunction<cr>
  nmap <silent> <leader><leader><s-f> :LeaderfFunctionAll<cr>
  nmap <silent> <leader><leader><c-f> :Leaderf function --left --no-auto-preview --stayOpen<cr>
  nmap <silent> <leader><leader>r :LeaderfMru<cr>
  nmap <silent> <leader><leader>g :LeaderfRgInteractive<cr>

" markdown-preview.nvim
  nnoremap <silent> <M-m> :MarkdownPreview<cr>
  let g:mkdp_preview_options={'disable_filename':1}

" julia-vim
  let g:latex_to_unicode_auto=1

" vim-airline
  let g:airline#extensions#tabline#enabled=1
  let g:airline_theme='gruvbox'
  set laststatus=2
  au BufDelete * call airline#extensions#tabline#buflist#invalidate()

" vim-anyfold
  aug anyfold
    au!
    au Filetype * AnyFoldActivate
  aug END
  let g:LargeFile = 1048576
  au BufReadPre,BufRead * let f=getfsize(expand('%')) | if f > g:LargeFile | call AnyFoldLargeFile() | endif
  function AnyFoldLargeFile()
    aug anyfold
      au!
      au Filetype * setl fdm=indent
    aug END
  endfunction
  au BufRead * normal zR
  au User Startified normal! zR

" vim-bufkill
  function! SmartBufKill()
    let active_buffer_count=len(getbufinfo({'buflisted':1}))
    if expand('%:p') != '' && active_buffer_count > 1
      BD
    else
      bd
    endif
  endfunction
  noremap <silent> <C-c> :call SmartBufKill()<cr>

" vim-easy-align
  xmap ga <plug>(EasyAlign)
  nmap ga <plug>(EasyAlign)

" vim-grammarous
  let g:grammarous#hooks={}
  function! g:grammarous#hooks.on_check(errs) abort
    nmap <buffer><C-n> <plug>(grammarous-move-to-next-error)
    nmap <buffer><C-p> <plug>(grammarous-move-to-previous-error)
    nmap <buffer><C-f> <plug>(grammarous-fixit)
    nmap <buffer><C-r> <plug>(grammarous-remove-error)
  endfunction
  function! g:grammarous#hooks.on_reset(errs) abort
    nunmap <buffer><C-n>
    nunmap <buffer><C-p>
    nunmap <buffer><C-f>
    nunmap <buffer><C-r>
  endfunction

" vim-markdown
  let g:vim_markdown_folding_disabled=1
  let g:vim_markdown_emphasis_multiline=0
  set conceallevel=2
  let g:vim_markdown_conceal_code_blocks=0
  let g:vim_markdown_math=1
  let g:vim_markdown_frontmatter=1
  let g:vim_markdown_new_list_item_indent=0

" vim-startify
  let g:startify_lists=[{'type':'files','header':['   MRU']}]

" vimtex
  let g:tex_flavor='latex'
  let g:vimtex_compiler_method='latexmk'
  let g:vimtex_compiler_latexmk={'out_dir': 'out'}
  let g:vimtex_quickfix_open_on_warning=0
  let g:vimtex_toc_config={
    \ 'split_pos': 'full',
    \ 'layer_status': {'content': 1,'label': 0,'todo': 0,'include': 0},
    \ 'show_help': 0
    \ }
  let g:vimtex_view_method='skim'
  let g:vimtex_view_skim_activate=0
  let g:vimtex_view_skim_reading_bar=0
  let g:vimtex_compiler_progname='nvr'
  nmap <localleader>lp <plug>(vimtex-compile-ss)
  let g:vimtex_syntax_conceal={
    \ 'math_bounds': 0,
    \ 'math_super_sub': 0
    \ } " overwrite g:tex_conceal

" COLORS
  syntax enable
  set background=dark
  let g:gruvbox_italic=1
  let g:gruvbox_invert_selection=0
  colorscheme gruvbox

" STYLE
  set backspace=2    " indent,eol,start
  set tabstop=4      " 'ts' number of visual spaces per <Tab>
  set softtabstop=-1 " number of <Tab> spaces while editing, same as tabstop
  set shiftwidth=0   " namber of indent spaces, same as tabstop
  set expandtab      " tabs are spaces
  if &modifiable
    set fileformat=unix
  endif
  set wrap
  set breakindent
  set colorcolumn=120
  set textwidth=79
  au BufEnter * set fo-=t fo-=c fo+=q
  au Filetype text,markdown,tex,help,json setl cc= lbr
  au Filetype text,markdown,gitcommit,vim,sh,html,css setl ts=2
  au Filetype asm setl ts=8 ft=nasm
  au FileType yaml syn region jinja start="{%" end="%}"
  au FileType yaml hi link jinja GruvboxAqua
  au FileType codecompanion setl ft=markdown

" UI CONFIG
  set t_Co=256              " number of colors
  set number                " 'nu' show line numbers
  set cursorline            " highlight current line
  filetype plugin indent on " detection:on plugin:on indent:on
  set showmatch             " highlight matching [{()}]
  set wildmenu              " visual autocomplete for command menu
  set vb t_vb=              " disable error bell
  set completeopt-=preview  " disable preview window
  set splitright            " put the new buffer on the right
  set guicursor=a:blinkon0  " disable cursor-styling
  if !has('nvim')
    let &t_ZH="\e[3m" | let &t_ZR="\e[23m"
    set guicursor=
  endif

" EDITING
  nnoremap <leader>. :cd %:p:h<bar>:pwd<cr>

" MOTION
  inoremap <c-h> <left>
  inoremap <c-j> <down>
  inoremap <c-k> <up>
  inoremap <c-l> <right>
  noremap \ ;
  noremap <bar> ,
  let s:essay_mode_enable=0
  function! ToggleEssayMode()
    if s:essay_mode_enable
      unmap j
      unmap k
      unmap 0
      unmap $
      let s:essay_mode_enable=0
    else
      nnoremap j gj
      nnoremap k gk
      nnoremap 0 g0
      nnoremap $ g$
      let s:essay_mode_enable=1
    endif
  endfunction
  nnoremap <silent> gl :call ToggleEssayMode()<cr>

" REPEAT
  nnoremap <m-q> @q
  nnoremap <m-w> @w

" WINDOWS
  nnoremap <silent> <c-j> :bn<cr>
  nnoremap <silent> <c-k> :bp<cr>

" SEARCHING
  set incsearch
  set hlsearch
  set ignorecase
  nnoremap <silent> <leader><space> :noh<cr>
  function! GetVisualSelection()
    let raw_search=@"
    let @/=substitute(escape(raw_search, '\/.*$^~[]'), "\n", '\\n', "g")
  endfunction
  xnoremap // ""y:call GetVisualSelection()<bar>:%s///gn<cr>
  if has('nvim')
    set inccommand=nosplit
  endif

" SPELL
  nnoremap <silent> zs :let &spf=expand('%:p:h').'/en.utf-8.add'<bar>:setl spell!<cr>

" DIFF
  set diffopt=vertical,filler

" TERMINAL
  set termguicolors
  tnoremap <c-w> <c-\><c-n><c-w>
  if has('nvim')
    au TermOpen * setl nonu | start
    nnoremap <m-t><m-t> :tabe<bar>:te<cr>
    nnoremap <m-v><m-t> :vs<bar>te<cr>
  else
    nnoremap <m-t><m-t> :tabe<bar>:term<cr><c-\><c-n><c-w>oi
    nnoremap <m-v><m-t> :vert term<cr>
  endif

" MOUSE
  set mouse=
  function! ToggleMouse()
    if &mouse == 'a'
      set mouse=
    else
      set mouse=a
    endif
  endfunc
  nnoremap <leader>m :call ToggleMouse()<bar>set mouse?<cr>

" META KEY
  if !has('nvim')
    function! s:metacode(key)
      execute "set <m-".a:key.">=\e".a:key
    endfunction
    for i in range(10)
      call s:metacode(nr2char(char2nr('0')+i))
    endfor
    for i in range(26)
      call s:metacode(nr2char(char2nr('a')+i))
      call s:metacode(nr2char(char2nr('A')+i))
    endfor
    for c in [',','.','/',';','{','}','?',':','-','_']
      call s:metacode(c)
    endfor
    set ttimeoutlen=50
  endif

" lua
lua require("ai")
