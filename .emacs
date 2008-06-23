;; noah tye's .emacs file.

(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x C-k") 'kill-region)
(global-set-key (kbd "C-c C-k") 'kill-region)
(global-set-key (kbd "C-a") 'line-start)

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

(defun line-start ()
  "Go to the beginning of the text on a line; if already there, go to 
   the beginning of the line."
  (interactive)
  (let ((p (point)))
    (beginning-of-line-text)
    (if (= p (point))
	(beginning-of-line))))

