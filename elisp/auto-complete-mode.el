(require 'auto-complete-config)
(ac-config-default)

(add-to-list 'ac-dictionary-directories
	     "~/.emacs.d/elisp/auto-complete/ac-dict")
(setq ac-comphist-file "~/.emacs.d/elisp/auto-complete/ac-comphist.dat")

;;; keybind
(setq ac-use-menu-map t)
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)

;;; modes using auto-complete-mode
(add-to-list 'ac-modes 'jde-mode)
(add-to-list 'ac-modes 'processing-mode)

;(global-auto-complete-mode t)

;; キーは好きなのを割り当てて下さい
(global-set-key (kbd "M-h") 'ac-complete-look)
