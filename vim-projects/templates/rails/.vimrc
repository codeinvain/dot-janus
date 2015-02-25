set wildignore+=*/.git/*,*/log/*,*/public/uploads/*,*/tmp/*,*vendor*/,./tags
let g:ctags_regenerate_args = "--exclude='tmp/' --exclude='vendor/' --exclude='log/'"
let NERDTreeIgnore =["tmp$" ,"vendor$", "log$","tags$"]
autocmd BufWritePost *.* call UpdateTags()

