let s:cur_colorcolumn = 0

function! ToggleColorColumn()
  if s:cur_colorcolumn == 0
	let s:cur_colorcolumn = 80
  else
	let s:cur_colorcolumn = 0
  endif
  exec 'set colorcolumn=' . s:cur_colorcolumn
endfunction

nnoremap <silent> <leader>cc :call ToggleColorColumn()<CR>
