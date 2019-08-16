;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(setq user-full-name "idwangmo"
      user-mail-address "idwangmo@gmail.com")

;; font config
(setq doom-font (font-spec :family "Monospace" :size 17))
(setq doom-theme 'doom-solarized-light)

;; markdown
(def-package! grip-mode
  :bind (:map markdown-mode-command-map
          ("g" . grip-mode)))
