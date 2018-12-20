(use-package go-mode
  :config
  (progn
    (setenv "GOPATH" "/home/otknoy/go")
    (add-to-list 'exec-path (expand-file-name "/home/otknoy/go/bin"))

    (add-hook 'before-save-hook 'gofmt-before-save)
    (add-hook
     'go-mode-hook
     '(lambda () (setq tab-width 2))
     )

    ;; go-eldoc
    (add-hook 'go-mode-hook 'flycheck-mode)

    ;; goimports
    (setq gofmt-command "goimports")
    ))

(use-package go-eldoc
  :config
  (progn
    (add-hook 'go-mode-hook 'go-eldoc-setup)
    (set-face-attribute 'eldoc-highlight-function-argument nil
			:underline t :foreground "green"
			:weight 'bold)
    ))

(use-package go-autocomplete
  :config (require 'auto-complete-config))
