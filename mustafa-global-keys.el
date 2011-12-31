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
			   (shell)))