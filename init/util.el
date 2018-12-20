(use-package anzu
  :config (global-anzu-mode +1))

(use-package auto-highlight-symbol
  :config
  (progn
    (global-auto-highlight-symbol-mode t)
    (ahs-set-idle-interval 0.3)))


(use-package auto-complete
  :config
  (progn
    (require 'auto-complete-config)
    (ac-config-default)

    (global-auto-complete-mode t)

    (add-to-list 'ac-dictionary-directories
		 "~/.emacs.d/elisp/auto-complete/ac-dict")
    (setq ac-comphist-file "~/.emacs.d/elisp/auto-complete/ac-comphist.dat")

    ;;; keybind
    (setq ac-use-menu-map t)
    (define-key ac-menu-map "\C-n" 'ac-next)
    (define-key ac-menu-map "\C-p" 'ac-previous)

    ;; キーは好きなのを割り当てて下さい
    (global-set-key (kbd "M-h") 'ac-complete-look)
    ))

(use-package flycheck
  :straight t
  :init (global-flycheck-mode))

(use-package popwin
  :config (popwin-mode 1))

(use-package magit)
