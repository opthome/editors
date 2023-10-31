(setq auto-save-default nil)

;; gc settins
(setq auto-save-default nil)
(setq auto-save-list-file-prefix nil)
(setq make-backup-files nil)
(setq ring-bell-function 'ignore)

(global-auto-revert-mode t)
(global-hl-line-mode 1)
(save-place-mode 1)
(desktop-save-mode 1)

; (global-company-mode 1)
; (completion-ignore-case t)

;; edit
(electric-pair-mode t)
(setq scroll-step 1)  ; 逐行滚动

; (add-hook 'after-init-hook 'global-company-mode)
(add-hook 'prog-mode-hook #'show-paren-mode)
(add-hook 'prog-mode-hook #'hs-minor-mode)

;; ui
(setq inhibit-startup-message t)
; (tool-bar-mode -1)
; (toggle-scroll-bar -1)

(global-display-line-numbers-mode 1)
(column-number-mode t)


;; keybind 
(defalias 'yes-or-no-p 'y-or-n-p)
;; mac keybind
(setq mac-option-modifier 'meta
      mac-command-modifier 'super)
(global-set-key (kbd "s-a") 'mark-whole-buffer)
(global-set-key (kbd "s-c") 'kill-ring-save)
(global-set-key (kbd "s-s") 'save-buffer)
(global-set-key (kbd "s-v") 'yank)
(global-set-key (kbd "s-z") 'undo)
(global-set-key (kbd "s-x") 'kill-region)
(global-set-key (kbd "s-f") 'isearch-forward)

(define-key evil-motion-state-map (kbd "C-h") #'evil-window-left)
(define-key evil-motion-state-map (kbd "C-j") #'evil-window-down)
(define-key evil-motion-state-map (kbd "C-k") #'evil-window-up)
(define-key evil-motion-state-map (kbd "C-l") #'evil-window-right)


(provide 'init-basic)
