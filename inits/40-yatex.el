;; yatex http://ballrw.web.fc2.com/tex/install_lion_new.html
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(setq auto-mode-alist
      (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))


;;; tex-command
(cond ((eq system-type 'gnu/linux)     ;; linux
       (setq YaTeX-dvipdf-command "dvipdfmx -f ptex-hiragino.map -f otf-hiragino.map")
       (setq bibtex-command "pbibtex -kanji=utf8")
       (setq dvi2-command "pxdvi -expertmode 4 -watchfile 1"))
      ((eq system-type 'darwin)        ;; Mac OSX
       (setq YaTeX-dvipdf-command "dvipdfmx -f ptex-hiragino.map -f otf-hiragino.map")
       (setq bibtex-command "pbibtex")
       (setq dvi2-command "xdvi -expertmode 4 -watchfile 1"))
      ((eq system-type 'windows-nt)    ;; Windows
       (setq tex-command "platex.exe -kanji=utf8")
       (setq YaTeX-dvipdf-command "dvipdfmx")
       ; (setq YaTeX-dvipdf-command "dvipdfmx -f ptex-ipaex.map -f otf-ipaex.map")
       (setq bibtex-command "pbibtex.exe -kanji=utf8"))
      )

;; old keybind
(setq YaTeX-inhibit-prefix-letter t)

;; kanji-code
(setq YaTeX-kanji-code nil)

;; disable auto new line
(add-hook 'yatex-mode-hook'(lambda () (setq auto-fill-function nil)))

;; popwin-yatex
(require 'popwin-yatex)
(push '("*YaTeX-typesetting*" :noselect t) popwin:special-display-config)

;; Fix to enable using ';' and ':'
(defvaralias 'last-command-char 'last-command-event)
