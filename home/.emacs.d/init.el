(add-to-list 'load-path "~/.emacs.d/lisp/")

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))

(load-file custom-file)

(require 'init-core)
(require 'init-package)
(require 'init-ui)
(require 'init-evil)
(require 'init-company)

