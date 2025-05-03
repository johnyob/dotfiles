syntax enable                             " Syntax highlighting
colorscheme srcery                        " Color scheme text

let g:lightline = {
  \ 'colorscheme': 'wombat',
  \ }                                     " Color scheme lightline

highlight Comment cterm=italic gui=italic " Comments become italic
hi Normal guibg=NONE ctermbg=NONE         " Remove background, better for personal theme

set number                                " Set numbers

nmap <F6> :NERDTreeToggle<CR>             " F6 opens NERDTree