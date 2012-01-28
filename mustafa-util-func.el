;;; Misc. utility functions

(defun m-expand-prog-path (program)
  "Returns full PROGRAM path"
  (if (or (eq system-type 'gnu/linux) (eq system-type 'darwin))
      (let ((path (shell-command-to-string (format "which %s" program))))
	(if (not (= (length path) 0)) (substring path 0 -1)))
    nil)) ; return nothing for windows for now


(defun ido-imenu ()
  "Update the imenu index and then use ido to select a symbol to navigate to."
  (interactive)
  (require 'imenu)
  (imenu--make-index-alist)
  (let ((name-and-pos '())
        (symbol-names '()))
    (flet ((addsymbols (symbol-list)
                       (when (listp symbol-list)
                         (dolist (symbol symbol-list)
                           (let ((name nil) (position nil))
                             (cond
                              ((and (listp symbol) (imenu--subalist-p symbol))
                               (addsymbols symbol))
                              
                              ((listp symbol)
                               (setq name (car symbol))
                               (setq position (cdr symbol)))
                              
                              ((stringp symbol)
                               (setq name symbol)
                               (setq position (get-text-property 1 'org-imenu-marker symbol))))
                             
                             (unless (or (null position) (null name))
                               (add-to-list 'symbol-names name)
                               (add-to-list 'name-and-pos (cons name position))))))))
      (addsymbols imenu--index-alist))
    (let* ((selected-symbol (ido-completing-read "Symbol? " symbol-names))
           (position (cdr (assoc selected-symbol name-and-pos))))
      (goto-char position))))

(defun m-ido-find-tag ()
  (interactive)
  (unless (boundp 'tags-completion-table)
    (call-interactively 'visit-tags-table))
  (tags-completion-table)
  (let (tag-names)
    (mapc (lambda (x)
	    (unless (integerp x)
	      (push (prin1-to-string x t) tag-names)))
	  tags-completion-table)
    (find-tag (ido-completing-read "Tag? " tag-names))))



