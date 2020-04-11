;;; https://github.com/raxod502/straight.el

;; osx setting
(when (eq system-type 'darwin)
  (with-eval-after-load 'gnutls
    (add-to-list 'gnutls-trustfiles "/usr/local/etc/libressl/cert.pem"))
  )

;; bootstrap
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

(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

(use-package init-loader)
(load-file "~/.emacs.d/conf/setting.el")
(load-file "~/.emacs.d/conf/util.el")
(load-file "~/.emacs.d/conf/golang.el")
(load-file "~/.emacs.d/conf/web.el")
(load-file "~/.emacs.d/conf/other.el")
(load-file "~/.emacs.d/conf/lsp.el")
