
;; 加载配置文件夹
(add-to-list 'load-path (expand-file-name (concat user-emacs-directory "lisp")))

;; custom configuration
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(when (file-exists-p custom-file) (load-file custom-file))

;; require package
(require 'init-elpa)
(require 'init-evil)
(require 'init-tools)
(require 'init-basic)

(provide 'init)

