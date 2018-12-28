(setq package-archives '(("gnu-cn"   . "http://elpa.emacs-china.org/gnu/")
                         ("melpa-cn" . "http://elpa.emacs-china.org/melpa/")
                         ("org-cn"   . "http://elpa.emacs-china.org/org/")))

;; Initialize packages
(unless (bound-and-true-p package--initialized) 
  (setq package-enable-at-startup nil)
  (package-initialize))

;; Bootstrap `use-package`
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(provide 'init-package)

