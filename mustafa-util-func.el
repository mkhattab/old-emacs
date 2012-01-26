;;; Misc. utility functions

(defun m-expand-prog-path (program)
  "Returns full PROGRAM path"
  (if (or (eq system-type 'gnu/linux) (eq system-type 'darwin))
      (let ((path (shell-command-to-string (format "which %s" program))))
	(if (not (= (length path) 0)) (substring path 0 -1)))
    nil)) ; return nothing for windows for now


(defun vc-responsible-backend (file)
  "Return the name of a backend system that is responsible for FILE.

If FILE is already registered, return the
backend of FILE.  If FILE is not registered, then the
first backend in `vc-handled-backends' that declares itself
responsible for FILE is returned."
  (or (vc-backend file)
      (catch 'found
	;; First try: find a responsible backend.  If this is for registration,
	;; it must be a backend under which FILE is not yet registered.
	(dolist (backend vc-handled-backends)
	  (and (vc-call-backend backend 'responsible-p file)
	       (throw 'found backend))))
      (error "No VC backend is responsible for %s" file)))
