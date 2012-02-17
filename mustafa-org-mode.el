;; Org-mode

(setq org-hide-leading-stars t)
(setq org-startup-folded nil)
(setq org-time-stamp-custom-formats '("<%m/%d/%y %a>" . "<%m/%d/%y %a %I:%M %p>"))

(setq org-todo-keywords '((sequence "TODO" "PENDING" "|" "DONE" "CANCELED" "DEFERRED")))

(setq org-todo-keyword-faces
      '(("PENDING" . (:foreground "gold" :weight bold))
	("CANCELED" . (:foreground "red" :weight bold))
	("DEFERRED" . (:foreground "purple" :weight bold))))

;; note and timestamp after completing a task
(setq org-log-done 'note)
