;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(setq user-full-name "idwangmo"
      user-mail-address "idwangmo@gmail.com")

;; font config
(setq doom-font (font-spec :family "Monospace" :size 17))
(setq doom-theme 'doom-solarized-light)

;; markdown
(remove-hook! 'markdown-mode-hook #'auto-fill-mode)

(def-package! grip-mode
  :bind (:map markdown-mode-command-map
          ("g" . grip-mode)))
