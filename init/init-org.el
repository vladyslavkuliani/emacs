
(setq org-path "~/emacs/pkg/org-mode/")

(setq load-path (cons org-path load-path))

(require 'org-install)

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))


; you could add a function to mako-nxhtml-mumamo-mode-hook

(provide 'init-org)