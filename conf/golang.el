(use-package go-mode
  :init
  (add-hook 'before-save-hook 'gofmt-before-save)
  (add-hook
   'go-mode-hook
   '(lambda () (setq tab-width 2))
   )
  (add-hook 'go-mode-hook 'flycheck-mode)
  (use-package go-eldoc
    :hook
    (add-hook 'go-mode-hook 'go-eldoc-setup)
    :config
    (set-face-attribute 'eldoc-highlight-function-argument nil
			:underline t :foreground "green"
			:weight 'bold)
    )

  :config
  (when (equal system-type 'gnu/linux)
    (setq homedir "/home/otknoy"))
  (when (equal system-type 'darwin)
    (setq homedir "/Users/otknoy"))
  (setq gopath (concat homedir "/go"))
  (setenv "GOPATH" gopath)
  (add-to-list 'exec-path (expand-file-name (concat gopath "/bin")))

  ;; goimports
  (setq gofmt-command "goimports")
  )

(use-package company
  :init
  (use-package company-go
    :init
    (add-hook 'go-mode-hook (lambda ()
			      (set (make-local-variable 'company-backends) '(company-go))
			      (company-mode)))
    )
  )

