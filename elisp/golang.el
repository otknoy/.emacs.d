; GOPATRH
(when (equal system-type 'gnu/linux)
  (setq homedir "/home/otknoy"))
(when (equal system-type 'darwin)
  (setq homedir "/Users/otknoy"))
(setq gopath (concat homedir "/go"))
(setenv "GOPATH" gopath)
(add-to-list 'exec-path (expand-file-name (concat gopath "/bin")))

; hook
(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook
 'go-mode-hook
 '(lambda () (setq tab-width 2))
 )

; go-eldoc
(require 'go-eldoc)
(add-hook 'go-mode-hook 'go-eldoc-setup)
(set-face-attribute 'eldoc-highlight-function-argument nil
                    :underline t :foreground "green"
                    :weight 'bold)

; flycheck
(add-hook 'go-mode-hook 'flycheck-mode)

; goimports
(setq gofmt-command "goimports")

(require 'go-autocomplete)
(require 'auto-complete-config)
