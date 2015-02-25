set wildignore+=*/.git/*,*/log/*,*/node_modules/*,*/bower_components/*,*/dist/*,*/build/*,*/karma/*,*/.tmp/*,./tags
let g:ctags_regenerate_args = "--exclude='build/' --exclude='.tmp/' --exclude='karma/' --exclude='dist/' --exclude='bower_components/' --exclude='node_modules/' --exclude='vendor/'"
let NERDTreeIgnore =["build$" ,"node_modules$", "vendor$","bower_components$","tags$"]
autocmd BufWritePost *.* call UpdateTags()

