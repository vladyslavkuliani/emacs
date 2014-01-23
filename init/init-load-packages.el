(setq my-packages
      '(
        elpy
        flx-ido
        flymake-cursor
        gist
        grandshell-theme
        helm
        highlight-symbol
        htmlize
        iedit
        multiple-cursors
        org
        shell-current-directory
        )
      )

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

(when stk/onlinep
  (package-refresh-contents)
  (cl-loop for p in my-packages
           unless (package-installed-p p)
           do (package-install p)))

(provide 'init-load-packages)
