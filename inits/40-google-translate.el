(require 'google-translate)
; (global-set-key "\C-ct" 'google-translate-at-point)
(global-set-key "\C-ct" 'google-translate-at-point-auto)
(global-set-key "\C-cT" 'google-translate-query-translate)

;; (custom-set-variables
;;   '(google-translate-default-source-language "en")
;;   '(google-translate-default-target-language "ja"))

(defun set-google-translate-language (source target)
     (custom-set-variables
      '(google-translate-default-source-language source)
      '(google-translate-default-target-language target)
      )
     )

(defun google-translate-at-point-auto (beg end)
  (interactive "r")
  (if (string-match "[^\x01-\x7E]" (buffer-substring-no-properties beg end)) ; region contains 2 byte character
      (set-google-translate-language "ja" "en") 
      (set-google-translate-language "en" "ja")
      )
  (google-translate-at-point)
  )


;;; popwin
(require 'popwin)
; (push '("*Google Translate*" :noselect t :position right :width 80) popwin:special-display-config)
(push '("*Google Translate*" :noselect t) popwin:special-display-config)
