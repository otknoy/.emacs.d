;;; init.el --- my init.el

;;; Commentary:

;;; my init.el

;;; Code:

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
  (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
  (setq custom-file (locate-user-emacs-file "custom.el"))
  (leaf exec-path-from-shell
    :ensure t
    :config
    (exec-path-from-shell-initialize))
  (leaf auto-revert
    :doc "revert buffers when files on disk change"
    :tag "builtin"
    :global-minor-mode global-auto-revert-mode)
  (leaf delete-selection
    :doc "delete selection if you insert"
    :tag "builtin"
    :global-minor-mode t)
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
    :config
    (set-face-attribute 'default nil
			:family "Ricty"
			:height 135)
    (set-fontset-font
     nil 'japanese-jisx0208
     (font-spec :family "Ricty")))

  (leaf window
    :config
    (menu-bar-mode 0)
    (tool-bar-mode 0)
    (set-frame-parameter nil 'alpha 90)
    (set-frame-size (selected-frame) 120 60))

  (leaf dimmer
    :ensure t
    :custom ((dimmer-fraction . 0.3))
    :global-minor-mode t)
  (leaf paren
    :custom ((show-paren-delay . 0.1))
    :global-minor-mode show-paren-mode)
  (leaf auto-highlight-symbol
    :ensure t
    :config
    (ahs-set-idle-interval 0.2)
    :global-minor-mode global-auto-highlight-symbol-mode)
  (leaf git-gutter
    :ensure t
    :global-minor-mode global-git-gutter-mode)

  (leaf column-number :global-minor-mode t)
  (leaf display-line-numbers :global-minor-mode t)

  :custom ((truncate-lines . t)
	   (truncated-partial-width-window-p . 0)
	   )
  )

(leaf tool
  :init
  (leaf anzu
    :ensure t
    :custom (global-anzu-mode . +1))
  (leaf flycheck
    :ensure t
    :bind (("M-n" . flycheck-next-error)
           ("M-p" . flycheck-previous-error))
    :global-minor-mode global-flycheck-mode)
  (leaf company
    :ensure t
    :blackout t
    :leaf-defer nil
    :bind ((company-active-map
            ("M-n" . nil)
            ("M-p" . nil)
            ("C-s" . company-filter-candidates)
            ("C-n" . company-select-next)
            ("C-p" . company-select-previous)
            ("<tab>" . company-complete-selection))
           (company-search-map
            ("C-n" . company-select-next)
            ("C-p" . company-select-previous)))
    :custom ((company-idle-delay . 0)
             (company-minimum-prefix-length . 1)
             (company-transformers . '(company-sort-by-occurrence)))
    :global-minor-mode global-company-mode)
  (leaf magit :ensure t)
  (leaf lsp-mode
    :ensure t
    :custom ((lsp-prefer-capf . t)
	     (lsp-keymap-prefix . "C-c l"))
    :hook ((python-mode-hook . lsp)
	   (go-mode-hook . lsp)
	   (js-mode-hook . lsp))
    :init
    (leaf lsp-ui
      :ensure t
      :commands lsp-ui-mode)
    )
  (leaf ivy
    :ensure t
    :global-minor-mode t
    :config
    (define-key ivy-minibuffer-map (kbd "TAB") 'ivy-partial)
    (leaf swiper
      :ensure t
      ; :bind (("C-s" . swiper))
      )
    (leaf counsel
      :ensure t
      :global-minor-mode t)
    )
  (leaf ivy-rich
    :ensure t
    :after ivy
    :global-minor-mode t)
  )

(leaf lang
  :init
  (leaf go-mode
    :ensure t
    :custom ((gofmt-command . "goimports"))
    :hook ((before-save-hook . gofmt-before-save))
    )
  (leaf js-mode
    :custom ((js-indent-level . 2))
    )
  (leaf typescript-mode
    :ensure t
    :custom ((typescript-indent-level . 2))
    )
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

(provide 'init)

;; Local Variables:
;; eval: (leaf-tree-mode t)
;; eval: (display-line-numbers-mode t)
;; End:

;;; init.el ends here
