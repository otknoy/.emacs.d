(use-package blackout
  :ensure t)

(use-package emacs
 :custom
 (truncate-lines t)
 (truncated-partial-width-window-p 0)
 :config
 (menu-bar-mode 0)
 (tool-bar-mode 0)
 (column-number-mode t)
 (global-display-line-numbers-mode t))

(use-package modus-themes
 :ensure t
 :init
 (setq modus-themes-italic-constructs t
      modus-themes-bold-constructs nil
      modus-themes-region '(bg-only no-extend))
 :config
 (load-theme 'modus-vivendi :no-confirm))

;; font
(use-package emacs
 :if (display-graphic-p)
 :config
 (set-face-attribute 'default nil
                    :family "UDEV Gothic NF"
                    :height 130)
 (set-fontset-font
  nil 'japanese-jisx0208
  (font-spec :family "UDEV Gothic NF")))

;; window and frame
(use-package frame
  :straight nil
 :config
 (set-frame-parameter nil 'alpha 80)
 (set-frame-size (selected-frame) 180 80)

 ;; for desktop (Debian)
 (when (and (eq system-type 'gnu/linux)
	   (string= (system-name) "debian"))
   (set-frame-position nil 2150 590))

 ;; for private macbook
 (when (and (eq system-type 'darwin)
	   (string= (system-name) "MacBook.local"))
   (set-frame-size (selected-frame) 120 60)
   (set-frame-position nil 564 25)))

(use-package dimmer
 :ensure t
 :custom (dimmer-fraction 0.3)
 :config
 (dimmer-mode t))

(use-package paren
 :custom (show-paren-delay 0.1)
 :config
 (show-paren-mode t))

(use-package auto-highlight-symbol
 :ensure t
 :blackout t
 :config
 (ahs-set-idle-interval 0.2)
 (global-auto-highlight-symbol-mode t))

(use-package indent-bars
  :ensure t
  :hook ((go-mode python-mode yaml-mode json-mode) . indent-bars-mode))
