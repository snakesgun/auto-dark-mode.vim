" Auto Dark Mode
"
" Switch automatically between light and dark modes on macOS Mojave and
" onwards.
"
" Maintainer:	Liang-Ting Chen <liang.ting.chen.tw@gmail.com>
" Last Change:  2019-12-07
" Version: 1.0.1
" Repository: https://github.com/L-TChen/auto-dark-mode
" License: MIT

if exists('g:AutoDarkLoaded') || &cp
  finish
end
let g:AutoDarkLoaded = 1

if !exists('##OSAppearanceChanged') && has("gui_running")
  echomsg "AutoDark requires MacVim Snapshot 160 or later."
  finish
end

func! s:ChangeBackground()
  if (v:os_appearance)
    set background=dark
    if exists('g:auto_dark_theme')
      execute 'colorscheme ' . g:auto_dark_theme
    end
    if exists('g:auto_dark_airline_theme')
      let g:airline_theme = g:auto_dark_airline_theme
    end
  else
    set background=light
    if exists('g:auto_light_theme')
      execute 'colorscheme ' . g:auto_light_theme
    end
    if exists('g:auto_light_airline_theme')
      let g:airline_theme = g:auto_light_airline_theme
    end
  endif
  redraw!
endfunc

augroup AutoDark
  autocmd OSAppearanceChanged * call s:ChangeBackground()
augroup END
