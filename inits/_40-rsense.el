(setq rsense-home (expand-file-name "~/.emacs.d/opt/rsense-0.3"))
(add-to-list 'load-path (concat rsense-home "/etc"))

(require 'rsense)
(setq rsense-rurema-home (concat rsense-home "/refm/"
				   "ruby-refm-1.9.2-dynamic-20110629"))
(setq rsense-rurema-refe "refe-1_9_2")
;; auto-complete
(add-hook 'ruby-mode-hook
	  (lambda ()
	    (add-to-list 'ac-sources 'ac-source-rsense-method)
	    (add-to-list 'ac-sources 'ac-source-rsense-constant)))
