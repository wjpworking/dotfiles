;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

(setq-default
 user-full-name 'idwangmo'
 user-mail-address 'idwangmo@gmail.com')
;; font config
(setq doom-font (font-spec :family "Hack" :size 15))

;; company config
(after! company
  (setq company-minimum-prefix-length 2
        company-idle-delay 0.2
        company-show-numbers t)
  (add-hook! 'company-mode-hook 'company-quickhelp-mode))

;; 使用xelatex一步生成PDF，不是org-latex-to-pdf-process这个命令
(setq org-latex-pdf-process
  '(
    "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
    "rm -fr %b.out %b.log %b.tex auto"))

;; 设置默认后端为 `xelatex'
(setq org-latex-compiler "xelatex")

(def-package! company-lsp
  :after company
  :init
  (setq company-transformers nil company-lsp-cache-candidates nil)
  (setq company-lsp-enable-snippet t))

(def-package! vimrc-mode
  :init
  (add-to-list 'auto-mode-alist '("\\.vim\\(rc\\)?\\'" . vimrc-mode)))
