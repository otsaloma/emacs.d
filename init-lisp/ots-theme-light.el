;;; -*- coding: utf-8 -*-
;;; ots-theme-light.el

(deftheme ots-light)

(custom-theme-set-faces
 'ots-light

 ;; Base Emacs
 `(comint-highlight-prompt ((t (:foreground "#cc6666"))))
 `(compilation-column-number ((t (:foreground "#ba7fba"))))
 `(compilation-error ((t (:foreground "#ff405a"))))
 `(compilation-info ((t (:foreground "#1d77ff"))))
 `(compilation-line-number ((t (:foreground "#9f6fff"))))
 `(compilation-warning ((t (:foreground "#c4a000"))))
 `(cursor ((t (:background "#1d77ff"))))
 `(default ((t (:background "#ffffff" :foreground "#2e3436"))))
 `(fringe ((t (:foreground "#1d77ff"))))
 `(header-line ((t (:background "#f2f2f2"))))
 `(highlight ((t (:underline t))))
 `(isearch ((t (:background "#ffcc00" :foreground nil))))
 `(lazy-highlight ((t (:background "#cccccc" :foreground nil))))
 `(link ((t (:foreground "#897fba"))))
 `(minibuffer-prompt ((t (:foreground "#1d77ff"))))
 `(mode-line ((t (:background "#f2f2f2" :foreground "#999999" :box (:line-width 6 :color "#f2f2f2") :overline "#dddddd"))))
 `(mode-line-inactive ((t (:background "#f2f2f2" :foreground "#cccccc" :box (:line-width 6 :color "#f2f2f2") :overline "#dddddd"))))
 `(query-replace ((t (:background "#ffcc00" :foreground nil))))
 `(region ((t (:background "#f5f5aa" :foreground nil))))
 `(show-paren-match ((t (:background "#99eebb" :underline nil))))
 `(show-paren-mismatch ((t (:background "#ff5555" :underline nil))))
 `(vertical-border ((t (:foreground "#ffffff"))))
 `(whitespace-space ((t (:background nil :foreground "#ff405a"))))
 `(whitespace-tab ((t (:background nil :foreground "#ff405a"))))

 ;; Font-lock
 `(font-lock-builtin-face ((t (:foreground "#ff6f87"))))
 `(font-lock-comment-delimiter-face ((t (:foreground "#84a3c2"))))
 `(font-lock-comment-face ((t (:foreground "#84a3c2"))))
 `(font-lock-constant-face ((t (:foreground "#00ba88"))))
 `(font-lock-doc-string-face ((t (:foreground "#84a3c2"))))
 `(font-lock-function-name-face ((t (:foreground "#1d77ff"))))
 `(font-lock-keyword-face ((t (:foreground "#897fba"))))
 `(font-lock-negation-char-face ((t (:foreground "#1d77ff" :weight bold))))
 `(font-lock-preprocessor-face ((t (:foreground "#90b078"))))
 `(font-lock-regexp-grouping-backslash ((t (:foreground "#897fba"))))
 `(font-lock-regexp-grouping-construct ((t (:foreground "#897fba"))))
 `(font-lock-string-face ((t (:foreground "#ba7fba"))))
 `(font-lock-type-face ((t (:foreground "#00bb29"))))
 `(font-lock-variable-name-face ((t (:foreground "#b0a678"))))
 `(font-lock-warning-face ((t (:foreground "#ff405a"))))

 ;; Add-on packages
 `(company-preview ((t (:foreground "#ff5555"))))
 `(company-preview-common ((t (:foreground "#ff5555"))))
 `(company-scrollbar-bg ((t (:background nil))))
 `(company-scrollbar-fg ((t (:background nil))))
 `(company-tooltip ((t (:background "#eeeeec" :foreground "#2e3436"))))
 `(company-tooltip-annotation ((t (:foreground "#527bcc"))))
 `(company-tooltip-annotation-selection ((t (:foreground "#ffff00"))))
 `(company-tooltip-common ((t (:foreground "#527bcc"))))
 `(company-tooltip-common-selection ((t (:foreground "#ffff00"))))
 `(company-tooltip-selection ((t (:background "#527bcc" :foreground "#ffffff"))))
 `(cua-rectangle ((t (:background "#f0f0aa" :foreground nil))))
 `(cua-rectangle-noselect ((t (:background "#cccccc" :foreground nil))))
 `(diff-added ((t (:background "#cbffcb" :foreground nil))))
 `(diff-file-header ((t (:background "#ffd9b3" :foreground nil))))
 `(diff-header ((t (:background "#ffffb3" :foreground nil))))
 `(diff-removed ((t (:background "#ffcbcb" :foreground nil))))
 `(ess-%op%-face ((t (:background nil :foreground "#897fba"))))
 `(ess-operator-face ((t (:background nil :foreground "#897fba"))))
 `(flycheck-error ((t (:underline "#ff5555"))))
 `(flycheck-info ((t (:underline "#ff5555"))))
 `(flycheck-warning ((t (:underline "#ff5555"))))
 `(font-latex-bold-face ((t (:background nil :foreground nil))))
 `(font-latex-italic-face ((t (:background nil :foreground nil))))
 `(font-latex-math-face ((t (:background nil :foreground nil))))
 `(font-latex-sedate-face ((t (:background nil :foreground "#9f6fff"))))
 `(font-latex-string-face ((t (:background nil :foreground nil))))
 `(font-latex-verbatim-face ((t (:background nil :foreground nil))))
 `(font-latex-warning-face ((t (:background nil :foreground "#ff405a"))))
 `(git-gutter+-added ((t (:background "#88ff88" :foreground "#88ff88"))))
 `(git-gutter+-deleted ((t (:background "#ff8888" :foreground "#ff8888"))))
 `(git-gutter+-modified ((t (:background "#8888ff" :foreground "#8888ff"))))
 `(helm-candidate-number ((t (:inherit mode-line))))
 `(helm-match ((t (:foreground "#ff405a"))))
 `(helm-selection ((t (:background "#f5f5aa" :foreground nil))))
 `(helm-source-header ((t (:foreground "#1d77ff"))))
 `(linum ((t (:background "#f2f2f2" :foreground "#999999" :height 0.85))))
 `(lsp-face-highlight-read ((t (:underline nil))))
 `(lsp-face-highlight-textual ((t (:underline nil))))
 `(lsp-face-highlight-write ((t (:underline nil))))
 `(markdown-code-face ((t (:background nil :foreground nil))))
 `(markdown-header-face ((t (:foreground "#1d77ff" :weight bold))))
 `(mmm-default-submode-face ((t (:background nil :foreground nil))))
 `(neo-dir-link-face ((t (:background nil :foreground "#84a3c2"))))
 `(neo-file-link-face ((t (:background nil :foreground "#2e3436"))))
 `(neo-root-dir-face ((t (:background nil :foreground "#2e3436"))))
 `(popup-tip-face ((t (:background "#f0f080" :foreground "#2e3436"))))
 `(sh-heredoc ((t (:foreground "#ba7fba"))))
 `(tabbar-default ((t (:background "#f2f2f2" :foreground "#999999" :box (:line-width 12 :color "#f2f2f2")))))
 `(tabbar-selected ((t (:background "#ffffff" :foreground "#2e3436" :box (:line-width 12 :color "#ffffff") :overline "#dddddd"))))
 `(tabbar-unselected ((t (:inherit 'tabbar-default))))
 `(tabbar-highlight ((t (:inherit 'tabbar-selected :overline nil))))
 `(tabbar-modified ((t (:inherit 'tabbar-unselected :foreground "#ff405a"))))
 `(tabbar-selected-modified ((t (:inherit 'tabbar-selected))))
 `(tabbar-separator ((t (:background nil))))
 `(wcheck-default-face ((t (:underline "#ff5555"))))
 `(woman-bold ((t (:foreground "#1d77ff"))))
 `(woman-italic ((t (:foreground "#9f6fff"))))

 )

(provide-theme 'ots-light)
(provide 'ots-theme-light)
;;; ots-theme-light.el ends here
