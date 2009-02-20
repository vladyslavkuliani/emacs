
;;; asciidoc

(add-to-list 'load-path "~/emacs-contrib/asciidoc-el")
   (autoload 'doc-mode "doc-mode" nil t)
   (add-to-list 'auto-mode-alist '("\\.adoc$" . doc-mode))
   (add-hook 'doc-mode-hook
	  '(lambda ()
	     (turn-on-auto-fill)
	     (require 'asciidoc)))

;;; color-theme

(add-to-list 'load-path "~/emacs-contrib/color-theme-6.6.0")


;;; desktopaid

;(add-to-list 'load-path "~/emacs-contrib/desktopaid-1.0.5")
;(autoload 'dta-hook-up "desktopaid.elc" "Desktop Aid" t)
;(dta-hook-up)



;;; cperl-mode

(add-to-list 'load-path "~/emacs-contrib/cperl-mode")



;;; asciidoc

(add-to-list 'load-path "~/emacs-contrib/asciidoc-el")
   (autoload 'doc-mode "doc-mode" nil t)
   (add-to-list 'auto-mode-alist '("\\.adoc$" . doc-mode))
   (add-hook 'doc-mode-hook
	  '(lambda ()
	     (turn-on-auto-fill)
	     (require 'asciidoc)))

;;; color-theme

(add-to-list 'load-path "~/emacs-contrib/color-theme-6.6.0")


;;; clojure-mode 
;;; http://github.com/technomancy/clojure-mode/tree/master

(if (eq system-type 'windows-nt)
    (progn

      (add-to-list 'load-path "c:/tmp/c/technomancy-clojure-mode")
      (require 'clojure-mode)


      (setq clojure-src-root "c:/tmp/c")
      (clojure-slime-config)

      (autoload 'clojure-mode "clojure-mode" "A major mode for Clojure" t)
      (add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))))

      )
  )




;;; cperl-mode

;; (add-to-list 'load-path "~/emacs-contrib/cperl-mode")

;; (require 'cperl-mode)
;; (defalias 'perl-mode 'cperl-mode)
;; (setq cperl-continued-brace-offset -2
;;       cperl-continued-statement-offset 2
;;       cperl-indent-left-aligned-comments nil
;;       cperl-indent-level 4
;;       cperl-indentation-style "BSD"
;;       cperl-syntaxify-by-font-lock t)
