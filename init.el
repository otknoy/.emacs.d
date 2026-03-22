;;; init.el --- my init.el

;;; Commentary:

;;; Code:

;; <leaf-install-code>
(eval-and-compile
  (customize-set-variable
   'package-archives '(("org" . "https://orgmode.org/elpa/")
                       ("melpa" . "https://melpa.org/packages/")
                       ("gnu" . "https://elpa.gnu.org/packages/")))
  (unless (package-installed-p 'leaf)
    (package-refresh-contents)
    (package-install 'leaf))

  (leaf leaf-keywords
    :ensure t
    :init
    ;; optional packages if you want to use :hydra, :el-get, :blackout,,,
    (leaf hydra :ensure t)
    (leaf blackout :ensure t)

    :config
    ;; initialize leaf-keywords.el
    (leaf-keywords-init)))
;; </leaf-install-code>

(leaf leaf
  (leaf leaf-convert :ensure t)
  (leaf leaf-tree
    :ensure t
    :blackout t
    :custom ((imenu-list-size . 30)
             (imenu-list-position . 'left))))

(use-package init-loader
  :ensure t
  :config
  (init-loader-load))

(provide 'init)

;;; init.el ends here
