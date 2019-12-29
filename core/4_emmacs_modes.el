;;; 4_emmacs_modes.el --- Modes configuration

;;; Commentary:
;; In this section the following packages are loaded:
;; - Anaconda Mode
;; - CSV Mode
;; - Elpy
;; - Emmet Mode
;; - Go Mode
;; - Irony
;; - Js2 Mode
;; - rjsx Mode
;; - Simple HTTPD
;; - Skewer Mode
;; - Specman Mode
;; - Tern Mode

;;; Code:
;; Specman Mode
(use-package specman-mode
  :load-path "~/.emacs.d/specman"
  :mode "\\.e\\'"
  "\\.ecom\\'"
  :config
  (put 'specman-mode 'derived-mode-parent 'prog-mode)
  :hook
  (specman-mode . (lambda () (use-local-map nil)))
  (specman-mode . yas-minor-mode)
  (specman-mode . display-line-numbers-mode)
  :custom-face
  (specman-punctuation-face ((t (:inherit font-lock-keyword-face)))))

;; (add-to-list 'load-path "~/.emacs.d/specman")
;; (put 'specman-mode 'derived-mode-parent 'prog-mode)
;; (load "specman-mode")
;; (add-to-list 'auto-mode-alist '("\\.e\\'" . specman-mode))
;; (add-to-list 'auto-mode-alist '("\\.ecom\\'" . specman-mode))
;; (add-hook 'specman-mode-hook (lambda () (use-local-map nil)))
;; (add-hook 'specman-mode-hook 'yas-minor-mode)
;; (add-hook 'specman-mode-hook 'display-line-numbers-mode)

;; Irony
(use-package irony
  :ensure t
  :hook
  ((c-mode . irony-mode)
   (c++-mode . irony-mode)
   (irony-mode . irony-cdb-autosetup-compile-options)))

;; Csv Mode
(use-package csv-mode
  :ensure t
  :mode
  ("\\.[Cc][Ss][Vv]\\'" . csv-mode))

;; Tern Mode
(use-package tern
  :ensure t
  :after js-mode)

;; Js2 Mode
;; (use-package js2-mode
;;   :ensure t
;;   :mode
;;   ("\\.js\\'" . js2-mode)
;;   ("node" . js2-mode)
;;   :config
;;   (setq js-indent-level 2)
;;   (add-hook 'js2-mode-hook (lambda ()
;;                            (tern-mode)
;;                            (company-mode))))

;; rjsx Mode
(use-package rjsx-mode
  :ensure t
  :mode
  ("\\.js\\'" . rjsx-mode)
  ("node" . rjsx-mode)
  :config
  (setq js-indent-level 2)
  (add-hook 'rjsx-mode-hook (lambda ()
                           (tern-mode)
                           (company-mode))))

;; Anaconda Mode
(use-package anaconda-mode
  :ensure t
  :config
  (pythonic-activate "/home/martaalexis/anaconda3/envs/env")
  :hook
  (python-mode . anaconda-mode))

;; Emmet Mode
(use-package emmet-mode
  :ensure t
  :bind
  ((emmet-expand-line . "C-j"))
  :hook
  (rjsx-mode . emmet-mode)
  (sgml-mode . emmet-mode)
  (css-mode . emmet-mode))

;; ESS
(use-package ess
  :ensure t)

;; Go Mode
(use-package go-mode
  :ensure t)

;; Skewer mode
(use-package skewer-mode
  :ensure t
  :hook
  (rjsx-mode . skewer-mode)
  (js2-mode . skewer-mode)
  (css-mode . skewer-css-mode)
  (mhtml-mode . skewer-html-mode))

;; Simple HTTPD
(use-package simple-httpd
  :ensure t
  :config
  (setq httpd-root "/var/www"))

(provide '4_emmacs_modes)
;;; 4_emmacs_modes.el ends here
