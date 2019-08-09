# idwangmo config

这些是我在工作中使用时一些软件的配置文件，希望各位能在配置这些软件的时候进行参考。

**在使用配置的时候尽量使用软链接的方式进行，而不是使用`cp`方式进行，这样可以较好的在同一个地方管理数据**

## zsh

在日常使用中使用 zsh 作为默认的 shell 环境，使用 [oh-my-zsh](http://ohmyz.sh/)
作为日常的的 zsh 的配置


## vim 配置

这个配置使用了 [LSP](https://github.com/Microsoft/language-server-protocol/) 作
为补全后端，不再使用以前我用的 [YCM](https://valloric.github.io/YouCompleteMe/)
做为补全后端，并重写了一些配置。

## 字体

现在因为是中英文一起进行开发，所以使用[更纱黑体](https://github.com/be5invis/Sarasa-Gothic) 作为日常开发使用的字体。

## emacs 配置

现在使用`org-mode`作为日常工作中的笔记、GTD 以及日志管理，所以我开始使用起 emacs 来，
在以前我使用过 [Spacemacs](http://spacemacs.org/)，但是目前我在转向使用
[doom-emacs](https://github.com/hlissner/doom-emacs) 来作为日常使用的 emacs 配置。

这其中有两个问题需要进行解决：

1. 在 Linux 下中文字体乱码的问题：

将位于`core/core.el`中的以下两行进行注释后解决：

``` lisp
(when (fboundp 'set-charset-priority)
  (set-charset-priority 'unicode))
```

2. 使用国内的镜像：

修改文件`core/core-package.el`中的`package-archives`中的相关镜像配置为国内的镜
像配置就行

``` lisp
`(("gnu"   . "http://elpa.emacs-china.org/gnu/")
  ("melpa" . "http://elpa.emacs-china.org/melpa/")
  ("org"   . "http://elpa.emacs-china.org/org/"))
```

3. 解决使用`all-the-icons-font`文件为空的情况：
    1. 到 [all-the-icons.el](https://github.com/domtronn/all-the-icons.el) 中将项目
     下载下来
    2. 将其`fonts`文件夹下到文件拷贝到`~/.local/share/fonts`文件夹下面
    3. 执行`fc-cache -f -v`刷新字体缓存

## 工具集

* 使用 [exa](https://github.com/ogham/exa) 替换原有的`ls`命令
* 使用 [bat](https://github.com/sharkdp/bat) 替换原有的`cat`命令

