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

(when stk/onlinep
  (package-refresh-contents)
  (cl-loop for p in my-packages
           unless (package-installed-p p)
           do (package-install p)))

(provide 'init-load-packages)