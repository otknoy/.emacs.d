(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.\\(txt\\|md\\)$" . markdown-mode))

(defun markdown-custom ()
  "markdown-mode-hook"
  (setq markdown-command "/opt/local/bin/multimarkdown"))
(add-hook 'markdown-mode-hook '(lambda() (markdown-custom)))
