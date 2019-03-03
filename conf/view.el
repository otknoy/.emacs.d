(use-package color-theme
  :if window-system
  :config
  (color-theme-initialize)
  (color-theme-clarity)
  )

;;; color setting
(when window-system
  ;; menu, tool and scroll bar are invisible.
  (menu-bar-mode 0)
  (tool-bar-mode 0)
  (scroll-bar-mode 0)
  ;; frame alphan
  (set-frame-parameter nil 'alpha 80))

;;; font settings
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

;; highlight
; line
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
; parenthesis
(show-paren-mode t)
(setq show-paren-delay 0)

(use-package dimmer
  :config
  (setq dimmer-fraction 0.3333)
  (dimmer-mode t)
  )
