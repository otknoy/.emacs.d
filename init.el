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
