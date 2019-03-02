(use-package anzu
  :config (global-anzu-mode +1))

(use-package auto-highlight-symbol
  :config
  (progn
    (global-auto-highlight-symbol-mode t)
    (ahs-set-idle-interval 0.3)))

(use-package company
  :config
  (progn
    (add-hook 'after-init-hook 'global-company-mode)
    )
  )

(use-package flycheck
  :straight t
  :init (global-flycheck-mode))

(use-package popwin
  :config (popwin-mode 1))

(use-package magit)

(use-package git-gutter
  :config
  (progn
    (global-git-gutter-mode t)
    )
  )
