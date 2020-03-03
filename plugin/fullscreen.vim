" --- Verification

    if exists('g:_loaded_fullscreen') || v:version < 802
        finish
    endif

    let g:_loaded_fullscreen = 1

" --- Options

    let g:fullscreen_reset_on_change_focus = get(g:, 'g:fullscreen_reset_on_change_focus', 1)

" --- Commands

    command FullscreenToggle call fullscreen#toggle()
