;;; https://github.com/raxod502/straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;;; packages
(straight-use-package 'init-loader)
(load-file "~/.emacs.d/elisp/packages.el")

;;; config
(load-file "~/.emacs.d/elisp/settings.el")
(load-file "~/.emacs.d/elisp/flycheck.el")
(load-file "~/.emacs.d/elisp/auto-complete-mode.el")
(load-file "~/.emacs.d/elisp/python.el")
(load-file "~/.emacs.d/elisp/golang.el")
(load-file "~/.emacs.d/elisp/web.el")
(load-file "~/.emacs.d/elisp/others.el")
