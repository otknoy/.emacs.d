;; anzu
(global-anzu-mode +1)

;; auto-highlight-symbol-mode
(global-auto-highlight-symbol-mode t)
(ahs-set-idle-interval 0.3)

;; el-doc
(defun elisp-mode-hooks ()
  "lisp-mode-hooks"
  (when (require 'eldoc nil t)
    (setq eldoc-idle-delay 0.2)
    (setq eldoc-echo-area-use-multiline-p t)
    (turn-on-eldoc-mode)))
(add-hook 'emacs-lisp-mode-hook 'elisp-mode-hooks)

;; markdown-mode
(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.\\(txt\\|md\\)$" . markdown-mode))
(defun markdown-custom ()
  "markdown-mode-hook"
  (setq markdown-command "/usr/local/bin/markdown"))
(add-hook 'markdown-mode-hook '(lambda() (markdown-custom)))

;; popwin
(setq display-buffer-function 'popwin:display-buffer)
(setq popwin:popup-window-position 'bottom)
