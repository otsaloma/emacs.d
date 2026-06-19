;;; -*- coding: utf-8 -*-
;;; ots-project.el

(use-package project
  :config
  ;; Used both by project.el's own commands and by `ots-util-find-file',
  ;; which walks the file system so that off-repo files show up too.
  (setq project-vc-ignores '("*.elc"
                             "*.ico"
                             "*.min.css"
                             "*.min.js"
                             "*.parquet"
                             "*.png"
                             "*.pyc"
                             "*.rds"
                             "*~"
                             ".cache/"
                             ".pytest_cache/"
                             ".venv/"
                             "__pycache__/"
                             "build/"
                             "dist/"
                             "docsets/"
                             "eln-cache/"
                             "elpa/"
                             "man/"
                             "node_modules/"
                             "straight/"
                             "vendor/"
                             "venv/")))

(provide 'ots-project)
;;; ots-project.el ends here
