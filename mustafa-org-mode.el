;; Org-mode
(require 'org-agenda)

(setq org-hide-leading-stars t)
(setq org-startup-folded t)
(setq org-time-stamp-custom-formats '("<%m/%d/%y %a>" . "<%m/%d/%y %a %I:%M %p>"))

(setq org-todo-keywords '((sequence "TODO" "PENDING" "|" "DONE" "CANCELED" "DEFERRED")))

(setq org-todo-keyword-faces
      '(("PENDING" . (:foreground "gold" :weight bold))
	("CANCELED" . (:foreground "red" :weight bold))
	("DEFERRED" . (:foreground "purple" :weight bold))))

;; note and timestamp after completing a task
(setq org-log-done 'note)

;; log changes into a drawer
(setq org-log-into-drawer t)

;; find all org files
(add-hook 'org-agenda-mode-hook (lambda ()
				  (setq org-agenda-files
					(split-string (shell-command-to-string
						       "find ~/ilmengine/ -maxdepth 3 -type f -name \"*.org\"")))))