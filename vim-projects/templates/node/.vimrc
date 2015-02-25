set wildignore+=*/.git/*,*/log/*,*/node_modules/*,*/bower_components/*,./tags
let g:ctags_regenerate_args = "--exclude='lib/' --exclude='node_modules/' "
let NERDTreeIgnore =["lib$" ,"node_modules$","tags$"]
autocmd BufWritePost *.* call UpdateTags()
