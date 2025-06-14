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
 `(cursor ((t (:background "#bbbbbb"))))
 `(default ((t (:background "#313131" :foreground "#bbbbbb"))))
 `(fringe ((t (:foreground "#bbbbbb"))))
 `(header-line ((t (:background "#313131" :box (:line-width 12 :color "#313131")))))
 `(highlight ((t (:underline t))))
 `(isearch ((t (:background "#ffcc00" :foreground "#313131"))))
 `(lazy-highlight ((t (:background "#454545" :foreground unspecified))))
 `(line-number ((t (:foreground "#555555"))))
 `(line-number-current-line ((t (:foreground "#555555"))))
 `(link ((t (:foreground "#8abeb7"))))
 `(minibuffer-prompt ((t (:foreground "#ffff00"))))
 `(mode-line ((t (:background "#313131" :foreground "#888888" :box (:line-width 6 :color "#313131")))))
 `(mode-line-inactive ((t (:background "#313131" :foreground "#666666" :box (:line-width 6 :color "#313131")))))
 `(query-replace ((t (:background "#ffcc00" :foreground "#313131"))))
 `(region ((t (:background "#375288" :foreground unspecified))))
 `(show-paren-match ((t (:background "#395946" :foreground unspecified))))
 `(show-paren-mismatch ((t (:background "#591e1e" :foreground unspecified))))
 `(vertical-border ((t (:foreground "#313131"))))
 `(whitespace-space ((t (:background unspecified :foreground "#e68a8a"))))
 `(whitespace-tab ((t (:background unspecified :foreground "#e68a8a"))))

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
 `(font-lock-property-use-face ((t (:foreground unspecified))))
 `(font-lock-regexp-grouping-backslash ((t (:foreground "#e68a8a"))))
 `(font-lock-regexp-grouping-construct ((t (:foreground "#e68a8a"))))
 `(font-lock-string-face ((t (:foreground "#b294bb"))))
 `(font-lock-type-face ((t (:foreground "#e68a8a"))))
 `(font-lock-variable-name-face ((t (:foreground "#90b078"))))
 `(font-lock-warning-face ((t (:foreground "#e68a8a"))))

 ;; Add-on packages
 `(company-preview ((t (:foreground "#ff5555"))))
 `(company-preview-common ((t (:foreground "#ff5555"))))
 `(company-scrollbar-bg ((t (:background unspecified))))
 `(company-scrollbar-fg ((t (:background unspecified))))
 `(company-tooltip ((t (:background "#eeeeee" :foreground "#313131"))))
 `(company-tooltip-annotation ((t (:foreground "#527bcc"))))
 `(company-tooltip-annotation-selection ((t (:foreground "#ffff00"))))
 `(company-tooltip-common ((t (:foreground "#527bcc"))))
 `(company-tooltip-common-selection ((t (:foreground "#ffff00"))))
 `(company-tooltip-selection ((t (:background "#527bcc" :foreground "#ffffff"))))
 `(copilot-overlay-face ((t (:foreground "#d1d175"))))
 `(cua-rectangle ((t (:background "#527bcc" :foreground "#ffffff"))))
 `(cua-rectangle-noselect ((t (:background "#527bcc" :foreground "#ffffff"))))
 `(diff-added ((t (:background unspecified :foreground "#90b078"))))
 `(diff-file-header ((t (:background unspecified :foreground "#84a3c2"))))
 `(diff-header ((t (:background unspecified :foreground "#d1d175"))))
 `(diff-refine-added ((t (:background unspecified :foreground "#90b078"))))
 `(diff-refine-removed ((t (:background unspecified :foreground "#e68a8a"))))
 `(diff-removed ((t (:background unspecified :foreground "#e68a8a"))))
 `(eglot-highlight-symbol-face ((t (:weight normal))))
 `(ess-%op%-face ((t (:inherit 'font-lock-keyword-face))))
 `(ess-modifiers-face ((t (:inherit 'font-lock-builtin-face))))
 `(ess-operator-face ((t (:inherit 'font-lock-keyword-face))))
 `(fill-column-indicator ((t (:foreground "#555555"))))
 `(flycheck-error ((t (:underline "#ff5555"))))
 `(flycheck-info ((t (:underline "#ff5555"))))
 `(flycheck-warning ((t (:underline "#ff5555"))))
 `(font-latex-bold-face ((t (:background unspecified :foreground unspecified))))
 `(font-latex-italic-face ((t (:background unspecified :foreground unspecified))))
 `(font-latex-math-face ((t (:background unspecified :foreground unspecified))))
 `(font-latex-sedate-face ((t (:background unspecified :foreground "#d1d175"))))
 `(font-latex-string-face ((t (:background unspecified :foreground unspecified))))
 `(font-latex-verbatim-face ((t (:background unspecified :foreground unspecified))))
 `(font-latex-warning-face ((t (:background unspecified :foreground "#e68a8a"))))
 `(git-gutter:added ((t (:background "#88ff88" :foreground "#313131"))))
 `(git-gutter:deleted ((t (:background "#ff8888" :foreground "#313131"))))
 `(git-gutter:modified ((t (:background "#8888ff" :foreground "#313131"))))
 `(helm-candidate-number ((t (:inherit 'mode-line))))
 `(helm-match ((t (:foreground "#e68a8a"))))
 `(helm-selection ((t (:background "#527bcc" :foreground "#ffffff"))))
 `(helm-source-header ((t (:foreground "#d1d175"))))
 `(markdown-code-face ((t (:background "#3b3b3b" :foreground unspecified))))
 `(markdown-header-face ((t (:foreground "#d1d175" :weight bold))))
 `(mmm-default-submode-face ((t (:background unspecified :foreground unspecified))))
 `(neo-dir-link-face ((t (:background unspecified :foreground "#84a3c2"))))
 `(neo-file-link-face ((t (:background unspecified :foreground "#666666"))))
 `(neo-root-dir-face ((t (:background unspecified :foreground "#666666"))))
 `(popup-tip-face ((t (:background "#eeeeee" :foreground "#313131"))))
 `(sh-heredoc ((t (:foreground "#b294bb"))))
 `(sh-quoted-exec ((t (:foreground "#e68a8a"))))
 `(tab-line ((t :background "#313131")))
 `(tabbar-default ((t (:background "#313131" :foreground "#888888"))))
 `(tabbar-selected ((t (:background "#313131" :foreground "#eeeeee"))))
 `(tabbar-unselected ((t (:inherit 'tabbar-default))))
 `(tabbar-highlight ((t (:inherit 'tabbar-selected))))
 `(tabbar-modified ((t (:inherit 'tabbar-unselected foreground "#e68a8a"))))
 `(tabbar-selected-modified ((t (:inherit 'tabbar-selected))))
 `(tabbar-separator ((t (:background "#313131"))))
 `(vterm-color-black ((t (:foreground "#313131"))))
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
