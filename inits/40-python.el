; jedi
(require 'jedi)
(setenv "PYTHONPATH" "/Users/otknoy/.pyenv/versions/3.4.3/lib/python3.4/site-packages/")

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
