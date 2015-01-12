(require 'auto-complete-config)
(ac-config-default)

(add-to-list 'ac-dictionary-directories
	     "~/.emacs.d/elisp/auto-complete/ac-dict")
(setq ac-comphist-file "~/.emacs.d/elisp/auto-complete/ac-comphist.dat")

;;; keybind
(setq ac-use-menu-map t)
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)

;;; modes using auto-complete-mode
(add-to-list 'ac-modes 'jde-mode)
(add-to-list 'ac-modes 'processing-mode)

;(global-auto-complete-mode t)

;;; look command
(defun my-ac-look ()
  "look コマンドの出力をリストで返す"
  (interactive)
  (unless (executable-find "look")
    (error "look コマンドがありません"))
  (let ((search-word (thing-at-point 'word)))
    (with-temp-buffer
      (call-process-shell-command "look" nil t 0 search-word)
      (split-string-and-unquote (buffer-string) "\n"))))
(defun ac-complete-look ()
  (interactive)
  (let ((ac-menu-height 50)
        (ac-candidate-limit t))
  (auto-complete '(ac-source-look))))
;; 表示数制限を変更しない場合
;;(defun ac-complete-look ()
;;  (interactive)
;;  (auto-complete '(ac-source-look)))
(defvar ac-source-look
  '((candidates . my-ac-look)
    (requires . 2)))  ;; 2文字以上ある場合にのみ対応させる
;; キーは好きなのを割り当てて下さい
(global-set-key (kbd "M-h") 'ac-complete-look)