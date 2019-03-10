(use-package anzu
  :config (global-anzu-mode +1))

(use-package auto-highlight-symbol
  :config
  (global-auto-highlight-symbol-mode t)
  (ahs-set-idle-interval 0.3)
  )

(use-package company
  :init
  (add-hook 'after-init-hook 'global-company-mode)
  :config
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-search-map (kbd "C-n") 'company-select-next)
  (define-key company-search-map (kbd "C-p") 'company-select-previous)
  (setq company-idle-delay 0.1)
  (setq company-minimum-prefix-length 2)
  (setq company-selection-wrap-around t)
  )

(use-package popwin
  :config (popwin-mode 1))

(use-package magit)

(use-package git-gutter
  :config (global-git-gutter-mode t))

(use-package eglot
  :init
  (add-hook 'go-mode-hook 'eglot-ensure)
  (add-hook 'python-mode-hook 'eglot-ensure)
  (add-hook 'js-mode-hook 'eglot-ensure)
  (add-hook 'typescript-mode-hook 'eglot-ensure)
  )

(use-package neotree)

(use-package imenu-list
  :custom
  (imenu-list-position 'right)
  (imenu-list-auto-resize nil)
  )

(use-package minimap
  :custom
  (minimap-window-location 'right)
  (minimap-update-delay 0.2)
  (minimap-minimum-width 20)
  )

(defun ide-like()
  "IDE-like multi columns mode"
  (interactive)

  (neotree-toggle)
  (imenu-list-smart-toggle)
  )
