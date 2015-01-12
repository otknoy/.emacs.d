(require 'text-translator)
; (global-set-key "\C-ct" 'text-translator)
(global-set-key "\C-ct" 'text-translator-translate-by-auto-selection)
(global-set-key "\C-cT" 'text-translator-all)

;; set function that use auto selection
(setq text-translator-auto-selection-func
      'text-translator-translate-by-auto-selection-enja)


;;; popwin
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)
(setq popwin:popup-window-position 'bottom)
; (push '("*translated*" :noselect t :position right :width 80) popwin:special-display-config)
(push '("*translated*" :noselect t) popwin:special-display-config)
