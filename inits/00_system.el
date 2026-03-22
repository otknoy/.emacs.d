(leaf system
  :config
  (leaf exec-path-from-shell
    :ensure t
    :config
    (exec-path-from-shell-initialize))
  (leaf delete-selection :global-minor-mode t)
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
  (leaf key-disable
    :bind (("C-z" . nil)))
  (leaf other
    :config
    (setq custom-file (locate-user-emacs-file "custom.el")))
  )
