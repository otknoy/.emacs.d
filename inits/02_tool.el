(leaf tool
  :config
  (leaf anzu
    :ensure t
    :blackout t
    :custom (global-anzu-mode . +1))
  (leaf which-key
    :ensure t
    :blackout t
    :global-minor-mode t)
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
  (leaf prettier-js
    :ensure t
    :hook (web-mode-hook .  prettier-js-mode))
  (leaf git
    :config
    (leaf magit :ensure t)
    (leaf git-gutter
      :ensure t
      :blackout t
      :global-minor-mode global-git-gutter-mode))
  (leaf google-translate
    :ensure t
    :init
    (leaf popup :ensure t)
    ;; fix search fail ',ttk'
    ;; (see https://github.com/atykhonov/google-translate/issues/52#issuecomment-727920888)
    (with-eval-after-load 'google-translate-tk
      (defun google-translate--search-tkk () "Search TKK." (list 430675 2721866130)))
    :require 'google-translate-smooth-ui
    :bind (("C-c t" . google-translate-smooth-translate))
    :custom
    (google-translate-translation-directions-alist . '(("en" . "ja") ("ja" . "en")))
    )
  (leaf lsp-mode
    :ensure t
    :custom ((lsp-prefer-capf . t)
             (lsp-keymap-prefix . "C-c l"))
    :setq `((gc-cons-threshold . ,(* 512 1024 1024)))
    :hook ((python-mode-hook . lsp)
           (go-mode-hook . lsp)
           (web-mode-hook . lsp)
           (yaml-mode-hook . lsp)
           (dockerfile-mode-hook . lsp))
    :config
    (leaf lsp-ui
      :ensure t
      :commands lsp-ui-mode
      :custom
      (lsp-ui-peek-enable . t)
      (lsp-ui-doc-enable . t)
      (lsp-ui-doc-position . `at-point)
      (lsp-ui-doc-show-with-cursor . t)
      (lsp-ui-doc-show-with-mouse . t)
      :config
      (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
      (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references))
    (leaf which-key-integration
      :config
      (with-eval-after-load 'lsp-mode
        (add-hook 'lsp-mode-hook #'lsp-enable-which-key-integration)))
    )
  (leaf mini-buffer-completion
    :config
    (leaf vertico
      :ensure t
      :global-minor-mode t
      :custom (vertico-count . 20))
    (leaf marginalia
      :ensure t
      :global-minor-mode t)
    (leaf consult :ensure t)
    (leaf orderless
      :ensure t
      :custom ((completion-styles . '(orderless))))
    )
  (leaf dashboard
    :ensure t
    :config
    (dashboard-setup-startup-hook)
    (setq dashboard-banner-logo-title (concat "GNU Emacs " emacs-version))
    (setq dashboard-items '((recents  . 20)
                            (bookmarks . 5)
                            (projects . 20)
                            (agenda . 5)
                            (registers . 5)))
    (leaf projectile
      :ensure t
      :global-minor-mode t))
  (leaf treemacs
    :ensure t)
  )
