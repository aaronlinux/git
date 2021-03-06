;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(when (>= emacs-major-version 24)
    (require 'package)
    (package-initialize)
    (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			     ("melpa" . "http://elpa.emacs-china.org/melpa/"))))
;;包管理初始化。
(package-initialize)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;引入common lisp的语言包，这样就可以使用common lisp的语法了。
(require 'cl)
;;定义安装列表。
(defvar pkgs '(
	       switch-window
	       window-numbering
	       monokai-theme
	       counsel
	       swiper
	       windresize
	       paperless
	       num3-mode
	       company
	       powerline
	       undo-tree
	       markdown-mode
	       w3m
	       smart-mode-line
	       solarized-theme
	       ) "Default packages")
;;把自己定义的安装列表赋给emacs的包管理器来管理。
(setq package-selected-packages pkgs)
;;定义一个函数，判断安装包是否已经被安装。
(defun pkgs-inst-p ()
    (loop for pkg in pkgs
	  when (not (package-installed-p pkg)) do (return nil)
	  finally (return t)))
;;流控制，当软件没有被安装，就逐个安装，并显示正在刷新软件包数据库。
(unless (pkgs-inst-p)
     (message "%s" "正在刷新软件包数据库")
     (package-refresh-contents)
     (dolist (pkg pkgs)
       (when (not (package-installed-p pkg))
	 (package-install pkg))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;关闭工具栏。
(tool-bar-mode -1)
;;设置窗体标题栏文字部分
(setq frame-title-format "%b@liusong")
;;显示时间。
(display-time-mode t)
;;全局语法高亮
(global-hl-line-mode t)
;;设置窗体透明度。
(global-set-key [(f2)] 'loop-alpha)  
(setq alpha-list '((100 100) (95 65) (90 60) (85 55) (80 50) (75 45) (70 40) (65 35)))  
(defun loop-alpha ()  
  (interactive)  
  (let ((h (car alpha-list)))                ;; head value will set to  
    ((lambda (a ab)  
       (set-frame-parameter (selected-frame) 'alpha (list a ab))  
       (add-to-list 'default-frame-alist (cons 'alpha (list a ab)))  
       ) (car h) (car (cdr h)))  
    (setq alpha-list (cdr (append alpha-list (list h))))  
    )  
  )
(set-frame-parameter (selected-frame)  'alpha (list 95 45))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;按24小时的格式显示时间;;执行效率太低，所以禁用了。
(setq-default display-time-24hr-format 1)
;;显示时间和日期;;执行效率太低，所以禁用了
(setq-default display-time-day-and-date t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;关闭滚动条。
(if (display-graphic-p)
    (progn
      (scroll-bar-mode -1)))
;;关闭工具菜单栏。
(menu-bar-mode -1)
;;全局打开行号。
(global-linum-mode t)
;;关闭开始欢迎的页面。
(setq inhibit-splash-screen t)
;;定义快速hack功能。
(defun open-my-init-file()
    (interactive)
    (find-file "~/.emacs"))
;;绑定快速hack的功能键。
(global-set-key (kbd "<f1>") 'open-my-init-file)
(defun open-my-org-file()
    (interactive)
    (find-file "~/.org/工作.org"))
;;绑定快速编辑日程的功能键。
(global-set-key (kbd "<f6>") 'open-my-org-file)
(defun open-my-per-file()
    (interactive)
    (find-file "~/.org/个人.org"))
;;绑定快速编辑日程的功能键。
(global-set-key (kbd "<f7>") 'open-my-per-file)
(defun open-my-macro-file()
    (interactive)
    (find-file "~/.macro"))
;;绑定快速编辑日程的功能键。
(global-set-key (kbd "<f9>") 'open-my-macro-file)
;;全局打开自动补全的功能。
(global-company-mode t)
;;把光标换成竖杠。
(setq-default cursor-type 'bar)
;;载入名为monokai的配色主题。
(load-theme 'monokai t)
;;设置高亮显示当前行。
(global-hl-line-mode t)
;;添加钩子，在emacs-lisp模式下启用show-paren-mode。
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
;;启动时最大化窗口。
(setq initial-frame-alist (quote ((fullscreen . maximized))))
;;关闭自动添加的备份功能。
(setq make-backup-files nil)
;;(require 'smex)
;;(smex-initialize)
;;(global-set-key (kbd "M-x") 'smex)
;;将.emacs目录下的org.org文件设置为个人日程管理的文件，同时使用git版本控制进行管理。
(setq org-agenda-files (list "~/.org/" ))
(cd "~")
;;打开ivy模式。
(ivy-mode t)
;;打开ivy模式下的虚拟缓冲区。
(setq ivy-use-virtual-buffers t)
;;ctrol+s绑定swiper。
(global-set-key "\C-s" 'swiper)
;;绑定ctrol+c ctrol+r为搜索。
(global-set-key (kbd "C-c C-r") 'ivy-resume)
;;绑定M+x为虚拟终端执行命令。
(global-set-key (kbd "M-x") 'counsel-M-x)
;;绑定C+x f为打开文件。
(global-set-key (kbd "C-x f") 'counsel-find-file)
;;绑定ctrol+c a为打开org-mode下的日程功能
(global-set-key (kbd "C-c a") 'org-agenda)
;;打开power-mode模式
(if (display-graphic-p)
  (progn
;;打开powerline模式
    (powerline-center-theme)
;;把中间分隔的地方用箭头来过
    (setq powerline-default-separator 'curve))
;;如果不满足条件，那么执行下边的代码
  (progn
    (setq sml/theme 'light)
    (setq solarized-distinct-fringe-background t)
    (setq sml/no-confirm-load-theme t)
    (sml/setup)
    )

  )
;;打开window-numbering模式。
(window-numbering-mode 1)
;;把新打开的窗口编号，并把编号等效作为他的名称。
(setq window-numbering-assign-func
          (lambda () (when (equal (buffer-name) "*Calculator*") 9)))
;;设置窗口焦点移动的快捷方式，按住shift然后上下左右，就可以在不同的窗口框架中使用。
(windmove-default-keybindings)
;;窗体格式复原和重做的功能C-c,左右。
(winner-mode t)
;;全局启用undo-tree-mode模式
(global-undo-tree-mode 1)
;;绑定M+／键来启动可视化的undo
(global-set-key (kbd "M-/") 'undo-tree-visualize)
;;需要安装switch-window。
(global-set-key (kbd "C-M-Z") 'switch-window)
;;(cd "e:/Work")
(load-file "~/.macro")
(global-set-key (kbd "<mouse-1>") 'mouse-set-point)
(global-set-key (kbd "<down-mouse-1>") 'mouse-drag-region)
(global-set-key (kbd "<mouse-2>") 'mouse-yank-at-click)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-idle-delay 0.05)
 '(company-minimum-prefix-length 1)
 '(custom-safe-themes
   (quote
    ("a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(package-selected-packages
   (quote
    (xwidgete windresize window-numbering w3m undo-tree switch-window solarized-theme smart-mode-line powerline paperless num3-mode monokai-theme markdown-mode counsel company))))
;; 编码设置 begin
(set-language-environment 'Chinese-GB)
;; default-buffer-file-coding-system变量在emacs23.2之后已被废弃，使用buffer-file-coding-system代替
(set-default buffer-file-coding-system 'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(setq file-name-coding-system 'utf-8);;设置文件名编码
(setq path-name-coding-system 'utf-8);;设置目录路径名编码
;(setq-default pathname-coding-system 'euc-cn)
;(setq file-name-coding-system 'euc-cn)
;; 另外建议按下面的先后顺序来设置中文编码识别方式。
;; 重要提示:写在最后一行的，实际上最优先使用; 最前面一行，反而放到最后才识别。
;; utf-16le-with-signature 相当于 Windows 下的 Unicode 编码，这里也可写成
;; utf-16 (utf-16 实际上还细分为 utf-16le, utf-16be, utf-16le-with-signature等多种)
;(prefer-coding-system 'cp950)
;(prefer-coding-system 'gb2312)
;(prefer-coding-system 'cp936)
;(prefer-coding-system 'gb18030)
;(prefer-coding-system 'utf-16le-with-signature)
;(prefer-coding-system 'utf-16)
;; 新建文件使用utf-8-unix方式
;; 如果不写下面两句，只写
(prefer-coding-system 'utf-8)
;; 这一句的话，新建文件以utf-8编码，行末结束符平台相关
;(prefer-coding-system 'utf-8-dos)
;(prefer-coding-system 'utf-8-unix)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "微软雅黑" :foundry "outline" :slant normal :weight normal :height 98 :width normal)))))

