; jedi
(require 'jedi)
(setenv "PYTHONPATH" "/Users/otknoy/.pyenv/versions/3.4.3/lib/python3.4/site-packages/")

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

; flymake
(add-hook 'python-mode-hook
          '(lambda ()
             (flymake-mode t)))
(load-library "flymake-cursor.el")
(when (load "flymake" t)
  (defun flymake-pylint-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "pycheckers" (list local-file))))
  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pylint-init)))
