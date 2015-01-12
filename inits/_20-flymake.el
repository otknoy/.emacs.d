(require 'flymake)

;; disable GUI warnings
(setq flymake-gui-warnings-enabled 0)
;; using popup.el, show as tip
(defun my-flymake-display-err-popup.el-for-currentline ()
  "Display a menu with errors/warnings for current line if it has errors and/or warnings."
  (interactive)
  (let* ((line-no (flymake-current-line-no))
	 (line-err-info-list (nth 0 (flymake-find-err-info flymake-err-info line-no)))
	 (menu-data (flymake-make-err-menu-data line-no line-err-info-list)))
    (if menu-data
	(popup-tip (mapconcat '(lambda (e) (nth 0 e))
			      (nth 1 menu-data)
			      "\n")))
    ))
;; color
(set-face-background 'flymake-errline "red4")
(set-face-background 'flymake-warnline "dark slate blue")

;; ruby
;; Invoke ruby with '-c' to get syntax checking
(defun flymake-ruby-init ()
  (let* ((temp-file   (flymake-init-create-temp-buffer-copy
		       'flymake-create-temp-inplace))
	 (local-file  (file-relative-name
		       temp-file
		       (file-name-directory buffer-file-name))))
    (list "ruby" (list "-c" local-file))))
(push '(".+\\.rb$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("Rakefile$" flymake-ruby-init) flymake-allowed-file-name-masks)
(push '("^\\(.*\\):\\([0-9]+\\): \\(.*\\)$" 1 2 nil 3) flymake-err-line-patterns)
;; ruby-mode-hook
(add-hook 'ruby-mode-hook
	  '(lambda ()
	     ;; Don't want flymake mode for ruby regions in rhtml files
	     (if (not (null buffer-file-name)) (flymake-mode))))
