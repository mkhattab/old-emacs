;;; Workgroups

(require 'workgroups)

;; don't switch to workgroup on load
(setq wg-switch-on-load nil)

;; no morphing/animation
(setq wg-morph-on nil)

;; workgroups file
;; (if (file-exists-p "~/.workgroups")
;;     (wg-load "~/.workgroups"))

;; remap prefix
(setq wg-prefix-key (kbd "C-c w"))

(workgroups-mode 1)