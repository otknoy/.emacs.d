;;; "C-t" でウィンドウ切り替え
;; (defun other-window-or-split ()
;;   (interactive)
;;   (when (one-window-p)
;;     (cond ((>= (window-width) 90) (split-window-horizontally))
;; 	  (t (split-window-vertically))))
;;   (other-window 1))
;; (global-set-key (kbd "C-t") 'other-window-or-split)
; (define-key global-map (kbd "C-t") 'other-window)

(when window-system
  (global-set-key "\C-z" nil))

