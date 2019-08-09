;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

;; font config
(setq doom-font (font-spec :family "Monospace" :size 15))
(setq doom-theme 'doom-solarized-light)

;; company config
(after! company
  (setq company-minimum-prefix-length 2
        company-quickhelp-delay nil
        company-show-numbers t
        company-global-modes '(not comint-mode erc-mode message-mode help-mode gud-mode)
        ))

;; 使用xelatex一步生成PDF，不是org-latex-to-pdf-process这个命令
(setq org-latex-pdf-process
  '(
    "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
    "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
    "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
    "rm -fr %b.out %b.log %b.tex auto"))

;; 设置默认后端为 `xelatex'
(setq org-latex-compiler "xelatex")

(def-package! company-lsp
  :after lsp-mode
  :config
  (setq company-transformers nil company-lsp-cache-candidates nil)
  (set-company-backend! 'lsp-mode 'company-lsp)
  )

(after! python
  (add-hook! python-mode #'lsp)
  )
