(when load-file-name
  (setq user-emacs-directory (file-name-directory load-file-name)))

;; el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))
(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)


(load-file "~/.emacs.d/elisp/packages.el")

(load-file "~/.emacs.d/elisp/settings.el")

(load-file "~/.emacs.d/elisp/flycheck.el")
(load-file "~/.emacs.d/elisp/auto-complete-mode.el")
(load-file "~/.emacs.d/elisp/misc.el")

(load-file "~/.emacs.d/elisp/python.el")
; (load-file "~/.emacs.d/elisp/c++.el")
(load-file "~/.emacs.d/elisp/golang.el")
; (load-file "~/.emacs.d/elisp/php.el")
(load-file "~/.emacs.d/elisp/web.el")

(load-file "~/.emacs.d/elisp/others.el")

