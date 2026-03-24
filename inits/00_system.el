(use-package exec-path-from-shell
  :ensure t
  :config
  (exec-path-from-shell-initialize))

(use-package delsel
  :ensure nil
  :config
  (delete-selection-mode t))

(use-package autorevert
  :ensure nil
  :config
  (global-auto-revert-mode 1))

(use-package files
  :ensure nil
  :custom
  (auto-save-timeout 15)
  (auto-save-interval 60)
  (auto-save-file-name-transforms `((".*" ,(locate-user-emacs-file "backup/") t)))
  (backup-directory-alist `((".*" . ,(locate-user-emacs-file "backup"))
                            (,tramp-file-name-regexp . nil)))
  (version-control t)
  (delete-old-versions t)
  (read-file-name-completion-ignore-case t)
  :hook
  (after-save-hook . executable-make-buffer-file-executable-if-script-p))

;; macOS用の初期ディレクトリ設定 (Emacs 27.1以上)
(use-package emacs
  :ensure nil
  :if (and (eq system-type 'darwin)
           (version<= "27.1" emacs-version))
  :custom
  (default-directory "~")
  (command-line-default-directory "~/"))

(use-package tramp
  :ensure nil
  :config
  (setq tramp-password-prompt-regexp
        (concat
         "^.*"
         (regexp-opt
          '("passphrase" "Passphrase"
            "password" "Password"
            "Verification code")
          t)
         ".*:\0? *")))

(use-package auto-package-update
  :ensure t
  :custom
  (auto-package-update-prompt-before-update t)
  :hook
  (auto-package-update-before-hook . (lambda () (message "I will update packages now"))))

(use-package emacs
  :ensure nil
  :bind
  ("C-z" . nil)
  :init
  (setq custom-file (locate-user-emacs-file "custom.el")))
