;; mac shellPath settings
;(use-package exec-path-from-shell
;  :ensure t
;  )
;(when (memq window-system '(mac ns x))
;  (exec-path-from-shell-initialize))

;; other settings
(use-package restart-emacs
  :ensure t)

(use-package magit
  :ensure t)

(use-package highlight-symbol
  :ensure t
  :init (highlight-symbol-mode))

(use-package which-key
  :ensure t
  :init (which-key-mode))

; cd ~
; npm install mathjax-node-cli
(use-package org-latex-impatient
  :defer t
  :hook (org-mode . org-latex-impatient-mode)
  :init
  (setq org-latex-impatient-tex2svg-bin
        ;; location of tex2svg executable
        "~/node_modules/mathjax-node-cli/bin/tex2svg"))


(provide 'init-tools)
