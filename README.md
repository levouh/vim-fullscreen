## vim-fullscreen

_Toggle windows between fullscreen modes._

### Note

I have no idea what I am doing, so if you find a problem with this plugin please let me know.

### Support

_I have only tested this plugin with the following:_  
- _Vim_: 8.2.227  
- _OS_: Linux

### Installation

```
Plug 'levouh/vim-fullscreen'
```

### Setup

No mappings are set by default, and only a single `:FullscreenToggle` command is provided. I recommend the following mappings:

```
nnoremap <silent> <C-F> :FullscreenToggle()<CR>
tnoremap <silent> <C-F> <C-W>:FullscreenToggle()<CR>
```

### Configuration

By default, `vim-fullscreen` will "reset" the fullscrene state when the window focus changes. In order to reset this:

```
let g:fullscreen_reset_on_change_focus = 0
```

### Mentions

This plugin was stolen from somewhere and modified by me in the past, and then mostly reset back to it's original form. I don't remember where it was taken from, but I will update this section when I do.
