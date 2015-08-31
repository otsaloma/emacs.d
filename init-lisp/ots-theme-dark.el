;;; -*- coding: utf-8 -*-
;;; ots-theme.el

(require 'ots-util)
(deftheme ots-dark)

(custom-theme-set-faces
 'ots-dark

 ;; Base Emacs
 `(comint-highlight-prompt ((t (:foreground "#e68a8a"))))
 `(compilation-column-number ((t (:foreground "#b294bb"))))
 `(compilation-error ((t (:foreground "#e68a8a"))))
 `(compilation-info ((t (:foreground "#84a3c2"))))
 `(compilation-line-number ((t (:foreground "#b294bb"))))
 `(compilation-warning ((t (:foreground "#d2a86e"))))
 `(cursor ((t (:background "#babdb6"))))
 `(default ((t (:background "#2e3436" :foreground "#babdb6"))))
 `(fringe ((t (:foreground "#babdb6"))))
 `(header-line ((t (:background "#555753"))))
 `(hl-line ((t (:background "#333839"))))
 `(isearch ((t (:background "#ffcc00" :foreground "#2e3436"))))
 `(lazy-highlight ((t (:background "#babdb6" :foreground "#2e3436"))))
 `(minibuffer-prompt ((t (:foreground "#ffff00"))))
 `(mode-line ((t (:background "#555753" :foreground "#d3d7cf" :overline "#2e3436"))))
 `(mode-line-inactive ((t (:background "#555753" :foreground "#555753"))))
 `(query-replace ((t (:background "#ffcc00" :foreground "#2e3436"))))
 `(region ((t (:background "#527bcc" :foreground "#ffffff"))))
 `(show-paren-match ((t (:underline "#99eebb"))))
 `(show-paren-mismatch ((t (:underline "#ff5555"))))
 `(vertical-border ((t (:foreground "#2e3436"))))

 ;; Font-lock
 `(font-lock-builtin-face ((t (:foreground "#d2a86e"))))
 `(font-lock-comment-delimiter-face ((t (:foreground "#84a3c2"))))
 `(font-lock-comment-face ((t (:foreground "#84a3c2"))))
 `(font-lock-constant-face ((t (:foreground "#e68a8a"))))
 `(font-lock-doc-string-face ((t (:foreground "#84a3c2"))))
 `(font-lock-function-name-face ((t (:foreground "#d1d175"))))
 `(font-lock-keyword-face ((t (:foreground "#8abeb7"))))
 `(font-lock-preprocessor-face ((t (:foreground "#8abeb7"))))
 `(font-lock-regexp-grouping-backslash ((t (:foreground "#e68a8a"))))
 `(font-lock-regexp-grouping-construct ((t (:foreground "#e68a8a"))))
 `(font-lock-string-face ((t (:foreground "#b294bb"))))
 `(font-lock-type-face ((t (:foreground "#e68a8a"))))
 `(font-lock-variable-name-face ((t (:foreground "#90b078"))))
 `(font-lock-warning-face ((t (:foreground "#e68a8a"))))

 ;; XXX: Abuse negation-char for titles (e.g. HTML, LaTeX)
 ;; as creating a new face seems to fail (Emacs 24.4.1).
 `(font-lock-negation-char-face
   ((t (:foreground "#ffffff" :height 150 :weight normal))))

 ;; Add-on packages
 `(ac-candidate-face ((t (:background "#d3d7cf" :foreground "#2e3436"))))
 `(ac-completion-face ((t (:foreground "#88ffff"))))
 `(ac-selection-face ((t (:background "#527bcc" :foreground "#ffffff"))))
 `(cua-rectangle ((t (:background "#527bcc" :foreground "#ffffff"))))
 `(cua-rectangle-noselect ((t (:background "#527bcc" :foreground "#ffffff"))))
 `(diff-added ((t (:foreground "#90b078"))))
 `(diff-file-header ((t (:foreground "#84a3c2"))))
 `(diff-header ((t (:foreground "#d1d175"))))
 `(diff-removed ((t (:foreground "#e68a8a"))))
 `(font-latex-bold-face ((t (:background nil :foreground nil))))
 `(font-latex-italic-face ((t (:background nil :foreground nil))))
 `(font-latex-math-face ((t (:background "#393f3f" :foreground nil))))
 `(font-latex-sedate-face ((t (:background nil :foreground "#d1d175"))))
 `(font-latex-string-face ((t (:background nil :foreground nil))))
 `(font-latex-verbatim-face ((t (:background "#393f3f" :foreground nil))))
 `(font-latex-warning-face ((t (:background nil :foreground "#e68a8a"))))
 `(git-gutter+-added ((t (:background "#88ff88" :foreground "#88ff88"))))
 `(git-gutter+-deleted ((t (:background "#ff8888" :foreground "#ff8888"))))
 `(git-gutter+-modified ((t (:background "#ffff88" :foreground "#ffff88"))))
 `(helm-candidate-number ((t (:inherit mode-line))))
 `(helm-match ((t (:foreground "#e68a8a"))))
 `(helm-selection ((t (:background "#527bcc" :foreground "#ffffff"))))
 `(helm-source-header ((t (:foreground "#d1d175"))))
 `(linum ((t (:background "#393f3f" :foreground "#888a85" :height 95))))
 `(markdown-inline-code-face ((t (:background "#393f3f" :foreground nil))))
 `(markdown-pre-face ((t (:background nil :foreground "#b294bb"))))
 `(popup-tip-face ((t (:background "#d3d7cf" :foreground "#2e3436"))))
 `(tabbar-default ((t (:background "#555753" :foreground "#d3d7cf" :box nil))))
 `(tabbar-modified ((t (:background "#555753" :foreground "#e68a8a" :box nil))))
 `(tabbar-selected ((t (:background "#2e3436" :foreground "#d3d7cf" :box nil))))
 `(tabbar-separator ((t (:background "#555753"))))
 `(tabbar-unselected ((t (:background "#555753" :foreground "#d3d7cf" :box nil))))
 `(woman-bold ((t (:foreground "#84a3c2"))))
 `(woman-italic ((t (:foreground "#b294bb"))))

 )

;; Disable bold and italic for font support is poor.
(set-face-attribute 'bold nil :weight 'normal)
(set-face-attribute 'italic nil :slant 'normal)
(set-face-attribute 'bold-italic nil :weight 'normal)
(set-face-attribute 'bold-italic nil :slant 'normal)

;; For font used on Unix, see ~/.Xresources.
(when (eq system-type 'windows-nt)
  (set-frame-font "Consolas-10.2"))

(provide-theme 'ots-dark)
(provide 'ots-theme-dark)
;;; ots-theme-dark.el ends here
