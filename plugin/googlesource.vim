if exists("g:loaded_fugitive_googlesource") || v:version < 800 || &cp
  finish
endif
let g:loaded_fugitive_googlesource = 1

if !exists('g:fugitive_browse_handlers')
  let g:fugitive_browse_handlers = []
endif

if index(g:fugitive_browse_handlers, function('fugitive_googlesource#FugitiveUrl')) < 0
  call insert(g:fugitive_browse_handlers, function('fugitive_googlesource#FugitiveUrl'))
endif
