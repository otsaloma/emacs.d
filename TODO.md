# TODO

## Emacs 31

- Use treesit modes where applicable
- Auto-install treesit grammar
- Drop packages like dockerfile-mode that we have just for syntax highlighting
- See https://www.rahuljuliato.com/posts/emacs-31-around-the-corner

## JavaScript

- Migrate js-mode from Tide to eglot + typescript-language-server,
  matching what .ts/.tsx files already use, then drop the tide package

## Autocomplete

- Migrate from company-mode to corfu + cape (the modern capf-based stack,
  consistent with our existing vertico + consult + orderless setup)
- company-backends groups become cape-capf-super merged capfs;
  company-capf -> native capf, company-keywords -> cape-keyword,
  company-dabbrev(-code) -> cape-dabbrev
- New extras to consider: corfu-popupinfo, corfu-history, cape-file
- Blocked on the JavaScript migration above: js-mode/Tide is the one path
  with no capf, so finish that first to avoid a regression
