if exists('g:autoloaded_fugitive_googlesource')
  finish
endif
let g:autoloaded_fugitive_googlesource = 1

function! fugitive_googlesource#FugitiveUrl(...) abort
  if a:0 != 1 || type(a:1) != type({})
    return ''
  end
  let opts = a:1

  let remote = get(opts, 'remote', '') " e.g. 'https://chromium.googlesource.com/v8/v8.git'
  " Fallback to another plugin if it isn't a googlesource.com git repo
  if remote !~# '^https://[^/.]\+.googlesource.com/[^/]\+/[^/]\+\.git$'
    return ''
  end

  let commit_or_branch = opts.commit " e.g. 'main', '5ee194a1a3414d9bcabbf3dce5b67cb03326d423'
  let ref = commit_or_branch . '/'
  if commit_or_branch !~# '^[0-9a-f]\{40}$'
    let ref = 'refs/heads/' . ref
  endif

  let url = remote . '/+/' . ref . opts.path
  let line = get(opts, 'line1', 0)
  if line > 0
    let url .= '#' . line
  endif

  return url
endfunction
