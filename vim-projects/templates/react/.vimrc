set wildignore+=*/.git/*,*/node_modules/*,*/dist/*,*/build/*,*/static/*,./tags
let g:ctags_regenerate_args = "--exclude='build/' --exclude='.tmp/' --exclude='static/' --exclude='dist/' --exclude='node_modules/'"
let NERDTreeIgnore =["build$" ,"node_modules$", "vendor$","static$","tags$"]
autocmd BufWritePost *.* call UpdateTags()

