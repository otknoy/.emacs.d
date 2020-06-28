; (setq lsp-keymap-prefix "s-l")
(setq lsp-keymap-prefix "C-c l")

(use-package lsp-mode
  :hook (
         (go-mode . lsp)
         (python-mode . lsp)
	 (js-mode . lsp)
         ;(lsp-mode . lsp-enable-which-key-integration)
	 )
  :commands lsp
  :init
  (setq lsp-prefer-capf t)
  )

(use-package lsp-ui :commands lsp-ui-mode)
