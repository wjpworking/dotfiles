;; Minimal UI
(scroll-bar-mode -1)
(tool-bar-mode   -1)
(tooltip-mode    -1)
(menu-bar-mode   -1)

;; 关闭启动画面的关注页面
(setq inhibit-splash-screen -1)

(add-to-list 'default-frame-alist '(font . "Fira Code 15"))
(add-to-list 'default-frame-alist '(height . 24))
(add-to-list 'default-frame-alist '(width . 80))

;; Fancy titlebar for MacOS
(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark))
(setq ns-use-proxy-icon  nil)
(setq frame-title-format nil)

;; Disable backup files
(setq make-backup-files nil) ; stop creating backup~ files
(setq auto-save-default nil) ; stop creating #autosave# files

;; 关闭警告音
(setq ring-bell-function 'ignore)

;; 修改确认命令
(fset 'yes-or-no-p 'y-or-n-p)

(provide 'init-core)
