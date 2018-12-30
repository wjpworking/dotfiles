(add-to-list 'load-path "~/.emacs.d/lisp/")

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(load-file custom-file)

;; emacs 核心配置
(require 'init-core)

;; emacs 包管理器的配置
(require 'init-package)

;; emacs 界面的配置
(require 'init-ui)

;; 其它 emacs 软件包配置
(require 'init-evil)
(require 'init-company)
(require 'init-pyim)
(require 'init-markdown)
(require 'init-lsp)
(require 'init-java)
