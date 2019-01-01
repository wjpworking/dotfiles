;; emacs 配置文件存放位置
(add-to-list 'load-path "~/.emacs.d/lisp/")

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(load-file custom-file)

;; emacs 核心配置
(require 'init-core)

;; emacs 包管理器的配置
(require 'init-package)

;; emacs 界面的配置
(require 'init-ui)

;; emacs 系统本身设置
(require 'init-evil)
(require 'init-company)
(require 'init-projectile)
(require 'init-lsp)
(require 'init-treeemacs)
(require 'init-pyim)

;; emacs 编程语言配置，因为使用的是 lsp 所以一定要在最后加入
(require 'init-markdown)
(require 'init-java)
(require 'init-reader)
