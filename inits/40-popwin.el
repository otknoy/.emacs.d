(require 'popwin)

(setq display-buffer-function 'popwin:display-buffer)
(setq popwin:popup-window-position 'bottom)
; (push "*Processing Console" popwin:special-display-config)

(push '("*Async Shell Command*") popwin:special-display-config)
(push '("*processing-compilation*") popwin:special-display-config)
