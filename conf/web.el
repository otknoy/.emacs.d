(use-package js
  :mode (("\\.js$" . js-mode))
  :config
  (setq js-indent-level 2)
  )

(use-package typescript-mode
  :mode (("\\.ts$" . typescript-mode))
  :config
  (setq typescript-indent-level 2)
  )

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
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)

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
   )
  )
