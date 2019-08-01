;;; -*- coding: utf-8 -*-
;;; ots-lua-mode.el

(defun ots-lua-mode-set-properties ()
  "Set properties for editing Lua files."
  (setq-local fill-column 80)
  (setq-local lua-indent-level 2)
  (setq-local tab-width 2))

(add-hook 'lua-mode-hook 'ots-lua-mode-set-properties)

(provide 'ots-lua-mode)
;;; ots-lua-mode.el ends here
