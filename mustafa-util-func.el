;;; Misc. utility functions

(defun m-expand-prog-path (program)
  "Returns full PROGRAM path"
  (if (or (eq system-type 'gnu/linux) (eq system-type 'darwin))
      (let ((path (shell-command-to-string (format "which %s" program))))
	(if (not (= (length path) 0)) (substring path 0 -1)))
    nil)) ; return nothing for windows for now


