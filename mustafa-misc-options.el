;; Misc options, e.g., delete-selection-mode, removing toolbar, etc.

(delete-selection-mode 1)
(tool-bar-mode 0)
;;(menu-bar-mode 0)
(set-scroll-bar-mode 'right)
(setq inhibit-splash-screen t)

;; Disable auto-save because it's annoying
(setq backup-inhibited t)
(setq auto-save-default nil)