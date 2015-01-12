;; dict file
(setq sdic-eiwa-dictionary-list
      '((sdicf-client "~/.emacs.d/elisp/sdic-2.1.3/gene.sdic")))
(setq sdic-waei-dictionary-list
      '((sdicf-client "~/.emacs.d/elisp/sdic-2.1.3/jedict.sdic")))

(autoload 'sdic-describe-word "sdic" "英単語の意味を調べる" t nil)
(global-set-key "\C-cw" 'sdic-describe-word)
(autoload 'sdic-describe-word-at-point "sdic" "カーソルの位置の英単語の意味を調べる" t nil)
(global-set-key "\C-cW" 'sdic-describe-word-at-point)

;; sdic-display-buffer 書き換え 
(defadvice sdic-display-buffer (around sdic-display-buffer-normalize activate)
  "sdic のバッファ表示を普通にする。"
  (setq ad-return-value (buffer-size))
  (let ((p (or (ad-get-arg 0)
               (point))))
    (and sdic-warning-hidden-entry
         (> p (point-min))
         (message "この前にもエントリがあります。"))
    (goto-char p)
    (display-buffer (get-buffer sdic-buffer-name))
    (set-window-start (get-buffer-window sdic-buffer-name) p)))
(defadvice sdic-other-window (around sdic-other-normalize activate)
  "sdic のバッファ移動を普通にする。"
  (other-window 1))
(defadvice sdic-close-window (around sdic-close-normalize activate)
  "sdic のバッファクローズを普通にする。"
  (bury-buffer sdic-buffer-name))


;;; popwin
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)
(setq popwin:popup-window-position 'bottom)
(push '("*sdic*" :noselect t) popwin:special-display-config)


;;; popwin
;; (add-to-list 'popwin:special-display-config 
;; 	     `("*sdic*"))

;;; tool tip
;; (defun temp-cancel-read-only (function &optional jaspace-off)
;;   "eval temporarily cancel buffer-read-only
;; &optional t is turn of jaspace-mode"
;;   (let ((read-only-p nil)
;;         (jaspace-mode-p nil))
;;     (when (and jaspace-off jaspace-mode)
;;       (jaspace-mode)
;;       (setq jaspace-mode-p t))
;;     (when buffer-read-only
;;       (toggle-read-only)
;;       (setq read-only-p t))
;;     (eval function)
;;     (when read-only-p
;;       (toggle-read-only))
;;     (when jaspace-mode-p
;;       (jaspace-mode))))

;; (defun my-sdic-describe-word-with-popup (word &optional search-function)
;;   "Display the meaning of word."
;;   (interactive
;;    (let ((f (if current-prefix-arg (sdic-select-search-function)))
;;          (w (sdic-read-from-minibuffer)))
;;      (list w f)))
;;   (let ((old-buf (current-buffer))
;;         (dict-data))
;;     (set-buffer (get-buffer-create sdic-buffer-name))
;;     (or (string= mode-name sdic-mode-name) (sdic-mode))
;;     (erase-buffer)
;;     (let ((case-fold-search t)
;;           (sdic-buffer-start-point (point-min)))
;;       (if (prog1 (funcall (or search-function
;;                               (if (string-match "\\cj" word)
;;                                   'sdic-search-waei-dictionary
;;                                 'sdic-search-eiwa-dictionary))
;;                           word)
;;             (set-buffer-modified-p nil)
;;             (setq dict-data (buffer-string))
;;             (set-buffer old-buf))
;;           (temp-cancel-read-only
;;            '(popup-tip dict-data :scroll-bar t :truncate nil))
;;         (message "Can't find word, \"%s\"." word))))
;;   )

;; (defadvice sdic-describe-word-at-point (around sdic-popup-advice activate)
;;   (letf (((symbol-function 'sdic-describe-word) (symbol-function 'my-sdic-describe-word-with-popup)))
;;     ad-do-it))

;; (global-set-key "\C-cp" 'sdic-describe-word-at-point)
