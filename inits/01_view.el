(leaf view
  :config
  (leaf modus-themes
    :ensure t
    :init
    (setq modus-themes-italic-constructs t
          modus-themes-bold-constructs nil
          modus-themes-region '(bg-only no-extend))
    (load-theme 'modus-vivendi :no-confirm)
    )
  (leaf font
    :when (display-graphic-p)
    :config
    (set-face-attribute 'default nil
                        :family "UDEV Gothic NF"
                        :height 130)
    (set-fontset-font
     nil 'japanese-jisx0208
     (font-spec :family "UDEV Gothic NF")))
  (leaf window
    :config
    (menu-bar-mode 0)
    (tool-bar-mode 0)
    (set-frame-parameter nil 'alpha 80)
    (set-frame-size (selected-frame) 180 80)
    (leaf private-desktop
      :if
      (eq system-type 'gnu/linux)
      (string= (system-name) "debian")
      :config
      (set-frame-position nil 2150 590))
    (leaf private-macbook
      :if
      (eq system-type 'darwin)
      (string= (system-name) "MacBook.local")
      :config
      (set-frame-size (selected-frame) 120 60)
      (set-frame-position nil 564 25)))
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
    :hook js-mode-hook yaml-mode-hook)
  (leaf column-number :global-minor-mode t)
  (leaf display-line-numbers
    :global-minor-mode global-display-line-numbers-mode)
  :custom ((truncate-lines . t)
           (truncated-partial-width-window-p . 0))
  )
