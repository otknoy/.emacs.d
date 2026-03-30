(use-package anzu
  :ensure t
  :blackout t
  :custom
  (global-anzu-mode 1))

(use-package which-key
    :ensure t
    :blackout t
    :config
    (which-key-mode 1))

(use-package flycheck
  :ensure t
  :bind (("M-n" . flycheck-next-error)
         ("M-p" . flycheck-previous-error))
  :config
  (global-flycheck-mode 1))

(use-package company
  :ensure t
  :blackout t
  :demand t
  :bind
  (:map company-active-map
        ("M-n" . nil)
        ("M-p" . nil)
        ("C-s" . company-filter-candidates)
        ("C-n" . company-select-next)
        ("C-p" . company-select-previous)
        ("<tab>" . company-complete-selection))
  (:map company-search-map
        ("C-n" . company-select-next)
        ("C-p" . company-select-previous))
  :custom
  (company-idle-delay 0)
  (company-minimum-prefix-length 1)
  (company-transformers '(company-sort-by-occurrence))
  :config
  (global-company-mode 1))

(use-package prettier-js
  :ensure t
  :hook (web-mode-hook . prettier-js-mode))

;; git
(use-package magit
  :ensure t)
(use-package git-gutter
  :ensure t
  :blackout t
  :config
  (global-git-gutter-mode 1))

(use-package google-translate
  :ensure t
  :init
  (use-package popup :ensure t)
  :bind (("C-c t" . google-translate-smooth-translate))
  :custom
  (google-translate-translation-directions-alist '(("en" . "ja") ("ja" . "en")))
  :config
  (require 'google-translate-smooth-ui)
  ;; fix search fail ',ttk'
  ;; (see https://github.com/atykhonov/google-translate/issues/52#issuecomment-727920888)
  (with-eval-after-load 'google-translate-tk
    (defun google-translate--search-tkk ()
      "Search TKK."
      (list 430675 2721866130))))

;; lsp
(use-package lsp-mode
  :ensure t
  :custom
  (lsp-prefer-capf t)
  (lsp-keymap-prefix "C-c l")
  :hook ((python-mode . lsp)
         (go-mode . lsp)
         (web-mode . lsp)
         (yaml-mode . lsp)
         (dockerfile-mode . lsp))
  :init
  (setq gc-cons-threshold (* 512 1024 1024))
  :config
  (lsp-enable-which-key-integration))
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :custom
  (lsp-ui-peek-enable t)
  (lsp-ui-doc-enable t)
  (lsp-ui-doc-position 'at-point)
  (lsp-ui-doc-show-with-cursor t)
  (lsp-ui-doc-show-with-mouse t)
  :config
  (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references))

;; mini buffer completion
(use-package vertico
  :ensure t
  :custom
  (vertico-count 20)
  :init
  (vertico-mode 1))
(use-package marginalia
  :ensure t
  :init
  (marginalia-mode 1))
(use-package consult
  :ensure t)
(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package dashboard
  :ensure t
  :init
  (setq dashboard-banner-logo-title (concat "GNU Emacs " emacs-version))
  (setq dashboard-items '((recents  . 20)
                          (bookmarks . 5)
                          (projects . 20)
                          (agenda . 5)
                          (registers . 5)))
  :config
  (dashboard-setup-startup-hook))

(use-package projectile
  :ensure t
  :init
  (projectile-mode 1))

(use-package treemacs
  :ensure t)
