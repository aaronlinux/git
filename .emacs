;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(when (>= emacs-major-version 24)
    (require 'package)
    (package-initialize)
    (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			     ("melpa" . "http://elpa.emacs-china.org/melpa/"))))
;;�������ʼ����
(package-initialize)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;����common lisp�����԰��������Ϳ���ʹ��common lisp���﷨�ˡ�
(require 'cl)
;;���尲װ�б�
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
	       markdown-mode) "Default packages")
;;���Լ�����İ�װ�б���emacs�İ�������������
(setq package-selected-packages pkgs)
;;����һ���������жϰ�װ���Ƿ��Ѿ�����װ��
(defun pkgs-inst-p ()
    (loop for pkg in pkgs
	  when (not (package-installed-p pkg)) do (return nil)
	  finally (return t)))
;;�����ƣ������û�б���װ���������װ������ʾ����ˢ����������ݿ⡣
(unless (pkgs-inst-p)
     (message "%s" "����ˢ����������ݿ�")
     (package-refresh-contents)
     (dolist (pkg pkgs)
       (when (not (package-installed-p pkg))
	 (package-install pkg))))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;�رչ�������
(tool-bar-mode -1)
;;��ʾʱ�䡣
(display-time-mode t)
;;���ô���͸���ȡ�
(global-set-key [(f2)] 'loop-alpha)  
(setq alpha-list '((100 100) (95 65) (85 55) (75 45) (65 35)))  
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
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;��24Сʱ�ĸ�ʽ��ʾʱ��;;ִ��Ч��̫�ͣ����Խ����ˡ�
;;(setq-default display-time-24hr-format 1)
;;��ʾʱ�������;;ִ��Ч��̫�ͣ����Խ�����
;;(setq-default display-time-day-and-date t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;�رչ�������
;;(scroll-bar-mode 0)
;;�رչ��߲˵�����
(menu-bar-mode -1)
;;ȫ�ִ��кš�
(global-linum-mode t)
;;�رտ�ʼ��ӭ��ҳ�档
(setq inhibit-splash-screen t)
;;�������hack���ܡ�
(defun open-my-init-file()
    (interactive)
    (find-file "~/.emacs"))
;;�󶨿���hack�Ĺ��ܼ���
(global-set-key (kbd "<f1>") 'open-my-init-file)
(defun open-my-org-file()
    (interactive)
    (find-file "~/.org/����.org"))
;;�󶨿��ٱ༭�ճ̵Ĺ��ܼ���
(global-set-key (kbd "<f7>") 'open-my-org-file)
(defun open-my-per-file()
    (interactive)
    (find-file "~/.org/����.org"))
;;�󶨿��ٱ༭�ճ̵Ĺ��ܼ���
(global-set-key (kbd "<f6>") 'open-my-per-file)
(defun open-my-macro-file()
    (interactive)
    (find-file "~/.macro"))
;;�󶨿��ٱ༭�ճ̵Ĺ��ܼ���
(global-set-key (kbd "<f9>") 'open-my-macro-file)
;;ȫ�ִ��Զ���ȫ�Ĺ��ܡ�
(global-company-mode t)
;;�ѹ�껻�����ܡ�
(setq-default cursor-type 'bar)
;;������Ϊmonokai����ɫ���⡣
(load-theme 'monokai t)
;;���ø�����ʾ��ǰ�С�
(global-hl-line-mode t)
;;��ӹ��ӣ���emacs-lispģʽ������show-paren-mode��
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
;;����ʱ��󻯴��ڡ�
(setq initial-frame-alist (quote ((fullscreen . maximized))))
;;�ر��Զ���ӵı��ݹ��ܡ�
(setq make-backup-files nil)
;;(require 'smex)
;;(smex-initialize)
;;(global-set-key (kbd "M-x") 'smex)
;;��.emacsĿ¼�µ�org.org�ļ�����Ϊ�����ճ̹�����ļ���ͬʱʹ��git�汾���ƽ��й���
(setq org-agenda-files (list "~/.org/" ))
;;��ivyģʽ��
(ivy-mode t)
;;��ivyģʽ�µ����⻺������
(setq ivy-use-virtual-buffers t)
;;ctrol+s��swiper��
(global-set-key "\C-s" 'swiper)
;;��ctrol+c ctrol+rΪ������
(global-set-key (kbd "C-c C-r") 'ivy-resume)
;;��M+xΪ�����ն�ִ�����
(global-set-key (kbd "M-x") 'counsel-M-x)
;;��C+x fΪ���ļ���
(global-set-key (kbd "C-x f") 'counsel-find-file)
;;��ctrol+c aΪ��org-mode�µ��ճ̹���
(global-set-key (kbd "C-c a") 'org-agenda)
;;��power-modeģʽ
;;(powerline-center-theme)
;;���м�ָ��ĵط��ü�ͷ����
;;(setq powerline-default-separator 'bar)
;;��window-numberingģʽ��
(window-numbering-mode 1)
;;���´򿪵Ĵ��ڱ�ţ����ѱ�ŵ�Ч��Ϊ�������ơ�
(setq window-numbering-assign-func
          (lambda () (when (equal (buffer-name) "*Calculator*") 9)))
;;���ô��ڽ����ƶ��Ŀ�ݷ�ʽ����סshiftȻ���������ң��Ϳ����ڲ�ͬ�Ĵ��ڿ����ʹ�á�
(windmove-default-keybindings)
;;�����ʽ��ԭ�������Ĺ���C-c,���ҡ�
(winner-mode t)
;;ȫ������undo-tree-modeģʽ
(global-undo-tree-mode 1)
;;��M+�������������ӻ���undo
(global-set-key (kbd "M-/") 'undo-tree-visualize)
;;��Ҫ��װswitch-window��
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
 '(package-selected-packages
   (quote
    (magit web-mode w3m markdown-mode switch-window window-numbering monokai-theme counsel swiper windresize paperless num3-mode company powerline undo-tree))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "΢���ź�" :foundry "outline" :slant normal :weight normal :height 98 :width normal)))))

