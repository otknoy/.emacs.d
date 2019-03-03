(use-package eldoc
  :init
  (add-hook 'emacs-lisp-mode-hook 'eldoc-mode)
  (add-hook 'lisp-interaction-mode-hook 'eldoc-mode)
  (add-hook 'ielm-mode-hook 'eldoc-mode)
  :config
  (setq eldoc-idle-delay 0.2)
  (setq eldoc-echo-area-use-multiline-p t)
  (turn-on-eldoc-mode)
)

(use-package dockerfile-mode)

(use-package markdown-mode
  :mode (("\\.\\(txt\\|md\\)$" . markdown-mode))
  :config
  (autoload 'markdown-mode "markdown-mode.el"
    "Major mode for editing Markdown files" t)

  (defun markdown-custom ()
    "markdown-mode-hook"
    ;; (setq markdown-command "/usr/local/bin/markdown")
    (setq markdown-command "jq --slurp --raw-input '{\"text\": \"\\(.)\", \"mode\": \"gfm\"}' | curl -sS --data @- https://api.github.com/markdown")
    )
  
  (add-hook 'markdown-mode-hook '(lambda() (markdown-custom)))
  )

(use-package yaml-mode)
