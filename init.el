(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
; (package-refresh-contents)
(package-install 'init-loader)

(load-file "~/.emacs.d/elisp/packages.el")
(load-file "~/.emacs.d/elisp/settings.el")

(load-file "~/.emacs.d/elisp/flycheck.el")
(load-file "~/.emacs.d/elisp/auto-complete-mode.el")

(load-file "~/.emacs.d/elisp/python.el")
(load-file "~/.emacs.d/elisp/golang.el")
(load-file "~/.emacs.d/elisp/web.el")

(load-file "~/.emacs.d/elisp/others.el")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (markdown-mode yaml-mode yatex web-mode php-mode go-autocomplete go-eldoc go-mode js2-mode jedi flycheck magit popwin auto-highlight-symbol auto-complete anzu color-theme exec-path-from-shell init-loader)))
 '(read-file-name-completion-ignore-case t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(web-mode-comment-face ((t (:foreground "#D9333F"))))
 '(web-mode-css-at-rule-face ((t (:foreground "#FF7F00"))))
 '(web-mode-css-pseudo-class-face ((t (:foreground "#FF7F00"))))
 '(web-mode-css-rule-face ((t (:foreground "#A0D8EF"))))
 '(web-mode-doctype-face ((t (:foreground "#82AE46"))))
 '(web-mode-html-attr-name-face ((t (:foreground "#C97586"))))
 '(web-mode-html-attr-value-face ((t (:foreground "#82AE46"))))
 '(web-mode-html-tag-face ((t (:foreground "#E6B422" :weight bold))))
 '(web-mode-server-comment-face ((t (:foreground "#D9333F")))))
