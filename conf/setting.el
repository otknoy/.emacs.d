(defun system-setting()
  (use-package exec-path-from-shell
    :config (exec-path-from-shell-initialize))

  ;; coding system
  ;; (set-language-environment "Japanese")
  (setq dired-default-file-coding-system 'utf-8-unix)
  (prefer-coding-system 'utf-8)

  (custom-set-variables
   '(read-file-name-completion-ignore-case t))

  ;; beep off
  (setq ring-bell-function 'ignore)

  ;; ファイルが #! から始まる場合、+xをつけて保存する
  (add-hook 'after-save-hook
	    'executable-make-buffer-file-executable-if-script-p)

  ;; backup and auto-save files locate ~/.emacs.d/backups/
  (add-to-list 'backup-directory-alist
	       (cons "." "~/.emacs.d/backups/"))
  (setq auto-save-file-name-transforms
	`((".*" ,(expand-file-name "~/.emacs.d/backups/") t)))


  ;; other settings
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
  )

(defun view-setting()
  (use-package color-theme
    :if window-system
    :config
    (color-theme-initialize)
    (color-theme-clarity)
    )

  ;; color setting
  (when window-system
    ;; menu, tool and scroll bar are invisible.
    (menu-bar-mode 0)
    (tool-bar-mode 0)
    (scroll-bar-mode 0)
    ;; frame alphan
    (set-frame-parameter nil 'alpha 80))

  ;; font settings
  ;; Mac OSX
  (when (eq system-type 'darwin)
    (set-face-attribute 'default nil
			:family "Ricty"
			:height 135)
    ;; Japanese font
    (set-fontset-font
     nil 'japanese-jisx0208
     (font-spec :family "Ricty")))
  ;; linux
  (when (eq system-type 'gnu/linux)
    (set-face-attribute 'default nil
			:family "Ricty"
			:height 135))

  ;; highlight line
  (defface hlline-face
    '((((class color)
	(background dark))
       (:background "dark slate gray"))
      (((class color)
	(background light))
       (:background ""))
      (t
       ()))
    "*Face used by hl-line.")
  (setq hl-line-face 'hlline-face)
  (global-hl-line-mode)

  ;; highlight parenthesis
  (show-paren-mode t)
  (setq show-paren-delay 0)

  (use-package dimmer
    :config
    (setq dimmer-fraction 0.3)
    (dimmer-mode t)
    )

  ;; truncate-lines
  (setq truncate-lines t)
  (setq truncate-partial-width-windows 0)

  ;; row and column number
  (column-number-mode t)
  )

(system-setting)
(view-setting)
