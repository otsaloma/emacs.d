;;; -*- coding: utf-8 -*-
;;; ots-theme-light.el

(require 'ots-util)
(deftheme ots-light)

(custom-theme-set-faces
 'ots-light

 ;; Base Emacs
 `(comint-highlight-prompt ((t (:foreground "#ff0000"))))
 `(compilation-column-number ((t (:foreground "#ba7fba"))))
 `(compilation-error ((t (:foreground "#ff405a"))))
 `(compilation-info ((t (:foreground "#1d77ff"))))
 `(compilation-line-number ((t (:foreground "#9f6fff"))))
 `(compilation-warning ((t (:foreground "#c4a000"))))
 `(cursor ((t (:background "#1d77ff"))))
 `(default ((t (:background "#ffffff" :foreground "#2e3436"))))
 `(fringe ((t (:foreground "#1d77ff"))))
 `(header-line ((t (:background "#cccccc"))))
 `(hl-line ((t (:background "#fcfcfc"))))
 `(isearch ((t (:background "#ffcc00"))))
 `(lazy-highlight ((t (:background "#cccccc"))))
 `(minibuffer-prompt ((t (:foreground "#1d77ff"))))
 `(mode-line ((t (:background "#cccccc" :foreground "#3465a4" :overline "#ffffff"))))
 `(mode-line-inactive ((t (:background "#cccccc" :foreground "#cccccc"))))
 `(query-replace ((t (:background "#ffcc00"))))
 `(region ((t (:background "#f5f5aa"))))
 `(show-paren-match ((t (:background "#99eebb"))))
 `(show-paren-mismatch ((t (:background "#ff5555"))))
 `(vertical-border ((t (:foreground "#cccccc"))))

 ;; Font-lock
 `(font-lock-builtin-face ((t (:foreground "#ff6f87"))))
 `(font-lock-comment-delimiter-face ((t (:foreground "#84a3c2"))))
 `(font-lock-comment-face ((t (:foreground "#84a3c2"))))
 `(font-lock-constant-face ((t (:foreground "#00ba88"))))
 `(font-lock-doc-string-face ((t (:foreground "#84a3c2"))))
 `(font-lock-function-name-face ((t (:foreground "#1d77ff"))))
 `(font-lock-keyword-face ((t (:foreground "#897fba"))))
 `(font-lock-preprocessor-face ((t (:foreground "#90b078"))))
 `(font-lock-regexp-grouping-backslash ((t (:foreground "#897fba"))))
 `(font-lock-regexp-grouping-construct ((t (:foreground "#897fba"))))
 `(font-lock-string-face ((t (:foreground "#ba7fba"))))
 `(font-lock-type-face ((t (:foreground "#00bb29"))))
 `(font-lock-variable-name-face ((t (:foreground "#b0a678"))))
 `(font-lock-warning-face ((t (:foreground "#ff405a"))))

 ;; XXX: Abuse negation-char for titles (e.g. HTML, LaTeX)
 ;; as creating a new face seems to fail (Emacs 24.4.1).
 `(font-lock-negation-char-face
   ((t (:foreground "#000000" :height 150 :weight normal))))

 ;; Add-on packages
 `(ac-candidate-face ((t (:background "#dddddd" :foreground "#2e3436"))))
 `(ac-completion-face ((t (:background "#88ffff" :foreground "#2e3436"))))
 `(ac-selection-face ((t (:background "#6699ff" :foreground "#ffffff"))))
 `(cua-rectangle ((t (:background "#f0f0aa"))))
 `(cua-rectangle-noselect ((t (:background "#cccccc"))))
 `(diff-added ((t (:background "#cbffcb"))))
 `(diff-file-header ((t (:background "#ffd9b3"))))
 `(diff-header ((t (:background "#ffffb3"))))
 `(diff-removed ((t (:background "#ffcbcb"))))
 `(font-latex-bold-face ((t (:background nil :foreground nil))))
 `(font-latex-italic-face ((t (:background nil :foreground nil))))
 `(font-latex-math-face ((t (:background "#eeeeee" :foreground nil))))
 `(font-latex-sedate-face ((t (:background nil :foreground "#9f6fff"))))
 `(font-latex-string-face ((t (:background nil :foreground nil))))
 `(font-latex-verbatim-face ((t (:background "#eeeeee" :foreground nil))))
 `(font-latex-warning-face ((t (:background nil :foreground "#ff405a"))))
 `(git-gutter+-added ((t (:background "#88ff88" :foreground "#88ff88"))))
 `(git-gutter+-deleted ((t (:background "#ff8888" :foreground "#ff8888"))))
 `(git-gutter+-modified ((t (:background "#ffff88" :foreground "#ffff88"))))
 `(helm-candidate-number ((t (:inherit mode-line))))
 `(helm-match ((t (:foreground "#ff405a"))))
 `(helm-selection ((t (:background "#f5f5aa"))))
 `(helm-source-header ((t (:foreground "#1d77ff"))))
 `(markdown-inline-code-face ((t (:background "#eeeeee" :foreground nil))))
 `(markdown-pre-face ((t (:background nil :foreground "#ba7fba"))))
 `(linum ((t (:background "#cccccc" :foreground "#777777" :height 95))))
 `(popup-tip-face ((t (:background "#f0f080" :foreground "#2e3436"))))
 `(tabbar-default ((t (:background "#cccccc" :foreground "#2e3436" :box nil))))
 `(tabbar-modified ((t (:background "#cccccc" :foreground "#ff405a" :box nil))))
 `(tabbar-selected ((t (:background "#ffffff" :foreground "#2e3436" :box nil))))
 `(tabbar-separator ((t (:background "#ffffff"))))
 `(tabbar-unselected ((t (:background "#cccccc" :foreground "#2e3436" :box nil))))
 `(wcheck-default-face ((t (:underline "#ff5555"))))
 `(woman-bold ((t (:foreground "#1d77ff"))))
 `(woman-italic ((t (:foreground "#9f6fff"))))

 )

;; Disable bold and italic for font support is poor.
(set-face-attribute 'bold nil :weight 'normal)
(set-face-attribute 'italic nil :slant 'normal)
(set-face-attribute 'bold-italic nil :weight 'normal)
(set-face-attribute 'bold-italic nil :slant 'normal)

;; For font used on Unix, see ~/.Xresources.
(when (eq system-type 'windows-nt)
  (set-frame-font "Consolas-10.2"))

(provide-theme 'ots-light)
(provide 'ots-theme-light)
;;; ots-theme-light.el ends here
