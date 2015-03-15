;;; -*- coding: utf-8 -*-
;;; ots-fullscreen.el

(defvar ots-fullscreen-p nil
  "t if in fullscreen mode, nil otherwise.")

(defun ots-fullscreen-enter ()
  (interactive)
  (if (fboundp 'w32-send-sys-command)
      ;; WM_SYSCOMMAND maximize #xf030
      (w32-send-sys-command 61488)
    (set-frame-parameter nil 'fullscreen 'fullboth)))

(defun ots-fullscreen-exit ()
  (interactive)
  (if (fboundp 'w32-send-sys-command)
      ;; WM_SYSCOMMAND restore #xf120
      (w32-send-sys-command 61728)
    (set-frame-parameter nil 'fullscreen nil)))

(defun ots-fullscreen-toggle ()
  (interactive)
  (if ots-fullscreen-p
      (ots-fullscreen-exit)
    (ots-fullscreen-enter))
  (setq ots-fullscreen-p (not ots-fullscreen-p)))

(provide 'ots-fullscreen)
;;; ots-fullscreen.el ends here
