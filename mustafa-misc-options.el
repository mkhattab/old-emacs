;; Misc options, e.g., delete-selection-mode, removing toolbar, etc.


(delete-selection-mode 1)
(tool-bar-mode 0)
<<<<<<< HEAD
;;(menu-bar-mode 0)
=======
(menu-bar-mode 0)
>>>>>>> 13d4c5e4ef31011a557aaa73c5c49b2ac77abc14
(set-scroll-bar-mode 'right)
(setq inhibit-splash-screen t)

;; Disable auto-save because it's annoying
(setq backup-inhibited t)
(setq auto-save-default nil)

;; Uniquify
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward
      uniquify-separator "|")

<<<<<<< HEAD
(windmove-default-keybindings)
=======
(windmove-default-keybindings)

;; Add SCSS files to CSS mode list
(add-to-list 'auto-mode-alist '("\\.scss\\'" . css-mode))

;; On window split, switch to other buffer intsead of opening the same one
(global-set-key "\C-x2" '(lambda () (interactive) 
			     (split-window)
			     (other-window 1)
			     (switch-to-buffer (other-buffer))))
>>>>>>> 13d4c5e4ef31011a557aaa73c5c49b2ac77abc14
