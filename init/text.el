(use-package markdown-mode
  :mode (("\\.\\(txt\\|md\\)$" . markdown-mode))
  :config
  (progn
    (autoload 'markdown-mode "markdown-mode.el"
      "Major mode for editing Markdown files" t)

    (defun markdown-custom ()
      "markdown-mode-hook"
      ; (setq markdown-command "/usr/local/bin/markdown")
      (setq markdown-command "jq --slurp --raw-input '{\"text\": \"\\(.)\", \"mode\": \"gfm\"}' | curl -sS --data @- https://api.github.com/markdown")
      )

    (add-hook 'markdown-mode-hook '(lambda() (markdown-custom)))
    )
  )
