Plug 'tpope/vim-markdown'
Plug 'iamcco/markdown-preview.vim'
Plug 'klen/python-mode'

" vim-markdown {
    au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=markdown
    let g:vim_markdown_folding_disabled=1
    let g:vim_markdown_no_default_key_mappings=1
" }
" MarkDownPreview {
    let g:mkdp_path_to_chrome = "google-chrome-stable"
    let g:mkdp_auto_start = 0
    " 设置为 1 可以在打开 markdown 文件的时候自动打开浏览器预览，只在打开
    " markdown 文件的时候打开一次

    let g:mkdp_auto_open = 0
    " 设置为 1 在编辑 markdown 的时候检查预览窗口是否已经打开，否则自动打开预
    " 览窗口

    let g:mkdp_auto_close = 1
    " 在切换 buffer 的时候自动关闭预览窗口，设置为 0 则在切换 buffer 的时候不
    " 自动关闭预览窗口

    let g:mkdp_refresh_slow = 0
    " 设置为 1 则只有在保存文件，或退出插入模式的时候更新预览，默认为 0，实时
    " 更新预览
" }

" PyMode {
    " Disable if python support not present
    if !has('python') && !has('python3')
        let g:pymode = 0
    endif

    let g:pymode_python = 'python3'
    let g:pymode_lint = 0
    let g:pymode_lint_checkers = ['pyflakes']
    let g:pymode_trim_whitespaces = 1
    let g:pymode_options = 0
    let g:pymode_rope = 0
" }
" python语法实时检查 {
    " python fly check, 弥补syntastic只能打开和保存才检查语法的不足
    "let g:pyflakes_use_quickfix = 0

    " for python.vim syntax highlight
    " let python_highlight_all = 1
" }
