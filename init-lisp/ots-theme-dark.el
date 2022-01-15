;;; -*- coding: utf-8 -*-
;;; ots-theme-dark.el

(deftheme ots-dark)

(custom-theme-set-faces
 'ots-dark

 ;; Base Emacs
 `(comint-highlight-prompt ((t (:foreground "#cc6666"))))
 `(compilation-column-number ((t (:foreground "#b294bb"))))
 `(compilation-error ((t (:foreground "#e68a8a"))))
 `(compilation-info ((t (:foreground "#84a3c2"))))
 `(compilation-line-number ((t (:foreground "#b294bb"))))
 `(compilation-warning ((t (:foreground "#d2a86e"))))
 `(cursor ((t (:background "#aaaaaa"))))
 `(default ((t (:background "#232323" :foreground "#aaaaaa"))))
 `(fringe ((t (:foreground "#aaaaaa"))))
 `(header-line ((t (:background "#232323"))))
 `(highlight ((t (:underline t))))
 `(isearch ((t (:background "#ffcc00" :foreground "#232323"))))
 `(lazy-highlight ((t (:background "#cccccc" :foreground "#232323"))))
 `(line-number ((t (:foreground "#555555"))))
 `(line-number-current-line ((t (:foreground "#555555"))))
 `(link ((t (:foreground "#8abeb7"))))
 `(minibuffer-prompt ((t (:foreground "#ffff00"))))
 `(mode-line ((t (:background "#353535" :foreground "#888888" :box (:line-width 6 :color "#353535")))))
 `(mode-line-inactive ((t (:background "#353535" :foreground "#666666" :box (:line-width 6 :color "#353535")))))
 `(query-replace ((t (:background "#ffcc00" :foreground "#232323"))))
 `(region ((t (:background "#527bcc" :foreground "#ffffff"))))
 `(show-paren-match ((t (:background "#395946" :foreground nil))))
 `(show-paren-mismatch ((t (:background "#591e1e" :foreground nil))))
 `(vertical-border ((t (:foreground "#232323"))))
 `(whitespace-space ((t (:background nil :foreground "#e68a8a"))))
 `(whitespace-tab ((t (:background nil :foreground "#e68a8a"))))

 ;; Font-lock
 `(font-lock-builtin-face ((t (:foreground "#d2a86e"))))
 `(font-lock-comment-delimiter-face ((t (:foreground "#84a3c2"))))
 `(font-lock-comment-face ((t (:foreground "#84a3c2"))))
 `(font-lock-constant-face ((t (:foreground "#e68a8a"))))
 `(font-lock-doc-string-face ((t (:foreground "#84a3c2"))))
 `(font-lock-function-name-face ((t (:foreground "#d1d175"))))
 `(font-lock-keyword-face ((t (:foreground "#8abeb7"))))
 `(font-lock-negation-char-face ((t (:foreground "#d1d175" :weight bold))))
 `(font-lock-preprocessor-face ((t (:foreground "#8abeb7"))))
 `(font-lock-regexp-grouping-backslash ((t (:foreground "#e68a8a"))))
 `(font-lock-regexp-grouping-construct ((t (:foreground "#e68a8a"))))
 `(font-lock-string-face ((t (:foreground "#b294bb"))))
 `(font-lock-type-face ((t (:foreground "#e68a8a"))))
 `(font-lock-variable-name-face ((t (:foreground "#90b078"))))
 `(font-lock-warning-face ((t (:foreground "#e68a8a"))))

 ;; Add-on packages
 `(centaur-tabs-default ((t (:background "#353535" :foreground "#888888"))))
 `(centaur-tabs-selected ((t (:background "#232323" :foreground "#aaaaaa"))))
 `(centaur-tabs-selected-modified ((t (:inherit 'centaur-tabs-selected))))
 `(centaur-tabs-unselected ((t (:inherit 'centaur-tabs-default))))
 `(centaur-tabs-unselected-modified ((t (:inherit 'centaur-tabs-unselected :foreground "#e68a8a"))))
 `(company-preview ((t (:foreground "#ff5555"))))
 `(company-preview-common ((t (:foreground "#ff5555"))))
 `(company-scrollbar-bg ((t (:background nil))))
 `(company-scrollbar-fg ((t (:background nil))))
 `(company-tooltip ((t (:background "#eeeeee" :foreground "#232323"))))
 `(company-tooltip-annotation ((t (:foreground "#527bcc"))))
 `(company-tooltip-annotation-selection ((t (:foreground "#ffff00"))))
 `(company-tooltip-common ((t (:foreground "#527bcc"))))
 `(company-tooltip-common-selection ((t (:foreground "#ffff00"))))
 `(company-tooltip-selection ((t (:background "#527bcc" :foreground "#ffffff"))))
 `(cua-rectangle ((t (:background "#527bcc" :foreground "#ffffff"))))
 `(cua-rectangle-noselect ((t (:background "#527bcc" :foreground "#ffffff"))))
 `(diff-added ((t (:background nil :foreground "#90b078"))))
 `(diff-file-header ((t (:background nil :foreground "#84a3c2"))))
 `(diff-header ((t (:background nil :foreground "#d1d175"))))
 `(diff-removed ((t (:background nil :foreground "#e68a8a"))))
 `(ess-%op%-face ((t (:background nil :foreground "#8abeb7"))))
 `(ess-operator-face ((t (:background nil :foreground "#8abeb7"))))
 `(flycheck-error ((t (:underline "#ff5555"))))
 `(flycheck-info ((t (:underline "#ff5555"))))
 `(flycheck-warning ((t (:underline "#ff5555"))))
 `(font-latex-bold-face ((t (:background nil :foreground nil))))
 `(font-latex-italic-face ((t (:background nil :foreground nil))))
 `(font-latex-math-face ((t (:background nil :foreground nil))))
 `(font-latex-sedate-face ((t (:background nil :foreground "#d1d175"))))
 `(font-latex-string-face ((t (:background nil :foreground nil))))
 `(font-latex-verbatim-face ((t (:background nil :foreground nil))))
 `(font-latex-warning-face ((t (:background nil :foreground "#e68a8a"))))
 `(git-gutter+-added ((t (:background "#88ff88" :foreground "#88ff88"))))
 `(git-gutter+-deleted ((t (:background "#ff8888" :foreground "#ff8888"))))
 `(git-gutter+-modified ((t (:background "#8888ff" :foreground "#8888ff"))))
 `(helm-candidate-number ((t (:inherit 'mode-line))))
 `(helm-match ((t (:foreground "#e68a8a"))))
 `(helm-selection ((t (:background "#527bcc" :foreground "#ffffff"))))
 `(helm-source-header ((t (:foreground "#d1d175"))))
 `(js2-function-param ((t (:foreground "#e68a8a"))))
 `(lsp-face-highlight-read ((t (:underline nil))))
 `(lsp-face-highlight-textual ((t (:underline nil))))
 `(lsp-face-highlight-write ((t (:underline nil))))
 `(markdown-code-face ((t (:background nil :foreground nil))))
 `(markdown-header-face ((t (:foreground "#d1d175" :weight bold))))
 `(mmm-default-submode-face ((t (:background nil :foreground nil))))
 `(neo-dir-link-face ((t (:background nil :foreground "#84a3c2"))))
 `(neo-file-link-face ((t (:background nil :foreground "#666666"))))
 `(neo-root-dir-face ((t (:background nil :foreground "#666666"))))
 `(popup-tip-face ((t (:background "#eeeeee" :foreground "#232323"))))
 `(sh-heredoc ((t (:foreground "#b294bb"))))
 `(tab-line ((t :background "#353535")))
 `(tabbar-default ((t (:background "#353535" :foreground "#888888" :box (:line-width 12 :color "#353535")))))
 `(tabbar-selected ((t (:background "#232323" :foreground "#aaaaaa" :box (:line-width 12 :color "#232323")))))
 `(tabbar-unselected ((t (:inherit 'tabbar-default))))
 `(tabbar-highlight ((t (:inherit 'tabbar-selected))))
 `(tabbar-modified ((t (:inherit 'tabbar-unselected foreground "#e68a8a"))))
 `(tabbar-selected-modified ((t (:inherit 'tabbar-selected))))
 `(tabbar-separator ((t (:background "#353535"))))
 `(vterm-color-black ((t (:foreground "#232323"))))
 `(vterm-color-blue ((t (:foreground "#729fcf"))))
 `(vterm-color-cyan ((t (:foreground "#34e2e2"))))
 `(vterm-color-green ((t (:foreground "#8ae234"))))
 `(vterm-color-magenta ((t (:foreground "#ad7fa8"))))
 `(vterm-color-red ((t (:foreground "#ef2929"))))
 `(vterm-color-white ((t (:foreground "#eeeeec"))))
 `(vterm-color-yellow ((t (:foreground "#fce94f"))))
 `(wcheck-default-face ((t (:underline "#ff5555"))))
 `(woman-bold ((t (:foreground "#84a3c2"))))
 `(woman-italic ((t (:foreground "#b294bb"))))

 )

(provide-theme 'ots-dark)
(provide 'ots-theme-dark)
;;; ots-theme-dark.el ends here
