;; coffeescript mode
(require 'coffee-mode)

(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

(add-hook 'coffee-mode-hook 
	  (lambda ()
	    (define-key coffee-mode-map "\C-c\C-c" 'coffee-compile-buffer)
	    (define-key coffee-mode-map "\C-c\C-r" 'coffee-compile-region)
	    (define-key coffee-mode-map "\C-c\M-r" 'coffee-repl)
	    (define-key coffee-mode-map [remap comment-dwim] 'coffee-comment-dwim)
	    (define-key coffee-mode-map "\C-j" 'coffee-newline-and-indent)
	    (define-key coffee-mode-map "\C-c\C-o\C-s" 'coffee-cos-mode)
	    (define-key coffee-mode-map "\C-c\C-w" 'coffee-watch))

(setq coffee-js-mode 'js-mode)
