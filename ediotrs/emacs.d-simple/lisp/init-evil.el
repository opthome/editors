(use-package evil
  :ensure t
  :init
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (evil-mode)

  ;; https://emacs.stackexchange.com/questions/46371/how-can-i-get-ret-to-follow-org-mode-links-when-using-evil-mode
  (with-eval-after-load 'evil-maps
    (define-key evil-motion-state-map (kbd "RET") nil))
)


(use-package evil-leader
  :init (global-evil-leader-mode)
  :custom (evil-leader/leader "SPC")
  :config
  (evil-leader/set-key
    "ff" 'find-file
    "bb" 'consult-buffer
    "ob" 'consult-buffer-other-window
    "x"  'consult-mode-command
    "fl" 'consult-line
    "fg" 'consult-grep))


(provide 'init-evil)
