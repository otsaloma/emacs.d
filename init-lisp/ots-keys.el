;;; -*- coding: utf-8 -*-
;;; ots-keys.el

(defun ots-keys-set-basic ()
  "Set basic global keybindings."
  (global-set-key (kbd "C-0") 'delete-window)
  (global-set-key (kbd "C-1") 'delete-other-windows)
  (global-set-key (kbd "C-2") 'split-window-vertically)
  (global-set-key (kbd "C-3") 'split-window-horizontally)
  (global-set-key (kbd "C-a") 'mark-whole-buffer)
  (global-set-key (kbd "C-b") 'ots-util-smart-home)
  (global-set-key (kbd "C-e") 'end-of-line)
  (global-set-key (kbd "C-f") 'isearch-forward-regexp)
  (global-set-key (kbd "C-S-f") 'isearch-backward-regexp)
  (global-set-key (kbd "C-g") 'isearch-repeat-forward)
  (global-set-key (kbd "C-S-g") 'isearch-repeat-backward)
  (global-set-key (kbd "C-h") 'query-replace-regexp)
  (global-set-key (kbd "C-S-h") 'ots-pcre-query-replace-in-open-buffers)
  (global-set-key (kbd "C-j") 'join-line)
  (global-set-key (kbd "C-S-j") 'join-line)
  (global-set-key (kbd "C-k") 'comment-or-uncomment-region)
  (global-set-key (kbd "C-l") 'goto-line)
  (global-set-key (kbd "C-m") 'ots-util-pop-mark)
  (global-set-key (kbd "C-S-m") 'helm-mark-ring)
  (global-set-key (kbd "M-m") 'menu-bar-mode)
  (global-set-key (kbd "C-n") 'universal-argument)
  (global-set-key (kbd "C-p") 'mark-paragraph)
  (global-set-key (kbd "C-S-p") 'mark-defun)
  (global-set-key (kbd "C-q") 'save-buffers-kill-emacs)
  (global-set-key (kbd "C-S-q") 'kill-emacs)
  (global-set-key (kbd "C-r") 'sort-lines)
  (global-set-key (kbd "C-S-r") 'sort-paragraphs)
  (global-set-key (kbd "C-s") 'ots-util-save-buffer)
  (global-set-key (kbd "C-S-s") 'write-file)
  (global-set-key (kbd "C-t") 'ots-util-helm-git-grep)
  (global-set-key (kbd "C-S-t") 'projectile-replace-regexp)
  (global-set-key (kbd "C-u") 'upcase-region)
  (global-set-key (kbd "C-S-u") 'downcase-region)
  (global-set-key (kbd "C-S-v") 'yank-pop)
  (global-set-key (kbd "C-w") 'ots-util-kill-buffer)
  (global-set-key (kbd "C-S-w") 'browse-url-at-point)
  (global-set-key (kbd "C-å") 'find-file)
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-y") 'ots-util-smart-fill)
  (global-set-key (kbd "C-z") 'undo-only)
  (global-set-key (kbd "C-S-z") 'undo-redo)
  (global-set-key (kbd "§") 'ots-util-match-paren)
  (global-set-key (kbd "C-§") 'helm-buffers-list)
  (global-set-key (kbd "M-§") 'ots-util-switch-to-other-buffer)
  (global-set-key (kbd "C--") 'hs-toggle-hiding)
  (global-set-key (kbd "C-SPC") 'ots-util-push-mark)
  (global-set-key (kbd "<tab>") 'ots-util-smart-tab)
  (global-set-key (kbd "<C-tab>") 'ots-util-next-window)
  (global-set-key (kbd "<S-tab>") 'ots-util-previous-window)
  (global-set-key (kbd "<S-iso-lefttab>") 'ots-util-previous-window)
  (global-set-key (kbd "<C-S-tab>") 'ots-util-insert-tab)
  (global-set-key (kbd "<C-iso-lefttab>") 'ots-util-insert-tab)
  (global-set-key (kbd "<delete>") 'delete-char)
  (global-set-key (kbd "<home>") 'ots-util-smart-home)
  (global-set-key (kbd "<C-up>") 'ots-util-backward-block)
  (global-set-key (kbd "<C-down>") 'ots-util-forward-block)
  (global-set-key (kbd "<f1>") 'help)
  (global-set-key (kbd "<S-f1>") 'woman)
  (global-set-key (kbd "<f3>") 'vterm)
  (global-set-key (kbd "<S-f3>") 'ots-util-start-external-terminal))

(defun ots-keys-set-isearch ()
  "Set keybindings for using interactive search."
  (define-key isearch-mode-map (kbd "C-w") 'isearch-yank-word)
  (define-key isearch-mode-map (kbd "C-v") 'isearch-yank-kill)
  (define-key isearch-mode-map (kbd "<return>") 'isearch-exit)
  (define-key isearch-mode-map (kbd "<kp-enter>") 'isearch-exit))

(defun ots-keys-set-normal ()
  "Set keybindings for editing normal text files."
  (when (derived-mode-p 'conf-mode 'prog-mode 'text-mode)
    (local-set-key (kbd "C-d") 'ots-util-smart-kill-line)
    (local-set-key (kbd "C-S-d") 'ots-util-smart-kill-word)
    (local-set-key (kbd "<return>") 'newline-and-indent)
    (local-set-key (kbd "<kp-enter>") 'newline-and-indent)))

(defun ots-keys-set-punct ()
  "Set keybindings for punctuation navigation keys."
  (if (derived-mode-p 'prog-mode)
      (ots-keys-set-punct-defun)
    (ots-keys-set-punct-sentence)))

(defun ots-keys-set-punct-defun ()
  "Set keybindings for navigating between functions."
  (local-set-key (kbd "C-,") 'ots-util-beginning-of-defun)
  (local-set-key (kbd "C-;") 'ots-util-mark-to-beginning-of-defun)
  (local-set-key (kbd "C-.") 'ots-util-end-of-defun)
  (local-set-key (kbd "C-:") 'ots-util-mark-to-end-of-defun))

(defun ots-keys-set-punct-sentence ()
  "Set keybindings for navigating between sentences."
  (local-set-key (kbd "C-,") 'backward-sentence)
  (local-set-key (kbd "C-;") 'ots-util-mark-to-beginning-of-sentence)
  (local-set-key (kbd "C-.") 'forward-sentence)
  (local-set-key (kbd "C-:") 'ots-util-mark-to-end-of-sentence))

(cua-mode t)
;; Remove cua override of set-mark-command key.
(define-key cua-global-keymap [remap set-mark-command] nil)
(setq cua-check-pending-input nil)
(setq cua-keep-region-after-copy t)
(setq cua-prefix-override-inhibit-delay 0.1)
(ots-keys-set-basic)
(ots-keys-set-isearch)
(add-hook 'change-major-mode-after-body-hook 'ots-keys-set-punct)
(add-hook 'change-major-mode-after-body-hook 'ots-keys-set-normal)

(provide 'ots-keys)
;;; ots-keys.el ends here
