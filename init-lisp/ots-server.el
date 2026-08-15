;;; -*- coding: utf-8 -*-
;;; ots-server.el

(defun ots-server-show-position ()
  "Center and flash the line the client was told to visit."
  (when buffer-file-name
    (recenter)
    (require 'pulse)
    (let ((pulse-delay 0.05)
          (pulse-iterations 30))
      (pulse-momentary-highlight-one-line))))

(use-package server
  :config
  (setq server-raise-frame nil)

  ;; Make it obvious where we jumped to with a +LINE argument,
  ;; especially when the file was already open in another position.
  (add-hook 'emacs-startup-hook 'ots-server-show-position t)
  (add-hook 'server-switch-hook 'ots-server-show-position t))

(provide 'ots-server)
;;; ots-server.el ends here
