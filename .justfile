#!/usr/bin/env -S just --justfile

# Make the default recipe just list possible recipes. Taken from the
# `just` documentation:
#     https://github.com/casey/just?tab=readme-ov-file#listing-available-recipes
# 
default:
    @just --list --unsorted --justfile {{justfile()}}

alias b := build
alias s := serve
alias c := clean
alias o := open

build-dir := env('BUILD_DIR', 'build')
pdf-viewer := env('PDF_VIEWER', 'okular')
html-viewer := env('HTML_VIEWER', 'qutebrowser')

# Extra arguments that will get passed to `mkdocs build` and `mkdocs serve`:
# - `-s` makes `mkdocs` treat warnings as erros
# - `--no-directory-urls` forces the markdown files to be directly translated
#   into HTML instead of using the base name as the directory and adding an
#   'index.html' inside of it.
mkdocs-build-args := '--strict --no-directory-urls'
mkdocs-serve-args := '--clean --livereload'

build: make-build-dir
    #!/usr/bin/env fish
    mkdocs build {{mkdocs-build-args}}

serve in-bg='false': build
    #!/usr/bin/env fish

    if [ '{{in-bg}}' = 'true' ]
        mkdocs serve {{mkdocs-build-args}} {{mkdocs-serve-args}} &>/dev/null &
    else
        mkdocs serve {{mkdocs-build-args}} {{mkdocs-serve-args}}
    end

clean:
    rm -r {{build-dir}}

open: build
    #!/usr/bin/env fish
    '{{html-viewer}}' build/index.html

[private]
make-build-dir:
    @mkdir -p '{{build-dir}}/'
