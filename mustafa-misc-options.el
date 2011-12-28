;; Misc options, e.g., delete-selection-mode, removing toolbar, etc.

(delete-selection-mode 1)
(tool-bar-mode 0)
;; no menu for linux, but for mac osx ok
(if (eq system-type 'darwin)
    (menu-bar-mode 1)
  (menu-bar-mode 0))
(set-scroll-bar-mode 'right)
(setq inhibit-splash-screen t)

;; Disable auto-save because it's annoying
(setq backup-inhibited t)
(setq auto-save-default nil)

;; less verbose questions
(fset 'yes-or-no-p 'y-or-n-p)

;; Uniquify
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward
      uniquify-separator "|")

(windmove-default-keybindings)

;; Add SCSS files to CSS mode list
(add-to-list 'auto-mode-alist '("\\.scss\\'" . css-mode))

;; On window split, switch to other buffer intsead of opening the same one
(global-set-key "\C-x2" '(lambda () (interactive) 
			     (split-window)
			     (other-window 1)
			     (switch-to-buffer (other-buffer))))

;; initial window size
(add-to-list 'default-frame-alist '(left . 50))
(add-to-list 'default-frame-alist '(top . 75))
(add-to-list 'default-frame-alist '(height . 35))
(add-to-list 'default-frame-alist '(width . 137))


;; tramp ssh config autocompletion
(require 'tramp)
(tramp-set-completion-function "ssh"
			       '((tramp-parse-sconfig "~/.ssh/config")))

