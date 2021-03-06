syntax on
filetype plugin indent on

":XtermColorTable to see all colors"
set encoding=utf-8
set t_Co=256
set nu
set mouse=n
set nocompatible
set backspace=indent,eol,start
set ts=4
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set hlsearch
"粘贴模式切换"
set pastetoggle=<F12>
" 折叠
set foldmethod=indent
set foldlevelstart=9 ""99 是不折叠""
:nnoremap <space> za

" 常用操作
:inoremap "" ""<esc>i
:inoremap (( ()<esc>i
:inoremap [[ []<esc>i
:inoremap {{ {}<esc>i
"":inoremap (( ()<esc>a
"":inoremap [[ []<esc>a
"":inoremap {{ {}<esc>a
"返回上一行
:inoremap <Space><CR> <esc>ka <tab>
""插入时换行
:inoremap <C-o> <esc>o
" 保存
:inoremap JK <esc>:w<CR>
:nnoremap JK <esc>:w<CR>

"""""""""""""""""""""""""""""""""""""" 插件设置  """"""""""""""""""""""""""""""""""""""
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')
" Make sure you use single quotes

Plug 'guns/xterm-color-table.vim'
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'
" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
" Multiple Plug commands can be written in a single line using | separators
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
Plug 'ycm-core/YouCompleteMe'
Plug 'tenfyzhong/CompleteParameter.vim'
" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }
Plug 'fatih/molokai'
" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" Initialize plugin system
call plug#end()

""""""""""""""""""""   SirVer/ultisnips """"""""""""""""""""""""
" better key bindings for UltiSnipsExpandTrigger
""let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsExpandTrigger = "<s-tab>"

""""""""""""""""""""""""  VIM-GO """""""""""""""""""""""""""""
:nnoremap <F1> :GoDoc<CR>
:nnoremap <F2> :q<CR>
:nnoremap <F4> :GoRun %<CR>
:inoremap <F4> <esc>:w<CR> :GoRun %<CR>
:nnoremap <F5> :GoTest <CR>
:inoremap <F5> <esc>:w<CR> :GoTest <CR>

let g:go_fmt_command = "goimports" "格式化将默认的gofmt替换
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"
let g:go_version_warning = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_methods = 1
let g:go_highlight_generate_tags = 1
""let g:go_metalinter_autosave = 1
let g:godef_split=2
let g:rehash256 = 1
let g:molokai_original = 1
"go 配色方案"
colorscheme molokai

"""""""""""""""""  NERDTree """""""""""""""""""""""
" 打开和关闭NERDTree快捷键
map <F9> :NERDTreeToggle<CR>
" 设置宽度
let NERDTreeWinSize=35

"""""" Taqbar """"""""""""""""""""""""""""""""""""
nmap <F10> :TagbarToggle<CR>
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

"""""" CompleteParameter """"""""""""""""""""""""""""""""""""
inoremap <silent><expr> ( complete_parameter#pre_complete("()")
smap <C-j> <Plug>(complete_parameter#goto_next_parameter)
imap <C-j> <Plug>(complete_parameter#goto_next_parameter)
nmap <C-j> <Plug>(complete_parameter#goto_next_parameter)
smap <C-k> <Plug>(complete_parameter#goto_previous_parameter)
imap <C-k> <Plug>(complete_parameter#goto_previous_parameter)
nmap <C-k> <Plug>(complete_parameter#goto_previous_parameter)

let g:complete_parameter_py_keep_value = 1
let g:complete_parameter_py_remove_default = 1

"""""" YCM """"""""""""""""""""""""""""""""""""
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口
set completeopt=menuone,menu,longest "让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)

let g:ycm_show_diagnostics_ui = 0 "关闭语法提示
let g:ycm_add_preview_to_completeopt = 0 "关闭函数原型提示
let g:ycm_cache_omnifunc=0 " 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_server_log_level = 'info'
let g:ycm_complete_in_strings=1  "字符串中也能补全
let g:ycm_complete_in_comments = 0 "在注释输入中也能补全
let g:ycm_seed_identifiers_with_syntax=0 " 语法关键字补全
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_collect_identifiers_from_tags_files=1 " 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=1 " 从第2个键入字符就开始罗列匹配项
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

let g:ycm_python_interpreter_path = '/usr/bin/python'
let g:ycm_python_sys_path = ['/usr/lib/python3/dist-packages/', '/usr/local/lib/python3.5']
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '/root/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_semantic_triggers =  {
\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
\ 'cs,lua,javascript': ['re!\w{2}'],
\ }
" 指定文件才会弹补全窗口
let g:ycm_filetype_whitelist = {
\ "go":1,
\ "c":1,
\ "cpp":1,
\ "objc":1,
\ "sh":1,
\ "java":1,
\ "python":1,
\}

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

""""""""""""""""""""""""""""""" Display """""""""""""""""""""""""""""""
autocmd VimEnter *.java,*.py,*.c,*.cpp,*.h,*go TagbarToggle
autocmd VimEnter *.java,*.py,*.c,*.cpp,*.h,*go NERDTreeToggle
autocmd VimEnter * wincmd w

""""""""""""""""""""""""""""" HighLight """""""""""""""""""""""""
"放最后防止部分覆盖
"YMC 提示列表
highlight Pmenu ctermbg=236  ctermfg=15
highlight PmenuSel ctermbg=green  ctermfg=18
" 搜索高亮
highlight Search ctermbg=53  ctermfg=7
"折叠时显示"
highlight Folded ctermbg=235  ctermfg=3 cterm=BOLD
"只有文件列表生效
highlight CursorLine cterm=underline

""""""""""""""""""""""""""""" End """""""""""""""""""""""""""""
