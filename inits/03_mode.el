(use-package go-mode
  :ensure t
  :custom
  (gofmt-command "gosimports")
  :hook
  (before-save . gofmt-before-save)
  (go-mode . (lambda () (setq tab-width 2)))
  :config
  (use-package gotests
    :vc (:url "https://github.com/damienlevin/GoTests-Emacs")
    :ensure t)
  (use-package go-impl
    :ensure t))

(use-package web-mode
  :ensure t
  :mode ("\\.html??\\'" "\\.jsx?\\'" "\\.tsx?\\'")
  :custom
  (web-mode-code-indent-offset 2)
  (web-mode-css-indent-offset 2)
  (web-mode-enable-auto-indentation t)
  (web-mode-enable-auto-quoting nil)
  (web-mode-enable-current-column-highlight t)
  (web-mode-enable-current-element-highlight t)
  (web-mode-markup-indent-offset 2)
  (indent-tab-mode nil)
  ;; .js を .jsx として開く設定
  ;; TODO: 普通の js も jsx として開いてしまうのでstring:react とかを調べて自動で切り替えられるようにしたい
  (web-mode-content-types-alist '(("jsx" . "\\.jsx?\\'"))))

; elips
(use-package macrostep
  :ensure t
  :bind ("C-c e" . macrostep-expand))

(use-package markdown-mode
  :ensure t
  :custom
  (markdown-command "markdown"))

(use-package yaml-mode
  :ensure t)

(use-package dockerfile-mode
  :ensure t)

(use-package docker-compose-mode
  :ensure t)
