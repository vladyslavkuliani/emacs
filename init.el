(setq debug-on-error t)
(setq initial-scratch-message nil)

(setq case-fold-search t)

;; package.el

(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))

;;

(defmacro if-bound-call (form &rest args)
  "If FORM is bound as a function, call it with ARGS."
  `(if (fboundp ',form)
       (,form ,@args)))

;;; Turn off decorations - Do this a s soon as possible

(if-bound-call tool-bar-mode -1)
(setq column-number-mode t inhibit-startup-message t)

;;; System detection
(defun windows-nt-p ()
  "Test if running a Windows NT version of emacs."
  (eq system-type 'windows-nt))

(defun cygwin-p ()
  "Test if running a Cygwin version of emacs."
  (eq system-type 'cygwin))

(defun macosx-p ()
  "Test if running a MacOS X version of emacs."
  (eq system-type 'darwin))

;; 

(setq load-path (cons "~/emacs/" load-path))
(load "emacs-contrib")


(when window-system
  (eval-after-load "menu-bar" '(require 'menu-bar+))
  (load-library "color-theme")
  (color-theme-initialize)
  (require 'color-theme-random)

  (tool-bar-mode 0)
  (scroll-bar-mode -1)
  (mouse-wheel-mode 1)
)

(setq visible-bell t)

;;;

(require 'font-lock)
(global-font-lock-mode 1)
(setq font-lock-maximum-decoration t)

;(add-to-list 'default-frame-alist '(font . "fixed"))


;;;

  
(defun tidy-buffer-internal ()
  (shell-command-on-region (point-min) (point-max) "tidy -i"
			   (current-buffer)
			   t
			   )
  )

(fset 'debody
   [?\C-[ ?< ?\C-s ?< ?b ?o ?d ?y ?> ?\C-s ?\C-n ?\C-a ?\C-[ ?< ?\C-x ?\C-x ?\C-w ?\C-s ?< ?/ ?b ?o ?d ?y ?\C-p ?\C-e ?\C-[ ?> ?\C-x ?\C-x ?\C-w return ?\C-x ?\C-s])


(defun tidy-buffer ()
  (interactive)
  (tidy-buffer-internal)
  (execute-kbd-macro 'debody))

;;; key sets


;(global-set-key (kbd "C-x C-b") 'ibuffer)
;(global-set-key (kbd "C-x C-b") 'buffer-menu)

(global-set-key (kbd "<f12>")   'goto-line)

(global-set-key (kbd "C-h") 'backward-delete-char)
(global-set-key (kbd "C-M-h") 'backward-kill-word)

;;; uniquify

(require 'uniquify)
;(setq uniquify-buffer-name-style 'reverse)
;(setq uniquify-buffer-name-style 'forward)
(setq uniquify-buffer-name-style 'post-forward)
;(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;;; shell access

(setq comint-buffer-maximum-size 20000)

;(setq explicit-shell-file-name "bash")
(require 'shell-current-directory)
(global-set-key (kbd "M-s") 'shell-current-directory)
(require 'comint)
(add-to-list 'comint-output-filter-functions 'comint-truncate-buffer)




(add-hook 'text-mode-hook 'turn-on-auto-fill t)

;;; latex

(add-hook 'latex-mode-hook 'turn-on-auto-fill t)
(setq latex-run-command "pdflatex")

;;; asciidoc

(autoload 'doc-mode "doc-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.adoc$" . doc-mode))
(add-hook 'doc-mode-hook
	  '(lambda ()
	     (turn-on-auto-fill)
	     (require 'asciidoc)))

;;; dired

(add-hook 'dired-load-hook
	  (lambda ()
	    (load "dired-x")
	    ;; Set dired-x global variables here.  For example:
	    ;; (setq dired-guess-shell-gnutar "gtar")
	    ;; (setq dired-x-hands-off-my-keys nil)
	    ))
(add-hook 'dired-mode-hook
	  (lambda ()
	    ;; Set dired-x buffer-local variables here.  For example:
					;(dired-omit-mode 1)
	    ))


(setq dired-dwim-target t) 

;;; 

(require 'autorevert)
(global-auto-revert-mode 1)

;;; proxy at work

;; (setq url-proxy-services
;;       '(
;; 	("http"     . "webproxy.ny.jpmorgan.com:8000")
;; 	))


;;; Python

(add-to-list 'auto-mode-alist '("\\.py$" . python-mode))

;;; Lisp

(show-paren-mode t)
(setq show-paren-style 'parenthesis) ; 'mixed)


;;; lisp

;(setq inferior-lisp-program "sbcl")

;; (defun lisp-send-buffer ()
;;   (interactive)
;;   (lisp-eval-region (point-min) (point-max)))

;; (setq debug-on-error t)

;; (global-set-key (kbd "<f5>")   'lisp-send-buffer)

;;; scheme

;(require 'quack)
;(setq quack-run-scheme-always-prompts-p nil)
;(setq quack-default-program "csi")

;;;

;(require 'tabbar) 
;(tabbar-mode 1) 


;;; misc

(fset 'six-windows-emacs-22
   "\C-x1\C-x3\C-x3\C-x+\C-x2\C-xo\C-xo\C-x2\C-xo\C-xo\C-x2")


(fset 'six-windows
   [?\C-[ ?x ?s ?e ?t ?- ?d ?e ?f tab return ?f ?i ?x ?e ?d return ?\C-x ?1 ?\C-x ?3 ?\C-x ?3 ?\C-x ?2 ?\C-x ?o ?\C-x ?o ?\C-x ?2 ?\C-x ?o ?\C-x ?o ?\C-x ?2 ?\C-x ?o ?\C-x ?o ?\C-u ?2 ?3 ?\C-x ?} ?\C-x ?o ?\C-x ?o ?\C-u ?2 ?3 ?\C-x ?} ?\C-x ?o ?\C-x ?o ?\C-u ?2 ?4 ?\C-x ?{])



(defun startup ()
  (interactive)
  (set-default-font "fixed")
  (six-windows))


;;; TRAMP

;(add-to-list 'backup-directory-alist (cons tramp-file-name-regexp nil))

(setq tramp-default-method "ssh")
;(setq tramp-default-method "rsync")






;(require 'vkill)


; http://groups.google.com/group/gnu.emacs.help/browse_thread/thread/b2f12841338f016f#
(defun commify (n &optional comma-char) 


 (unless comma-char (setq comma-char ",")) 

 (with-temp-buffer 
   (insert (format "%s" n)) 
   (while (> (- (point) 
                (line-beginning-position)) 
             (if (>= n 0) 3 4)) 
     (backward-char 3) 
     (insert comma-char) 
     (backward-char 1)) 
   (buffer-string)))


;; ido

(require 'ido)
(ido-mode t)

(setq ido-default-file-method 'selected-window)
(setq ido-default-buffer-method 'selected-window) 

;;; 

(setq ansi-color-for-comint-mode t)

;;; cperl-mode is preferred to perl-mode                                        

(defalias 'perl-mode 'cperl-mode)

;;; prolog

(autoload 'run-prolog "prolog" "Start a Prolog sub-process." t)
(autoload 'prolog-mode "prolog" "Major mode for editing Prolog programs." t)
(autoload 'mercury-mode "prolog" "Major mode for editing Mercury programs." t)
(setq prolog-system 'swi)
(setq auto-mode-alist (append '(("\\.pro$" . prolog-mode)
				("\\.m$" . mercury-mode))
			      auto-mode-alist))

;;; pastie

(setq *pastie-restricted* nil)

(require 'pastie)

;; desktop

(require 'desktop)
(setq desktop-save t)
(setq desktop-dirname "~/.emacs.d/")
(desktop-save-mode 1)
(setq desktop-restore-eager 3)


;;; Customization follows below
(setq history-length 250)
(add-to-list 'desktop-globals-to-save 'file-name-history)

