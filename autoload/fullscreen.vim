" --- Public Functions

    " Toggle a window between fullscreen and not.
    function! fullscreen#toggle()
        if exists('t:_fullscreen_info') && t:_fullscreen_info.after == winrestcmd()
            call s:fullscreen_restore()
        elseif winnr('$') > 1
            call s:fullscreen_init()
        endif
    endfunction

" --- Private Functions

    " Toggle the currently selected window being fullscreen.
    function! s:fullscreen_init()
        " Save the variable only for this tab, allowing fullscreening
        " of pages across different tabs.
        let t:_fullscreen_info = { 'before': winrestcmd() }

        " Make the window fullscreen.
        vert resize | resize

        " Store information about the layout after we've resized as well.
        let t:_fullscreen_info.after = winrestcmd()

        " Make sure the cursor is in a valid position.
        normal! ze
    endfunction

    " Restore a window layout to what it was before fullscreening happened.
    function! s:fullscreen_restore()
        if exists('t:_fullscreen_info')
            " Restore the 'before' window layout.
            silent! exe t:_fullscreen_info.before

            " Something got messed up, just make all splits equal again.
            if t:_fullscreen_info.before != winrestcmd()
                wincmd =
            endif

            " Teardown for next time.
            unlet t:_fullscreen_info

            " Make sure the cursor is in a valid position.
            normal! ze
        end
    endfunction

" --- Autocommands

    augroup fullscreen
        au!

        " Exit fullscreen if we ever change windows.
        au WinLeave * if g:fullscreen_reset_on_change_focus | call s:fullscreen_restore() | endif
    augroup END
