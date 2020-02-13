
let s:listchars_space = 1

function ListcharSpaceToggle()
    if s:listchars_space == 1
        set listchars=tab:>·,trail:~,extends:>,precedes:<
        let s:listchars_space = 0
    else
        set listchars=tab:>·,trail:~,extends:>,precedes:<,space:·
        let s:listchars_space = 1
    endif
endfunction
