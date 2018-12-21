(use-package js2-mode
  :mode (("\\.js$" . js2-mode))
  :config
  (progn 
    (add-hook 'js2-mode-hook
	      '(lambda ()
		 (add-to-list 'ac-dictionary-files "~/.emacs.d/elisp/auto-complete/ac-dict/javascript-mode")
		 (setq js2-basic-offset 2)
		 ))

    ;;; jsx
    ;; (add-to-list 'auto-mode-alist '("\\.jsx\\'" . js2-jsx-mode))
    ;; (flycheck-add-mode 'javascript-eslint 'js2-jsx-mode)
    ;; (add-hook 'js2-jsx-mode-hook 'flycheck-mode)

    (setq-default indent-tabs-mode nil)
    (setq-default tab-width 2)
    (setq-default js2-basic-offset 2)

    (add-hook 'rjsx-mode-hook
              (lambda ()
                (setq indent-tabs-mode nil)
                (setq js-indent-level 2)
                )
              )
    ))

(use-package web-mode
  :mode (("\\.phtml\\'" . web-mode)
         ("\\.tpl\\.php\\'" . web-mode)
         ("\\.[gj]sp\\'" . web-mode)
         ("\\.as[cp]x\\'" . web-mode)
         ("\\.erb\\'" . web-mode)
         ("\\.mustache\\'" . web-mode)
         ("\\.djhtml\\'" . web-mode)
         ("\\.html?\\'" . web-mode))
  :config
  (progn 
    (setq web-mode-engines-alist
	  '(("php"    . "\\.phtml\\'")
	    ("blade"  . "\\.blade\\.")))

    ;; indentation
    (defun web-mode-hook ()
      "Hooks for Web mode."
      (setq web-mode-markup-indent-offset 2)
      (setq web-mode-css-indent-offset 2)
      (setq web-mode-code-indent-offset 2)
      )
    (add-hook 'web-mode-hook 'web-mode-hook)

    ;; color
    (custom-set-faces
     '(web-mode-doctype-face
       ((t (:foreground "#82AE46"))))                          ; doctype
     '(web-mode-html-tag-face
       ((t (:foreground "#E6B422" :weight bold))))             ; 要素名
     '(web-mode-html-attr-name-face
       ((t (:foreground "#C97586"))))                          ; 属性名など
     '(web-mode-html-attr-value-face
       ((t (:foreground "#82AE46"))))                          ; 属性値
     '(web-mode-comment-face
       ((t (:foreground "#D9333F"))))                          ; コメント
     '(web-mode-server-comment-face
       ((t (:foreground "#D9333F"))))                          ; コメント
     '(web-mode-css-rule-face
       ((t (:foreground "#A0D8EF"))))                          ; cssのタグ
     '(web-mode-css-pseudo-class-face
       ((t (:foreground "#FF7F00"))))                          ; css 疑似クラス
     '(web-mode-css-at-rule-face
       ((t (:foreground "#FF7F00"))))                          ; cssのタグ
     )))
