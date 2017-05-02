;;; -*- coding: utf-8 -*-
;;; ots-undo-tree.el

(require 'undo-tree)
(defalias 'redo 'undo-tree-redo)
(defalias 'redo 'undo-tree-undo)
(setq undo-tree-enable-undo-in-region nil)
(global-undo-tree-mode 1)

(provide 'ots-undo-tree)
;;; ots-undo-tree.el ends here
