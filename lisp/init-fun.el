(defun open-file-in-split ()
  (interactive)
  "opens  in a new horizontal split"
  (helm-quit-and-execute-action
   (lambda (file)
     (if (bufferp file)
	 (setq file (buffer-file-name file)))
     (split-window-vertically)
     (windmove-down)
     (find-file file))))

(defun open-file-in-vsplit ()
  (interactive)
  "opens  in a new horizontal split"
  (helm-quit-and-execute-action
   (lambda (file)
     (if (bufferp file)
	 (setq file (buffer-file-name file)))
     (split-window-horizontally)
     (windmove-right)
     (find-file file))))

(defun open-file-in-screen ()
  (interactive)
  "opens  in a new horizontal split"
  (helm-quit-and-execute-action
   (lambda (file)
     (if (bufferp file)
	 (setq file (buffer-file-name file)))
     (elscreen-create)
     (find-file file))))

(defun kill-other-buffers ()
  "Kill all buffers but the current one.
Don't mess with special buffers."
  (interactive)
  (dolist (buffer (buffer-list))
    (unless (or (eql buffer (current-buffer)) (not (buffer-file-name buffer)))
      (kill-buffer buffer))))

(provide 'init-fun)