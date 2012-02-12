;;; Emacs Lisp, including interaction mode, config

(require 'paredit)
(require 'mic-paren)

;; (add-hook 'emacs-lisp-mode-hook (lambda ()
;; 				  (m-paredit-mode-binding emacs-lisp-mode-map)))
;; (add-hook 'lisp-interaction-mode-hook (lambda ()
;; 					(m-paredit-mode-binding lisp-interaction-mode-map)))

(paren-activate)
(add-hook 'emacs-lisp-mode-hook (lambda ()
				  (paren-toggle-matching-quoted-paren 1)
				  (paren-toggle-matching-paired-delimiter 1)))

(add-hook 'lisp-interaction-mode-hook (lambda ()
				  (paren-toggle-matching-quoted-paren 1)
				  (paren-toggle-matching-paired-delimiter 1)))