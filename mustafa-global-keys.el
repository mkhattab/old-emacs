;; all my global key bindings

;; On window split, switch to other buffer intsead of opening the same one
(global-set-key "\C-x2" '(lambda () (interactive) 
			     (split-window)
			     (other-window 1)
			     (switch-to-buffer (other-buffer))))
;; start shell
(global-set-key "\C-x!" '(lambda () (interactive) 
			   (split-window)
			   (other-window 1)
			   (multi-term)))

;;slime close parens at point
(global-set-key "\C-c\C-q" 'slime-close-all-parens-in-sexp)

;; ido-imenu
(global-set-key "\C-x\C-i" 'ido-imenu)

;; ido find tags
(global-set-key "\C-x\C-u" 'm-ido-find-tag)
