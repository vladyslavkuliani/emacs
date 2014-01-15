;;; init.el --- Where all the magic begins

;; This is the first thing to get loaded.

;; inspired by technomancy's emacs starter kit
;; http://github.com/technomancy/emacs-starter-kit/blob/master/init.el

(setq debug-on-error t)
(setq gc-cons-threshold 20000000)
(setq grep-find-command
      (quote ("find . -type f -exec grep -nHi -e   {} \\;" . 34)))

(setq stk/onlinep nil)
(unless
    (condition-case nil
        (delete-process
         (make-network-process
          :name "stk/check-internet"
          :host "elpa.gnu.org"
          :service 80))
      (error t))
  (setq stk/onlinep t))

(global-auto-revert-mode 1)
(show-paren-mode t)

(setq enable-recursive-minibuffers t)

(add-to-list 'load-path "~/emacs/")
(add-to-list 'load-path "~/emacs/init/")

(require 'init-standard-packages)
(require 'init-pkg)
(require 'init-delete-trailing-whitespace)
(require 'init-python)
(require 'init-scala)
(require 'init-js2)
(require 'init-themes)
(require 'init-tramp)
(require 'init-functions)
(require 'init-backup-files)
(require 'init-scrolling)
(require 'init-settings)
(require 'init-gg)

;; "Emacs outshines all other editing software in approximately the
;; same way that the noonday sun does the stars. It is not just bigger
;; and brighter; it simply makes everything else vanish."
;; -Neal Stephenson, "In the Beginning was the Command Line"
