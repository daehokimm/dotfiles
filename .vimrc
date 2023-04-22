set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" Daehokimm Settings
Plugin 'elzr/vim-json'
Plugin 'nanotech/jellybeans.vim'
Plugin 'godlygeek/tabular'
Plugin 'preservim/vim-markdown'
Plugin 'iamcco/markdown-preview.nvim'
Plugin 'Yggdroot/indentLine'
Plugin 'dense-analysis/ale'
Plugin 'scrooloose/nerdtree'
Plugin 'chrismetcalf/vim-yankring'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'mhinz/vim-signify'
Plugin 'mhinz/vim-startify'
Plugin 'pechorin/any-jump.vim'
Plugin 'fatih/vim-go'
Plugin 'maralla/completor.vim'  " Go async auto complete
Plugin 'pangloss/vim-javascript'
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'vimwiki/vimwiki'
Plugin 'rust-lang/rust.vim'

" VIM 옵션
syntax on												" 구문강조 사용
set autoindent											" 자동 들여쓰기
set smartindent											" 스마트한 들여쓰기
set shiftwidth=2										" 자동 들여쓰기 4칸
set tabstop=2											" 탭을 4칸으로
set ignorecase											" 검색시 대소문자 무시, set ic 도 가능
set hlsearch											" 검색어 강조, set hls 도 가능
set number												" 행번호 표시, set nu 도 가능
set ruler												" 화면 우측 하단에 현재 커서의 위치(줄,칸) 표시
set cursorline											" 편집 위치에 커서 라인 설정
set laststatus=2										" 상태바 표시를 항상한다
set incsearch											" 키워드 입력시 점진적 검색
set t_Co=256											" 색 조정
set history=1000                                        " vi 편집기록 기억갯수 .viminfo에 기록
set background=dark
set backspace=indent,eol,start  " more powerful backspacing
set autochdir

let delimitMate_expand_cr=1                     " 자동괄호

" 색상 옵션
filetype plugin indent on    " required
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" clipboard
set clipboard=unnamed

" lint
let g:indentLine_char="⦙"
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 'never'

" markdown
let g:vim_markdown_folding_level = 6
let g:vim_markdown_toc_autofit = 1

" NERDTree
let NERDTreeShowHidden = 1
let NERDTreeWinSize = 35
nmap <silent> <Leader>t :NERDTreeToggle<CR>

" signify
set updatetime=100

" startify
let g:startify_bookmarks = systemlist("cut -sd' ' -f 2- ~/.NERDTreeBookmarks")

" GO
" - Common Go commands
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage-toggle)
au FileType go nmap <Leader>e <Plug>(go-rename)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
" - Navigation commands
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
" - Doc
let g:go_doc_popup_window = 1
" Enable lsp for go by using gopls
let g:completor_filetype_map = {}
let g:completor_filetype_map.go = {'ft': 'lsp', 'cmd': 'gopls -remote=auto'}"

" Smarter tab line 활성화: 모든 파일 버퍼 출력
let g:airline#extensions#tabline#enabled = 1
" All of your Plugins must be added before the following line

" wiki
let g:vimwiki_list = [
			\{
			\		'path': '~/workspace/wiki',
			\		'ext':	'.md',
			\		'diary_rel_path': './diary',
			\}
\]
let g:cvimwiki_conceallevel = 0
let g:vimwiki_global_ext = 0

command! WikiIndex :VimwikiIndex
nmap <LocalLeader>ww <Plug>VimwikiIndex
nmap <LocalLeader>wi <Plug>VimwikiDiaryIndex
nmap <LocalLeader>w<LocalLeader>w <Plug>VimwikiMakeDiaryNote
nmap <LocalLeader>wt :VimwikiTable<CR>
au BufNewFile ~/workspace/wiki/diary/*.md :silent 0r !~/.vim/bin/generate-vimwiki-diary-template.sh '%'

call vundle#end()            " required

colorscheme jellybeans
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Custom Functions
" https://stackoverflow.com/a/4293538
function WriteCreatingDirs()
  execute ':silent !mkdir -p %:h'
  execute ':write'
endfunction
command W call WriteCreatingDirs()
