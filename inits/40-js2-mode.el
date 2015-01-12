(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.js$" . js2-mode))

(add-hook 'js2-mode-hook
	  '(lambda ()
	     (add-to-list 'ac-dictionary-files "~/.emacs.d/elisp/auto-complete/ac-dict/javascript-mode")
	     ))