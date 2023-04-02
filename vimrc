"# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
"##@Version       : 202103260355-git
"# @Author        : Jason
"# @Contact       : jason@casjaysdev.com
"# @License       : WTFPL
"# @ReadME        : vim --help
"# @Copyright     : Copyright (c) 2021, Casjays Developments
"# @Created       : Friday Mar 26, 2021 03:55:55 EDT
"# @File          : vimrc
"# @Description   : VIM configuration file
"# @TODO          : Split into individual settings
"# @Other         :
"# @Resource      :
"# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Set vim home
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:vimdir = $HOME . '/.config/vim'
if !isdirectory($HOME . '/.config/vim')
    call mkdir($HOME . '/.config/vim')
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Paths
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set runtimepath+=~/.config/vim/
set undodir=~/.config/vim/.undo//
set backupdir=~/.config/vim/.backup//
set directory=~/.config/vim/.swp//
set viminfo+=n~/.config/vim/.info/viminfo
set rtp+=~/.local/share/vim/bundle
set rtp+=~/.local/share/vim/bundle/Vundle.vim
set rtp+=~/.local/share/vim/bundle/powerline/powerline/bindings/vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Python version
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if (has('python3') || has('pythonx'))
    let g:UltiSnipsUsePythonVersion = 3"
    let g:powerline_pycmd="py3"
    let g:python3_host_prog = "/usr/bin/python3"
elseif has('python')
    let g:UltiSnipsUsePythonVersion = 2"
    let g:powerline_pycmd="py"
    let g:python_host_prog = "/usr/bin/python2"
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => create directories
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if exists("*mkdir")
    for dir in ["templates", "spell", "plugin", "snippets", ".undo", ".backup", ".swp", ".info"]
        if !isdirectory($HOME . "/.config/vim/" . dir)
            call mkdir($HOME . "/.config/vim/" . dir)
        endif
    endfor
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Include plugins and install if needed
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable(glob("~/.config/vim/plugins.vimrc"))
    source ~/.config/vim/plugins.vimrc
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Check plugins and install if needed
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if ! filereadable(expand('~/.local/share/vim/bundle/vim-fugitive/.gitignore'))
    echoe "installing vim-fugitive..."
    silent !git clone -q "https://github.com/tpope/vim-fugitive" ~/.local/share/vim/bundle/vim-fugitive
endif

if ! filereadable(expand('~/.local/share/vim/bundle/vim-airline/.gitignore'))
    echoe "installing vim-airline..."
    silent !git clone -q "https://github.com/vim-airline/vim-airline" ~/.local/share/vim/bundle/vim-airline
endif

if ! filereadable(expand('~/.local/share/vim/bundle/vim-airline-themes/.gitignore'))
    echoe "installing vim-airline-themes..."
    silent !git clone -q "https://github.com/vim-airline/vim-airline-themes" ~/.local/share/vim/bundle/vim-airline-themes
endif

if ! filereadable(expand('~/.local/share/vim/bundle/Vundle.vim/.gitignore'))
    echoe "Downloading Vundle to manage plugins..."
    silent !git clone -q "https://github.com/VundleVim/Vundle.vim" ~/.local/share/vim/bundle/Vundle.vim
    silent !vim +PluginInstall +qall
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Install Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call vundle#begin('~/.local/share/vim/bundle')
Plugin 'VundleVim/Vundle.vim'                                    " plugin manager
Plugin 'airblade/vim-gitgutter'                                  " shows a git diff in the gutter
Plugin 'airblade/vim-rooter'                                     " Changes working directory to project root
Plugin 'chazy/dirsettings'                                       " directory tree-specific settings
Plugin 'Chiel92/vim-autoformat'                                  " Format code with one button press
Plugin 'ctrlpvim/ctrlp.vim'                                      " Fuzzy file, buffer, mru, tag, etc finder
Plugin 'editorconfig/editorconfig-vim'                           " EditorConfig plugin for Vim
Plugin 'godlygeek/tabular'                                       " Vim script for text filtering and alignment
Plugin 'jiangmiao/auto-pairs'                                    " Insert or delete brackets
Plugin 'scrooloose/nerdtree'                                     " A tree explorer plugin for vim
Plugin 'jistr/vim-nerdtree-tabs'                                 " NERDTree and tabs together
Plugin 'Xuyuanp/nerdtree-git-plugin'                             "
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'                 "
Plugin 'jreybert/vimagit'                                        " Ease your git workflow
Plugin 'junegunn/fzf'                                            " A command-line fuzzy finder
Plugin 'mhinz/vim-startify'                                      " The fancy start screen
Plugin 'plasticboy/vim-markdown'                                 " Syntax highlighting, matching rules and mappings
Plugin 'prettier/vim-prettier'                                   " A vim plugin wrapper for prettier
Plugin 'scrooloose/nerdcommenter'                                "
Plugin 'sheerun/vim-polyglot'                                    "
Plugin 'tpope/vim-fugitive'                                      "
Plugin 'tpope/vim-surround'                                      "
Plugin 'tpope/vim-commentary'                                    " comment stuff out
Plugin 'luochen1990/rainbow'                                     " Rainbow Parentheses Improved
Plugin 'vim-airline/vim-airline'                                 " lean & mean status/tabline for vim that's light as air
Plugin 'vim-airline/vim-airline-themes'                          " A collection of themes for vim-airline
Plugin 'vim-python/python-syntax'                                " Python syntax highlighting for Vim
Plugin 'vim-scripts/bash-support.vim'                            " Write and run BASH-scripts using menus and hotkeys
Plugin 'vim-scripts/taglist.vim'                                 " Source code browser plugin
Plugin 'wolfgangmehner/vim-support'                              " Edit VimL scripts in Vim/gVim/Neovim
Plugin 'lifepillar/vim-colortemplate'                            " color template
Plugin 'MarcWeber/vim-addon-mw-utils'                            " interpret a file by function
Plugin 'dbeniamine/cheat.sh-vim'                                 " access cheat.sh sheets
Plugin 'honza/vim-snippets'                                      " snippets
Plugin 'vitalk/vim-shebang'                                      " set shebang line
Plugin 'chrisbra/unicode.vim'                                    " Unicode glyphs
Plugin 'ryanoasis/vim-devicons'                                  " Adds file type icons to Vim plugins
Plugin 'justinmk/vim-sneak'                                      " The missing motion for Vim
Plugin 'unblevable/quick-scope'                                  " Lightning fast left-right movement in Vim
Plugin 'dracula/vim', { 'name': 'dracula'  }                     " Dracula theme
Plugin 'wakatime/vim-wakatime'                                   " plugin for productivity metrics
Plugin 'ervandew/supertab'                                       " Supertab is a vim plugin which allows you to use <Tab>
Plugin 'Shougo/ddc.vim'                                          " asynchronous completion framework
Plugin 'roxma/nvim-yarp'                                         " required for deoplete
Plugin 'garbas/vim-snipmate'                                     " snippets
Plugin 'tomtom/tlib_vim'                                         " required for vim-snipmate
Plugin 'vim-scripts/grep.vim'                                    " Grep search tools integration with Vim
Plugin 'vim-scripts/CSApprox'                                    " Make gvim-only colorschemes work transparently in terminal vim
Plugin 'Raimondi/delimitMate'                                    " Automatic closing of quotes, parenthesis, brackets
Plugin 'dense-analysis/ale'                                      " Asynchronous Lint Engine
Plugin 'ekalinin/Dockerfile.vim'                                 " Vim syntax file for Docker's Dockerfile and snippets for snipMate

if (has('ctags'))
    Plugin 'majutsushi/tagbar'                                   " Provides an easy way to browse the tags of the current file
endif

if (has('python3') || has('python'))
    Plugin 'Shougo/deoplete.nvim'                                " asynchronous completion framework
    Plugin 'sirver/ultisnips'                                    "
    Plugin 'roxma/vim-hug-neovim-rpc'                            " required for deoplete
endif

let g:make = 'gmake'
if exists('make')
        let g:make = 'make'
endif
Plugin 'Shougo/vimproc.vim', {'do': g:make}

call vundle#end()

"*****************************************************************************
"" Custom bundles
"*****************************************************************************
"" Include user's extra bundle
if filereadable(expand("~/.config/vim/local.bundles"))
    source ~/.config/vim/local.bundles
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Defaults
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set term=xterm-256color

if has('unix')
    if filereadable(glob("/usr/bin/bash"))
        set shell=/usr/bin/bash
    elseif filereadable(glob("/bin/bash"))
        set shell=/bin/bash
    endif
elseif has('darwin')
    if filereadable(glob("/usr/local/bin/bash"))
        set shell=/usr/local/bin/bash
    elseif filereadable(glob("/bin/bash"))
        set shell=/bin/bash
    elseif filereadable(glob("/bin/zsh"))
        set shell=/bin/zsh
    endif
endif

set nocompatible
filetype plugin indent on
syntax on
set autoindent
set autoread
set backup
set clipboard+=unnamedplus
set colorcolumn=+3
set complete=.,w,b,u,t,i,kspell
set completeopt=menu,preview,longest
set cursorline
set encoding=UTF-8
set expandtab
set ffs=unix,mac,dos
set hlsearch
set incsearch
set magic
set noconfirm
set nopaste
set number
set path+=**
set relativenumber
set ruler
set scrolloff=8
set shiftwidth=2
set showcmd
set showmatch
set smartindent
set softtabstop=2
set swapfile
set t_Co=256
set tabstop=2
set textwidth=120
set title
set undofile
set wildmenu
set wildmode=longest,list,full
set cryptmethod=blowfish2
set eol
au BufWritePre * let &bex = '-' . strftime("%Y%m%d-%H%M%S") . '.vimbackup'
let g:session_autoload = 'no'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme dracula
set background=dark
highlight Whitespace cterm=underline gui=underline ctermbg=NONE guibg=NONE ctermfg=yellow guifg=yellow
highlight SpecialKey ctermfg=grey guifg=grey70
highlight link javascriptType Keyword
"hi LineNr ctermfg=242
"hi CursorLineNr ctermfg=242
set guifont=Hack\ Nerd\ Font\ 10
if has('gui_running')
    colorscheme dracula
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Global ignore
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildignore+=*node_modules/**
set wildignore+=*vendor/**
set wildignore+=*.git/*
set wildignore+=*~,*.swp,*.swo,*.tmp
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => leader mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=','
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Splits and Tabbed Files
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow splitright
let g:minimap_highlight     = 'visual'
let g:python_highlight_all  = 0
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Remap Keys
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nnoremap <S-Tab> <C-w>w
nnoremap <Leader>r :%s///g<Left><Left>
nnoremap <Leader>rc :%s///gc<Left><Left><Left>
xnoremap <Leader>r :s///g<Left><Left>
xnoremap <Leader>rc :s///gc<Left><Left><Left>
nnoremap <silent> s* :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> s* "sy:let @/=@s<CR>cgn
nnoremap <leader>sp :normal! mz[s1z=`z<CR>
inoremap <expr> <Down> pumvisible() ? "<C-n>" :"<Down>"
inoremap <expr> <Up> pumvisible() ? "<C-p>" : "<Up>"
inoremap <expr> <Right> pumvisible() ? "<C-y>" : "<Right>"
inoremap <expr> <CR> pumvisible() ? "<C-y>" :"<CR>"
inoremap <expr> <Left> pumvisible() ? "<C-e>" : "<Left>"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Basic autocommands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd VimResized * wincmd =
au FocusGained,BufEnter * :checktime
autocmd InsertLeave * silent! set nopaste
autocmd BufNewFile,BufRead requirements*.txt set syntax=python
autocmd FileType make setlocal noexpandtab
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Startupify configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:startify_custom_header = [
\    '                                                      ',
\    '   _____          _                 _____             ',
\    '  / ____|        (_)               |  __ \            ',
\    ' | |     __ _ ___ _  __ _ _   _ ___| |  | | _____   __',
\    ' | |    / _` / __| |/ _` | | | / __| |  | |/ _ \ \ / /',
\    ' | |___| (_| \__ \ | (_| | |_| \__ \ |__| |  __/\ V / ',
\    '  \_____\__,_|___/ |\__,_|\__, |___/_____/ \___| \_/  ',
\    '                _/ |       __/ |                      ',
\    '               |__/       |___/                       ',
\    '                                                      ',
\    ]
let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1
let g:webdevicons_enable_startify = 1
let g:startify_enable_special = 0
let g:startify_session_dir = '~/.config/vim/session'
let g:startify_bookmarks = [
\     { 'b': '~/.bashrc' },
\     { 'p': '~/.profile' },
\     { 'v': '~/.vimrc' },
\     ]

let g:startify_lists = [
\     { 'type': 'files',     'header': ['   Files']                },
\     { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
\     { 'type': 'sessions',  'header': ['   Sessions']                     },
\     { 'type': 'bookmarks', 'header': ['   Bookmarks']                    },
\     ]

function! StartifyEntryFormat()
    return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"autocmd vimenter * NERDTree       " I like Startupify
map <C-z> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable            = '▸'
let g:NERDTreeDirArrowCollapsible           = '▾'
let NERDTreeShowLineNumbers                 = 1
let NERDTreeShowHidden                      = 1
let NERDTreeMinimalUI                       = 0
let g:nerdtree_tabs_open_on_console_startup = 0
let g:nerdtree_tabs_synchronize_view        = 0
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Syntastic configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = [ 'jshint' ]
let g:syntastic_ocaml_checkers = ['merlin']
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_shell_checkers = ['shellcheck']
let g:syntastic_sh_shellcheck_args="-e SC2059,SC2148,SC2027,SC2034,SC2086"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => snipMate
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:snipMate = get(g:, 'snipMate', {})
let g:snipMate = { 'snippet_version' : 1 }
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => deoplete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has('python3')
    let g:deoplete#enable_at_startup = 1
elseif has('pythonx')
    let g:deoplete#enable_at_startup = 0
elseif has('python')
    let g:deoplete#enable_at_startup = 0
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>  ultisnips
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsListSnippets        = '<c-l>'
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger ="<s-tab>"
let g:UltiSnipsNoPythonWarning     = 1
let g:UltiSnipsEnableSnipMate      = 1
let g:UltiSnipsSnippetDirectories  = [$HOME.'/.config/vim/UltiSnips']
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>  gitgutter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_sign_added              = '▎'
let g:gitgutter_sign_modified           = '▎'
let g:gitgutter_sign_removed            = '契'
let g:gitgutter_sign_removed_first_line = '契'
let g:gitgutter_sign_modified_removed   = '▎'
let g:gitgutter_preview_win_floating    = 1
let g:gitgutter_enabled                 = 1
highlight GitGutterAdd    guifg=#98c379 ctermfg=2
highlight GitGutterChange guifg=#61afef ctermfg=3
highlight GitGutterDelete guifg=#e06c75 ctermfg=1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>  nerdcommenter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap <silent> <space>/ :Commentary<CR>
autocmd FileType javascript.jsx setlocal commentstring={/*\ %s\ */}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>  commentary
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" function! Comment()
"     if (mode() == "n" )
"         execute "Commentary"
"     else
"         execute "'<,'>Commentary"
"     endif
" endfunction
" vnoremap <silent> <space>/ :call Comment()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>  vim-rooter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rooter_silent_chdir = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>  fzf
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

" The Silver Searcher
if executable('ag')
    let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
    set grepprg=ag\ --nogroup\ --nocolor
endif

" ripgrep
if executable('rg')
    let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
    set grepprg=rg\ --vimgrep
    command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>e :FZF -m<CR>
"Recovery commands from history through FZF
nmap <leader>y :History:<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>  sneak
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:sneak#label = 1
let g:sneak#use_ic_scs = 1
let g:sneak#s_next = 1
map gS <Plug>Sneak_,
map gs <Plug>Sneak_;
highlight Sneak guifg=black guibg=#00C7DF ctermfg=black ctermbg=cyan
highlight SneakScope guifg=red guibg=yellow ctermfg=red ctermbg=yellow
let g:sneak#prompt = '🔎 '
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>  quickscope
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
highlight QuickScopePrimary guifg='#00C7DF' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#eF5F70' gui=underline ctermfg=81 cterm=underline
let g:qs_max_chars=150
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>  rainbow
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:rainbow#pairs = [['(', ')'], ['[', ']'], ['{', '}']]
let g:rainbow_conf = {'guis': ['bold']}
let g:rainbow_active = 1
let g:rainbow_conf = {
\   'guifgs': ['#858580', '#8FBCBB', '#D08770', '#A3BE8C', '#EBCB8B', '#B48EAD', '#80a880', '#887070'],
\   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\   'guis': [''],
\   'cterms': [''],
\   'operators': '_,_',
\   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\   'separately': {
\       '*': {},
\       'markdown': {
\           'parentheses_options': 'containedin=markdownCode contained',
\       },
\       'lisp': {
\       'guifgs': ['#858580', '#8FBCBB', '#D08770', '#A3BE8C', '#EBCB8B', '#B48EAD', '#80a880', '#887070'],
\       },
\       'jsx': {
\       'guifgs': ['#858580', '#8FBCBB', '#D08770', '#A3BE8C', '#EBCB8B', '#B48EAD', '#80a880', '#887070'],
\       },
\       'haskell': {
\           'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/\v\{\ze[^-]/ end=/}/ fold'],
\       },
\       'vim': {
\           'parentheses_options': 'containedin=vimFuncBody',
\       },
\       'perl': {
\           'syn_name_prefix': 'perlBlockFoldRainbow',
\       },
\       'stylus': {
\           'parentheses': ['start=/{/ end=/}/ fold contains=@colorableGroup'],
\       },
\       'css': 0,
\   }
\}
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Copy selected text to system clipboard (requires gvim/nvim/vim-x11 installed):
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"set mouse=r
vmap <C-c> +yi
vmap <C-x> +c
vmap <C-v> c<ESC>+p
imap <C-v> <ESC>+pa
map <leader>c +y
map <leader>v +p
vnoremap <C-C> :w !putclip<CR><CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => When shortcut files are updated, renew bash and vifm configs with new material:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufWritePost ~/.config/bmdirs,~/.config/bmfiles !shortcuts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Disables automatic commenting on newline:
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Run xrdb whenever Xdefaults or Xresources are updated.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufWritePost *Xresources,*Xdefaults !xrdb %
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim Markdown
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_override_foldtext = 0
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_json_frontmatter = 1
let g:vim_markdown_follow_anchor = 1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Markdown
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup markdown
    autocmd Filetype markdown,rmd map <leader>w yiWi[<esc>Ea](<esc>pa)
    autocmd Filetype markdown,rmd inoremap ,n ---<Enter><Enter>
    autocmd Filetype markdown,rmd inoremap ,b ****<++><Esc>F*hi
    autocmd Filetype markdown,rmd inoremap ,s ~~~~<++><Esc>F~hi
    autocmd Filetype markdown,rmd inoremap ,e **<++><Esc>F*i
    autocmd Filetype markdown,rmd inoremap ,h ====<Space><++><Esc>F=hi
    autocmd Filetype markdown,rmd inoremap ,i ![](<++>)<++><Esc>F[a
    autocmd Filetype markdown,rmd inoremap ,a [](<++>)<++><Esc>F[a
    autocmd Filetype markdown,rmd inoremap ,1 #<Space><Enter><++><Esc>kA
    autocmd Filetype markdown,rmd inoremap ,2 ##<Space><Enter><++><Esc>kA
    autocmd Filetype markdown,rmd inoremap ,3 ###<Space><Enter><++><Esc>kA
    autocmd Filetype markdown,rmd inoremap ,l --------<Enter>
    autocmd Filetype rmd inoremap ,r ```{r}<CR>```<CR><CR><esc>2kO
    autocmd Filetype rmd inoremap ,p ```{python}<CR>```<CR><CR><esc>2kO
    autocmd Filetype rmd inoremap ,c ```<cr>```<cr><cr><esc>2kO
augroup END
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim devicons
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_unite = 1
let g:webdevicons_enable_vimfiler = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_ctrlp = 1
let g:webdevicons_enable_startify = 1
let g:webdevicons_enable_flagship_statusline = 1
let g:WebDevIconsUnicodeDecorateFileNodes = 1
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
let g:webdevicons_conceal_nerdtree_brackets = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1
let g:webdevicons_enable_denite = 1
let g:WebDevIconsUnicodeDecorateFileNodesDefaultSymbol = 'ƛ'
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim ale
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if (has('prettier') || has('eslint'))
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
let g:ale_fixers = { 'javascript': ['eslint'], }
let g:ale_fix_on_save = 1
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-prettier
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if (has('prettier') || has('eslint'))
let g:prettier#config#bracket_spacing = 'true'
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => go to last known place
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if has("autocmd")
    au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => editorconfig
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EditorConfig_max_line_indicator = "exceeding"
let g:EditorConfig_exclude_patterns = ['fugitive://.*','scp://.*']
let g:EditorConfig_preserve_formatoptions = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Autoformat configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType php setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType ruby setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType coffee,javascript setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4 textwidth=120
autocmd FileType html,htmldjango,xhtml,haml setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=0
autocmd FileType sass,scss,css setlocal tabstop=2 shiftwidth=2 softtabstop=2 textwidth=120
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ensure files are read as what I want:
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufRead,BufNewFile,FileType *.ms,*.me,*.mom,*.man set filetype=groff
autocmd BufRead,BufNewFile,FileType *.tex set filetype=tex
autocmd BufRead,BufNewFile,FileType *.md set filetype=markdown syntax=markdown
autocmd BufRead,BufNewFile,FileType *.lua set filetype=lua
autocmd BufRead,BufNewFile,FileType *.perl,*.pl,*.cgi set filetype=perl
autocmd BufRead,BufNewFile,FileType *.py,*.pyc set filetype=python
autocmd BufRead,BufNewFile,FileType *.php,*.php5,*.php7 set filetype=php
autocmd BufRead,BufNewFile,FileType *.txt set filetype=text
autocmd BufRead,BufNewFile,FileType *.cnf,*.conf,*.cfg set filetype=conf
autocmd BufRead,BufNewFile,FileType notes set syntax=markdown
autocmd BufRead,BufNewFile,FileType vimwiki set syntax=markdown
autocmd BufRead,BufNewFile,FileType *scratch* set filetype=text syntax=text
autocmd BufRead,BufNewFile,FileType /tmp/calcurse*,~/.local/share/editors/calcurse/* set filetype=markdown syntax=markdown
autocmd BufEnter * if &filetype == "" | setlocal ft=text | endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => spell
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim -c ":mkspell! ~/.config/vim/spell/en.utf-8.add" -c q  # run from shell
":mkspell! ~/.config/vim/spell/en.utf-8.add                # run from vim
set spelllang=en_us
set complete+=kspell
map <F7> :setlocal spell! spelllang=en_us<CR>
if filereadable(glob("~/.config/vim/spell/en.utf-8.add"))
    set spellfile=~/.config/vim/spell/en.utf-8.add
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Save as root
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! W :execute ':silent w !sudo tee % > /dev/null' | :edit!
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => create directory on save
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
augroup END
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => remove whitespaces on save
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! StripTrailingWhitespace()
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

let noStripWhiteSpaceTypes = ['markdown', 'notes', 'vimwiki', '*.md']
autocmd BufWritePre * if index(noStripWhiteSpaceTypes, &ft) < 0 | call StripTrailingWhitespace() | endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => useful functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd InsertEnter * set colorcolumn=160
autocmd InsertLeave * set colorcolumn=""
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
autocmd FileChangedShellPost * echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Powerline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2
set t_Co=256
let g:rehash256 = 1
let g:airline_theme='violet'
let g:airline_section_c = '%F'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#enabled = 1

function! ActiveStatus()
    let statusline=""
    let statusline.="%1*"
    let statusline.="%(%{'help'!=&filetype?'\ \ '.bufnr('%'):''}\ %)"
    let statusline.="%2*"
    let statusline.=""
    let statusline.="%{fugitive#head()!=''?'\ \ '.fugitive#head().'\ ':''}"
    let statusline.="%3*"
    let statusline.=""
    let statusline.="%4*"
    let statusline.="\ %<"
    let statusline.="%F"
    let statusline.="%{&modified?'\ \ +':''}"
    let statusline.="%{&readonly?'\ \ ':''}"
    let statusline.="%="
    let statusline.="\ %{''!=#&filetype?&filetype:'none'}"
    let statusline.="%(\ %{(&bomb\|\|'^$\|utf-8'!~#&fileencoding?'\ '.&fileencoding.(&bomb?'-bom':''):'').('unix'!=#&fileformat?'\ '.&fileformat:'')}%)"
    let statusline.="%(\ \ %{&modifiable?(&expandtab?'et\ ':'noet\ ').&shiftwidth:''}%)"
    let statusline.="%3*"
    let statusline.="\ "
    let statusline.="%2*"
    let statusline.=""
    let statusline.="%1*"
    let statusline.="\ %2v"
    let statusline.="\ %3p%%\ "
    set statusline.="%#warningmsg#"
    set statusline.="%{SyntasticStatuslineFlag()}"
    set statusline.="%*"
    return statusline
endfunction

function! InactiveStatus()
    let statusline=""
    let statusline.="%(%{'help'!=&filetype?'\ \ '.bufnr('%').'\ \ ':'\ '}%)"
    let statusline.="%{fugitive#head()!=''?'\ \ '.fugitive#head().'\ ':'\ '}"
    let statusline.="\ %<"
    let statusline.="%F"
    let statusline.="%{&modified?'\ \ +':''}"
    let statusline.="%{&readonly?'\ \ ':''}"
    let statusline.="%="
    let statusline.="\ %{''!=#&filetype?&filetype:'none'}"
    let statusline.="%(\ %{(&bomb\|\|'^$\|utf-8'!~#&fileencoding?'\ '.&fileencoding.(&bomb?'-bom':''):'').('unix'!=#&fileformat?'\ '.&fileformat:'')}%)"
    let statusline.="%(\ \ %{&modifiable?(&expandtab?'et\ ':'noet\ ').&shiftwidth:''}%)"
    let statusline.="\ \ "
    let statusline.="\ %2v"
    let statusline.="\ %3p%%\ "
    set statusline.="%#warningmsg#"
    set statusline.="%{SyntasticStatuslineFlag()}"
    set statusline.="%*"
    return statusline
endfunction

set statusline=%!ActiveStatus()
hi User1 guibg=#afd700 guifg=#005f00
hi User2 guibg=#005f00 guifg=#afd700
hi User3 guibg=#222222 guifg=#005f00
hi User4 guibg=#222222 guifg=#d0d0d0

augroup status
    autocmd!
    autocmd WinEnter * setlocal statusline=%!ActiveStatus()
    autocmd WinLeave * setlocal statusline=%!InactiveStatus()
    autocmd ColorScheme dark if(&background=="dark") | hi User1 guibg=#afd700 guifg=#005f00 | endif
    autocmd ColorScheme dark if(&background=="dark") | hi User2 guibg=#005f00 guifg=#afd700 | endif
    autocmd ColorScheme dark if(&background=="dark") | hi User3 guibg=#222222 guifg=#005f00 | endif
    autocmd ColorScheme dark if(&background=="dark") | hi User4 guibg=#222222 guifg=#d0d0d0 | endif
    autocmd ColorScheme dark if(&background=="light") | hi User1 guibg=#afd700 guifg=#005f00 | endif
    autocmd ColorScheme dark if(&background=="light") | hi User2 guibg=#005f00 guifg=#afd700 | endif
    autocmd ColorScheme dark if(&background=="light") | hi User3 guibg=#707070 guifg=#005f00 | endif
    autocmd ColorScheme dark if(&background=="light") | hi User4 guibg=#707070 guifg=#d0d0d0 | endif
augroup END
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => overwrite
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => if vimrc.local then lets source that
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if filereadable(glob('~/.config/local/vimrc.simple.local'))
    source ~/.config/local/vimrc.simple.local
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => end vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
