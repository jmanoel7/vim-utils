function! HTMLEncode()
perl << EOF
 use utf8;
 use Encode;
 use HTML::Entities;
 binmode STDOUT, 'utf8';
 @pos = $curwin->Cursor();
 $line = $curbuf->Get($pos[0]);
 $encvalue = encode_entities(decode('UTF-8', $line));
 $curbuf->Set($pos[0],$encvalue)
EOF
endfunction

function! HTMLDecode()
perl << EOF
 use utf8;
 use Encode;
 use HTML::Entities;
 binmode STDOUT, 'utf8';
 @pos = $curwin->Cursor();
 $line = $curbuf->Get($pos[0]);
 $encvalue = decode_entities(decode('UTF-8', $line));
 $curbuf->Set($pos[0],$encvalue)
EOF
endfunction

nnoremap <Leader>h :call HTMLEncode()<CR>
nnoremap <Leader>H :call HTMLDecode()<CR>
