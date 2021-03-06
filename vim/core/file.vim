Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'dyng/ctrlsf.vim'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'bling/vim-bufferline'
Plug 'sjl/gundo.vim'

" gundo {
    set undodir=~/.vim/.cache/undo
    set undofile
    set undolevels=10         " Maximum number of changes that can be undone
    set undoreload=10        " Maximum number lines to save for undo on a buffer reload
" }

" ctrlp {
    let g:ctrlp_map = '<c-p>'
    let g:ctrlp_cmd = 'CtrlP'
    let g:ctrlp_working_path_mode = 'ra'
    let g:ctrlp_match_window_reversed = 0

    let g:ctrlp_custom_ignore = {
        \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
        \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
        \ }

    if executable('ag')
        let s:ctrlp_fallback = 'ag %s --nocolor -l -g ""'
    else
        let s:ctrlp_fallback = 'find %s -type f'
    endif
    if exists("g:ctrlp_user_command")
        unlet g:ctrlp_user_command
    endif
    let g:ctrlp_user_command = {
                \ 'types': {
                \ 1: ['.git', 'cd %s && git ls-files . --cached --exclude-standard --others'],
                \ 2: ['.hg', 'hg --cwd %s locate -I .'],
                \ },
                \ 'fallback': s:ctrlp_fallback
                \ }

" }

" ctrlp-funky {
    " CtrlP extensions
    let g:ctrlp_extensions = ['funky']
    let g:ctrlp_funky_syntax_highlight = 1
" }
" ctrlsf {
    " 工程内查找文件内容,先安装ag /the_silver_searcher
    let g:ctrlsf_ackprg = 'ag'
    nmap     <C-F>f <Plug>CtrlSFPrompt
    vmap     <C-F>f <Plug>CtrlSFVwordPath
    vmap     <C-F>F <Plug>CtrlSFVwordExec
    nmap     <C-F>n <Plug>CtrlSFCwordPath
    nmap     <C-F>p <Plug>CtrlSFPwordPath
" }

" NerdTree {
    " 自动开启nerdtree
    let g:nerdtree_tabs_open_on_console_startup = 0
    let g:nerdtree_tabs_open_on_gui_startup = 0
    "当打开vim且没有文件时自动打开NERDTree
    " if !g:is_gui
    "     autocmd StdinReadPre * let s:std_in=1
    "     autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    " endif
    "显示文件
    let NERDTreeShowFiles=1
    let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
    "显示隐藏文件
    let NERDTreeShowHidden=0
    let NERDTreeChDirMode=0
    let NERDTreeQuitOnOpen=1
    let NERDTreeMouseMode=2
    let NERDTreeKeepTreeInNewTab=1
    let NERDTreeWinSize=22
    let NERDTreeWinPos="left"
    "高亮显示当前文件或目录
    let NERDTreeHightCursorline=1
    "不显示'Bookmarks' label 'Press ? for help'
    let NERDTreeMinimalUI=1
    " s/v 分屏打开文件
    let g:NERDTreeMapOpenSplit = 's'
    let g:NERDTreeMapOpenVSplit = 'v'
" }
