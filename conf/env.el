(use-package exec-path-from-shell
  :config (exec-path-from-shell-initialize))

;;; coding system
; (set-language-environment "Japanese")
(setq dired-default-file-coding-system 'utf-8-unix)
(prefer-coding-system 'utf-8)

;; backup and auto-save files locate ~/.emacs.d/backups/
(add-to-list 'backup-directory-alist
	     (cons "." "~/.emacs.d/backups/"))
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "~/.emacs.d/backups/") t)))

;; ファイルが #! から始まる場合、+xをつけて保存する
(add-hook 'after-save-hook
	  'executable-make-buffer-file-executable-if-script-p)

;; beep off
(setq ring-bell-function 'ignore)

;; (put 'upcase-region 'disabled nil)

;;; other settings
;; Linux
(when (eq system-type 'gnu/linux)
  ;; clipboard share
  (setq x-select-enable-clipboard t))
;; Mac OSX
(when (eq system-type 'darwin)
  ;; window size and position
  (setq initial-frame-alist
	'((width . 86)
	  (height . 50)
	  (top . 24)
	  (left . 720))))

;; auto revert mode
(global-auto-revert-mode 1)

;; C-z を無効にする
(when window-system
  (global-set-key "\C-z" nil))

;;; other
(custom-set-variables
 '(read-file-name-completion-ignore-case t))

;; truncate-lines
(setq truncate-lines t)
(setq truncate-partial-width-windows 0)

;; word単位をCamelCaseに対応
(add-hook 'c-mode-common-hook 'subword-mode)
(add-hook 'js2-mode-hook 'subword-mode)

;; row and column number
(column-number-mode t)
