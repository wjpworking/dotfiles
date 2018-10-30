;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; company config
(after! company
  (setq company-minimum-prefix-length 2
        company-idle-delay 0.2
        company-show-numbers t))

(add-hook 'python-mode-hook 'yapf-mode)
