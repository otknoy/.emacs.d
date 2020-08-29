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
; (load-file "~/.emacs.d/conf/setting.el")
(load-file "~/.emacs.d/conf/util.el")
(load-file "~/.emacs.d/conf/golang.el")
(load-file "~/.emacs.d/conf/web.el")
; (load-file "~/.emacs.d/conf/other.el")
(load-file "~/.emacs.d/conf/lsp.el")


;; <leaf-install-code>
(eval-and-compile
  (when (or load-file-name byte-compile-current-file)
    (setq user-emacs-directory
          (expand-file-name
           (file-name-directory (or load-file-name byte-compile-current-file))))))

(eval-and-compile
  (customize-set-variable
   'package-archives '(("org" . "https://orgmode.org/elpa/")
                       ("melpa" . "https://melpa.org/packages/")
                       ("gnu" . "https://elpa.gnu.org/packages/")))
  (package-initialize)
  (unless (package-installed-p 'leaf)
    (package-refresh-contents)
    (package-install 'leaf))

  (leaf leaf-keywords
    :ensure t
    :init
    ;; optional packages if you want to use :hydra, :el-get, :blackout,,,
    (leaf hydra :ensure t)
    (leaf el-get :ensure t)
    (leaf blackout :ensure t)

    :config
    ;; initialize leaf-keywords.el
    (leaf-keywords-init)))
;; </leaf-install-code>

(leaf leaf
  :config
  (leaf leaf-convert :ensure t)
  (leaf leaf-tree
    :ensure t
    :custom ((imenu-list-size . 30)
             (imenu-list-position . 'left))))

(leaf system
  :init
  (leaf exec-path-from-shell
    :ensure t
    :config
    (exec-path-from-shell-initialize))
  (leaf autorevert
    :doc "revert buffers when files on disk change"
    :tag "builtin"
    :custom ((auto-revert-interval . 0.3)
             (auto-revert-check-vc-info . t))
    :global-minor-mode global-auto-revert-mode)
  (leaf delsel
    :doc "delete selection if you insert"
    :tag "builtin"
    :global-minor-mode delete-selection-mode)
  (leaf files
    :doc "file input and output commands for Emacs"
    :tag "builtin"
    :custom `((auto-save-timeout . 15)
              (auto-save-interval . 60)
              (auto-save-file-name-transforms . '((".*" ,(locate-user-emacs-file "backup/") t)))
              (backup-directory-alist . '((".*" . ,(locate-user-emacs-file "backup"))
                                        (,tramp-file-name-regexp . nil)))
              (version-control . t)
              (delete-old-versions . t)))
  :hook (after-save-hook . executable-make-buffer-file-executable-if-script-p)
  :custom ((read-file-name-completion-ignore-case . t))
  :bind (("C-z" . nil)) ; C-z を無効にする
  )

(leaf view
  :init
  (leaf color-theme-modern
    :ensure t
    :if window-system
    :init
    (load-theme 'clarity t t)
    (enable-theme 'clarity))

  (leaf font
    :init
    (set-face-attribute 'default nil
			:family "Ricty"
			:height 135)
    (set-fontset-font
     nil 'japanese-jisx0208
     (font-spec :family "Ricty")))

  (leaf hidden
    :init
    (menu-bar-mode 0)
    (tool-bar-mode 0))
  (set-frame-parameter nil 'alpha 90)

  (leaf paren
    :custom ((show-paren-delay . 0.1))
    :global-minor-mode show-paren-mode)

  (leaf dimmer
    :ensure t
    :custom ((dimmer-fraction . 0.3))
    :global-minor-mode dimmer-mode)

  :custom ((truncate-lines . t)
	   (truncated-partial-width-window-p . 0))

  :global-minor-mode column-number-mode
  )


(leaf other
  :init
  (leaf eldoc
    :init
    (turn-on-eldoc-mode)
    :hook (emacs-lisp-mode-hook lisp-interaction-mode-hook ielm-mode-hook)
    :custom ((eldoc-idel-delay . 0.2)
	     (eldoc-echo-area-use-multiline-p . t)))
  (leaf markdown-mode
    :ensure t
    :custom ((markdown-command . "markdown")))
  (leaf yaml-mode :ensure t)
  (leaf dockerfile-mode :ensure t)
  (leaf docker-compose-mode :ensure t)
  )
