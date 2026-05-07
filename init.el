;;; init.el --- my init.el

;;; Commentary:

;;; Code:

;; <leaf-install-code>
(eval-and-compile
  (customize-set-variable
   'package-archives '(("org"   . "https://orgmode.org/elpa/")
                       ("melpa" . "https://melpa.org/packages/")
                       ("gnu"   . "https://elpa.gnu.org/packages/"))))

(use-package init-loader
  :ensure t
  :config
  (init-loader-load))

(provide 'init)

;;; init.el ends here
