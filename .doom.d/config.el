;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(setq user-full-name "idwangmo"
      user-mail-address "idwangmo@gmail.com")

;; font config
(setq doom-font (font-spec :family "Sarasa Mono SC" :size 18 :weight 'normal))
(setq doom-theme 'doom-solarized-light)

;; markdown
(def-package! grip-mode
  :hook ((markdown-mode org-mode) . grip-mode))
