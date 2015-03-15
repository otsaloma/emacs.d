;;; -*- coding: utf-8 -*-
;;; ots-minibuffer.el

(defun ots-minibuffer-abort ()
  "Abort the minibuffer edit."
  (when (>= (recursion-depth) 1)
    (abort-recursive-edit)))

(add-hook 'mouse-leave-buffer-hook 'ots-minibuffer-abort)

(provide 'ots-minibuffer)
;;; ots-minibuffer.el ends here
