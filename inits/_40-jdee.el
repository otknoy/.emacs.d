(load "jde")

(setq jde-build-function 'jde-ant-build)
(setq jde-ant-read-target t)
(setq jde-ant-enable-find t)

(setq jde-entering-java-buffer-hook
      (cons '(lambda() (auto-complete-mode t))
	    jde-entering-java-buffer-hook))