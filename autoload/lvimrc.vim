
function! lvimrc#source()
   let dir = getcwd()
   let lvimrcs = []
   while 1
      let lvimrc = findfile('.lvimrc', dir . ';')
      if lvimrc == ''
         break
      endif

      call add(lvimrcs, lvimrc)
      let dir = fnamemodify(lvimrc, ':p:h:h')
   endwhile

   call reverse(lvimrcs)
   for lvimrc in lvimrcs
      exe 'source ' . lvimrc
   endfor
endfunction
