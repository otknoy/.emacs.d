(leaf modes
  :config
  (leaf lang
    :config
    (leaf go-mode
      :ensure t
      :custom ((gofmt-command . "gosimports"))
      :hook ((before-save-hook . gofmt-before-save)
             (go-mode-hook . (lambda () (setq tab-width 2))))
      :config
      (leaf gotests
        :vc (:url "https://github.com/damienlevin/GoTests-Emacs")
        :require t
        )
      (leaf go-impl
	:ensure t
	)
      )
    (leaf web-mode
      :ensure t
      :mode
      "\\.html??\\'"
      "\\.jsx?\\'"
      "\\.tsx?\\'"
      :custom
      (web-mode-code-indent-offset . 2)
      (web-mode-css-indent-offset . 2)
      (web-mode-enable-auto-indentation . t)
      (web-mode-enable-auto-quoting . nil)
      (web-mode-enable-current-column-highlight . t)
      (web-mode-enable-current-element-highlight . t)
      (web-mode-markup-indent-offset . 2)
      (indent-tab-mode . nil)

      ;; .js を .jsx として開く設定
      ;; TODO: 普通の js も jsx として開いてしまうのでstring:react とかを調べて自動で切り替えられるようにしたい
      (web-mode-content-types-alist . '(("jsx" . "\.jsx?\\'"))))
    (leaf elisp
      :config
      (leaf macrostep
        :ensure t
        :bind (("C-c e" . macrostep-expand))))
    )
  (leaf other
    :config
    (leaf markdown-mode
      :ensure t
      :custom ((markdown-command . "markdown")))
    (leaf yaml-mode :ensure t)
    (leaf dockerfile-mode :ensure t)
    (leaf docker-compose-mode :ensure t))
  )
