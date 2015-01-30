(autoload 'processing-mode "processing-mode" "Processing mode" t)
(add-to-list 'auto-mode-alist '("\\.pde$" . processing-mode))

;; Mac
(when (eq system-type 'darwin)
  (setq processing-location "/usr/bin/processing-java")
  (setq processing-application-dir "/Applications/Processing.app")
  (setq processing-sketchbook-dir "~/Dropbox/program/Processing"))
;; linux
(when (eq system-type 'gnu/linux)
  (setq processing-location "~/Apps/processing-2.2.1/processing-java")
  (setq processing-application-dir "~/Apps/processing-2.2.1")
  (setq processing-sketchbook-dir "~/Dropbox/program/Processing"))
;; Windows
(when (eq system-type 'windows-nt)
  (setq processing-location "C:/devtool/processing-2.0.3/processing-java.exe")
  (setq processing-application-dir "C:/devtool/processing-2.0.3")
  (setq processing-sketchbook-dir "C:/Users/Otsuka/Dropbox/program/Processing"))
