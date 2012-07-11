;;; Misc options, e.g., delete-selection-mode, removing toolbar, etc.

(delete-selection-mode 1)
(set-scroll-bar-mode 'right)
(scroll-bar-mode 0)
(tool-bar-mode 0)
;; no menu for linux, but for mac osx ok
(if (eq system-type 'darwin)
    (menu-bar-mode 1)
  (menu-bar-mode 0))
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

;; initial window size
(if (eq system-type 'gnu/linux)
    (progn
      (add-to-list 'default-frame-alist '(left . 50))
      (add-to-list 'default-frame-alist '(top . 75))
      (add-to-list 'default-frame-alist '(height . 35))
      (add-to-list 'default-frame-alist '(width . 137)))
  ;; mac os x
  (progn
    (add-to-list 'default-frame-alist '(left . 20))
    (add-to-list 'default-frame-alist '(top . 100))
    (add-to-list 'default-frame-alist '(height . 41))
    (add-to-list 'default-frame-alist '(width . 147))))

;; tramp ssh config autocompletion
(require 'tramp)
(tramp-set-completion-function "ssh"
			       '((tramp-parse-sconfig "~/.ssh/config")))

(if (eq system-type 'gnu/linux)
    (custom-set-faces
     '(default ((t (:inherit nil :stipple nil :background "#181818" :foreground "#e4e4ef" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 98 :width normal :foundry "unknown" :family "Monaco")))))
  ;; mac os x
  (custom-set-faces
   '(default ((t (:inherit nil :stipple nil :background "#181818" :foreground "#e4e4ef" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 146 :width normal :foundry "unknown" :family "Monaco"))))))

;; start emacs server
(server-start)

;;aspell instead of ispell
(setq-default ispell-program-name (m-expand-prog-path "aspell"))

;; homebrew macosx install bin path
(setq exec-path (push "/usr/local/bin" exec-path))

;; disable stupid beep
(setq ring-bell-function '(lambda ()))


;; auto-load auto-revert-tail-mode on log files
(add-to-list 'auto-mode-alist '("\\.log\\'" . auto-revert-tail-mode))

;; cua-selection mode
(cua-selection-mode 1)

;;tex binary path
(setenv "PATH" (concat "/usr/texbin:" (getenv "PATH")))

;;conkeror for default web browser
(setq browse-url-generic-program "conkeror")
(setq browse-url-browser-function 'browse-url-generic)

(fset 'quit-window 'delete-window)
