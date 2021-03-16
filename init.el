;;; init.el --- my init.el

;;; Commentary:

;;; my init.el

;;; Code:

(prog1 "prepare leaf"
  (prog1 "package"
    (custom-set-variables
     '(package-archives '(("org"   . "https://orgmode.org/elpa/")
                          ("melpa" . "https://melpa.org/packages/")
                          ("gnu"   . "https://elpa.gnu.org/packages/"))))
    (package-initialize))

  (prog1 "leaf"
    (unless (package-installed-p 'leaf)
      (unless (assoc 'leaf package-archive-contents)
        (package-refresh-contents))
      (condition-case err
          (package-install 'leaf)
        (error
         (package-refresh-contents)       ; renew local melpa cache if fail
         (package-install 'leaf))))

    (leaf leaf
      :config
      (leaf leaf-keywords
	:ensure t
	:init
	(leaf hydra :ensure t)
	(leaf el-get :ensure t
	  :custom ((el-get-git-shallow-clone  . t)))
	(leaf blackout :ensure t)
	:config (leaf-keywords-init))
      (leaf leaf-convert :ensure t)
      (leaf leaf-tree
	:ensure t
	:blackout t
	:custom ((imenu-list-size . 30)
		 (imenu-list-position . 'left))))))

(leaf system
  :init
  (setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")
  (setq custom-file (locate-user-emacs-file "custom.el"))
  (leaf exec-path-from-shell
    :ensure t
    :config
    (exec-path-from-shell-initialize))
  (leaf delete-selection
    :global-minor-mode t)
  (leaf file
    :config
    (leaf auto-revert
      :global-minor-mode global-auto-revert-mode)
    (leaf files
      :custom `((auto-save-timeout . 15)
		(auto-save-interval . 60)
		(auto-save-file-name-transforms . '((".*" ,(locate-user-emacs-file "backup/") t)))
		(backup-directory-alist . '((".*" . ,(locate-user-emacs-file "backup"))
					    (,tramp-file-name-regexp . nil)))
		(version-control . t)
		(delete-old-versions . t)))
    (leaf filename-completion
      :custom ((read-file-name-completion-ignore-case . t)))
    (leaf script-executable
      :hook (after-save-hook . executable-make-buffer-file-executable-if-script-p))
    (leaf find-file-default-directory
      :when (eq system-type 'darwin)
      :emacs= 27.1
      :custom ((default-directory . "~")
	       (command-line-default-directory . "~/"))))
  (leaf tramp
    :config
    (customize-set-variable
     'tramp-password-prompt-regexp
     (concat
      "^.*"
      (regexp-opt
       '("passphrase" "Passphrase"
	 "password" "Password"
	 "Verification code")
       t)
      ".*:\0? *")))
  (leaf auto-package-update
    :ensure t
    :custom ((auto-package-update-prompt-before-update . t))
    :hook (auto-package-update-before-hook . (lambda () (message "I will update packages now"))))
  (leaf key
    :bind (("C-z" . nil))) ; C-z を無効にする
  )

(leaf view
  :init
  (leaf dashboard
    :ensure t
    :init
    (dashboard-setup-startup-hook)
    :config
    (setq dashboard-banner-logo-title (concat "GNU Emacs " emacs-version))
    (setq dashboard-items '((recents  . 20)
                            (bookmarks . 5)
                            (projects . 5)
                            (agenda . 5)
                            (registers . 5)))
    (leaf projectile
      :ensure t
      :global-minor-mode t))
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
    (set-frame-size (selected-frame) 180 80))

  (leaf dimmer
    :ensure t
    :custom ((dimmer-fraction . 0.3))
    :global-minor-mode t)
  (leaf paren
    :custom ((show-paren-delay . 0.1))
    :global-minor-mode show-paren-mode)
  (leaf auto-highlight-symbol
    :ensure t
    :blackout t
    :config
    (ahs-set-idle-interval 0.2)
    :global-minor-mode global-auto-highlight-symbol-mode)
  (leaf highlight-indent-guides
    :ensure t
    :blackout t
    :custom ((highlight-indent-guides-auto-enabled . t)
	     (highlight-indent-guides-responsive . t)
	     (highlight-indent-guides-method . 'column))
    :hook (yaml-mode-hook .  highlight-indent-guides-mode))
  (leaf column-number :global-minor-mode t)
  (leaf display-line-numbers
    :global-minor-mode global-display-line-numbers-mode)

  :custom ((truncate-lines . t)
	   (truncated-partial-width-window-p . 0)
	   )
  )

(leaf tool
  :init
  (leaf anzu
    :ensure t
    :blackout t
    :custom (global-anzu-mode . +1))
  (leaf which-key
    :ensure t
    :blackout t
    :global-minor-mode t
    )
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
  (leaf git
    :init
    (leaf magit :ensure t)
    (leaf git-gutter
      :ensure t
      :blackout t
      :global-minor-mode global-git-gutter-mode))
  (leaf lsp-mode
    :ensure t
    :custom ((lsp-prefer-capf . t)
	     (lsp-keymap-prefix . "C-c l"))
    :hook ((python-mode-hook . lsp)
	   (go-mode-hook . lsp)
	   (web-mode-hook . lsp))
    :init
    (leaf lsp-ui
      :ensure t
      :commands lsp-ui-mode
      :custom
      (lsp-ui-peek-enable . t)
      :config
      (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
      (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
      )
    (leaf which-key-integration
      :init
      (with-eval-after-load 'lsp-mode
	(add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration))
      )
    )
  (leaf ivy
    :ensure t
    :blackout t
    :global-minor-mode t
    :config
    (define-key ivy-minibuffer-map (kbd "TAB") 'ivy-partial)
    (leaf swiper
      :ensure t
      ; :bind (("C-s" . swiper))
      )
    (leaf counsel
      :ensure t
      :blackout t
      :config
      (leaf disable-counsel-find-file
	:config
	(defun my-disable-counsel-find-file (&rest args)
	  (let ((completing-read-function #'completing-read-default)
		(completion-in-region-function #'completion--in-region))
	    (apply #'read-file-name-default args)))
	(setq read-file-name-function #'my-disable-counsel-find-file)
	(define-key counsel-mode-map [remap find-file]  nil))
      :global-minor-mode t)
    )
  (leaf ivy-rich
    :ensure t
    :blackout t
    :after ivy
    :global-minor-mode t)
  )

(leaf modes
  :init
  (leaf lang
    :init
    (leaf go-mode
      :ensure t
      :custom ((gofmt-command . "goimports"))
      :hook ((before-save-hook . gofmt-before-save)
	     (go-mode-hook . (lambda () (setq tab-width 2))))
      )
    (leaf web-mode
      :ensure t
      :mode
      "\\.html??\\'"
      "\\.jsx?\\'"
      "\\.tsx?\\'"
      :custom
      (web-mode-code-indent-offset . 2)
      (web-mode-css-indent-offset . 2)
      (web-mode-enable-auto-indentation . t)
      (web-mode-enable-auto-quoting . nil)
      (web-mode-enable-current-column-highlight . t)
      (web-mode-enable-current-element-highlight . t)
      (web-mode-markup-indent-offset . 2)

      ;; .js を .jsx として開く設定
      ;; TODO: 普通の js も jsx として開いてしまうのでstring:react とかを調べて自動で切り替えられるようにしたい
      (web-mode-content-types-alist . '(("jsx" . "\.jsx?\\'")))
      )
    (leaf elisp
      :init
      (leaf macrostep
	:ensure t
	:bind (("C-c e" . macrostep-expand)))
      )
    )

  (leaf other
    :init
    (leaf markdown-mode
      :ensure t
      :custom ((markdown-command . "markdown")))
    (leaf yaml-mode :ensure t)
    (leaf dockerfile-mode :ensure t)
    (leaf docker-compose-mode :ensure t)
    )
  )

(provide 'init)

;; Local Variables:
;; eval: (leaf-tree-mode t)
;; End:

;;; init.el ends here
