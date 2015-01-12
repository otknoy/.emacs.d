(setq ispell-program-name "aspell")
(setq ispell-grep-command "grep")

(eval-after-load "ispell"
  `(add-to-list 'ispell-skip-region-alist `("[^\000-\377]+")))

