;;; -*- coding: utf-8 -*-
;;; ots-lua.el

(defun ots-lua-set-properties ()
  "Set properties for editing Lua files."
  (setq-local fill-column 80)
  (setq-local lua-indent-level 2)
  (setq-local tab-width 2))

(add-hook 'lua-mode-hook 'ots-lua-set-properties)

(provide 'ots-lua)
;;; ots-lua.el ends here
