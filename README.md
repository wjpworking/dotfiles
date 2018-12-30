# idwangmo config

这些是我在工作中使用时一些软件的配置文件，希望各位能在配置这些软件的时候进行参
考。

## zsh

在日常使用中使用 zsh 作为默认的 shell 环境，使用 [oh-my-zsh](http://ohmyz.sh/) 
作为日常的的 zsh 的配置


## vim 配置

这个配置使用了 [LSP](https://github.com/Microsoft/language-server-protocol/) 作
为补全后端，不再使用以前我用的 [YCM](https://valloric.github.io/YouCompleteMe/)
做为补全后端，并重写了一些配置。

## emacs 配置

现在使用`org-mode`作为日常工作中的笔记、GTD 以及日志管理，所以我开始使用起 emacs 来，
在以前我使用过 [Spacemacs](http://spacemacs.org/)，但是目前我在转向使用
[doom-emacs](https://github.com/hlissner/doom-emacs) 来作为日常使用的 emacs 配置。

这其中有两个问题需要进行解决：

1. 在 Linux 下中文字体乱码的问题：

将位于`core/core.el`中的以下两行进行注释后解决：

``` emacs-lisp
(when (fboundp 'set-charset-priority)
  (set-charset-priority 'unicode))     ; pretty
```

2. 使用国内的镜像：

修改文件`core/core-package.el`中的`package-archives`中的相关镜像配置为国内的镜
像配置就行
