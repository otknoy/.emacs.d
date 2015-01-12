(require 'yasnippet)
(setq yas/root-directory "~/.emacs.d/elisp/yasnippet/snippets")
(yas/load-directory yas/root-directory)
(yas/global-mode t)
(yas/minor-mode t)

;; popup
(require 'popup)
;(require 'dropdown-list)
(setq yas/prompt-functions '(yas/dropdown-prompt))

;; indent
(defun yas/indent-snippet ()
  (indent-region yas/snippet-beg yas/snippet-end)
  (indent-according-to-mode))
(add-hook 'yas/after-exit-snippet-hook 'yas/indent-snippet)
