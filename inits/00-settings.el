;;; coding system
(set-language-environment "Japanese")
(prefer-coding-system 'utf-8)
;; ;; Mac
;; (when (eq system-type 'darwin)
;;   (set-file-name-coding-system 'utf-8-hfs)
;;   (setq locale-cofing-system 'utf-8-hfs))
;; Windows
;; (when (eq system-type 'windows-nt)
;;   (set-file-name-coding-system 'cp932)
;;   (setq locale-cofing-system 'cp932))


(when window-system
  ;; menu, tool and scroll bar are invisible.
  (menu-bar-mode 0)
  (tool-bar-mode 0)
  (scroll-bar-mode 0)
  ;; color theme
  (when (require 'color-theme nil t)
    (color-theme-initialize)
    (color-theme-clarity))
  ;; frame alphan
  (set-frame-parameter nil 'alpha 80))

;;; font
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
;; windows
(when (eq system-type 'windows-nt)
  (set-face-attribute 'default nil
		      :family "Ricty Ascii"
		      :height 130)
  ;; Japanese font
  (set-fontset-font
   nil 'japanese-jisx0208
   (font-spec :family "Meiryo" :size 13)))


(custom-set-variables
 '(read-file-name-completion-ignore-case t))

;; parent-mode
(setq show-paren-delay 0)
(show-paren-mode t)

;; truncate-lines
(setq truncate-lines t)
(setq truncate-partial-width-windows 0)

;; line highlight
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
;; (setq hl-line-face 'underline)
(global-hl-line-mode)


;; word単位をCamelCaseに対応
(add-hook 'c-mode-common-hook 'subword-mode)
(add-hook 'js2-mode-hook 'subword-mode)

;; row and column number
(column-number-mode t)

;; backup and auto-save files locate ~/.emacs.d/backups/
(add-to-list 'backup-directory-alist
	     (cons "." "~/.emacs.d/backups/"))
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "~/.emacs.d/backups/") t)))

;; ファイルが #! から始まる場合、+xをつけて保存する
(add-hook 'after-save-hook
	  'executable-make-buffer-file-executable-if-script-p)

;; ibus
;; (when (require 'ibus nil t)
;;   (add-hook 'after-init-hook 'ibus-mode-on))

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


;;; server start for emacs-client
(require 'server)
(unless (server-running-p)
  (server-start))


;;
(global-auto-revert-mode 1)
