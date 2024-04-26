;; 显示快捷键
(use-package which-key
  :ensure t
  :init (which-key-mode))

;; mini buffer
(use-package vertico
  :init
  (vertico-mode))

(use-package orderless
  :ensure t
  :init
  (setq completion-styles '(orderless basic)
        completion-category-defaults nil
        completion-category-overrides '((file (styles partial-completion)))))

(use-package marginalia
  :ensure t
  :init
  (marginalia-mode))

(use-package embark
  :ensure t
  :bind
  :init
  (setq prefix-help-command #'embark-prefix-help-command)
  :config
  (add-to-list 'display-buffer-alist
               '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
                nil
                (window-parameters (mode-line-format . none)))))

;; 文件搜索
(use-package consult
  ;; Replace bindings. Lazily loaded due by `use-package'.
  :bind 
  (("C-x b" . consult-buffer)                ;; orig. switch-to-buffer
   ("C-x r b" . consult-bookmark)            ;; orig. bookmark-jump
   ("C-x p b" . consult-project-buffer)      ;; orig. project-switch-to-buffer
   ("C-s" . consult-line)
   ("C-c r e" . consult-grep))
  :hook (completion-list-mode . consult-preview-at-point-mode)
  :init
  (setq register-preview-delay 0.5
        register-preview-function #'consult-register-format)
  (advice-add #'register-preview :override #'consult-register-window)
  (setq xref-show-xrefs-function #'consult-xref
        xref-show-definitions-function #'consult-xref)
  :config
  (consult-customize
   consult-theme :preview-key '(:debounce 0.2 any)
   consult-ripgrep consult-git-grep consult-grep
   consult-bookmark consult-recent-file consult-xref
   consult--source-bookmark consult--source-file-register
   consult--source-recent-file consult--source-project-recent-file

   :preview-key '(:debounce 0.4 any))
  (setq consult-narrow-key "<") ;; "C-+"
)

(use-package embark-consult
  :ensure t ; only need to install it, embark loads it after consult if found
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(use-package wgrep
  :bind
  (:map grep-mode-map ("C-c C-q" . wgrep-change-to-wgrep-mode))
  :init
  (setq wgrep-auto-save-buffer t))



(provide 'init-tools)
