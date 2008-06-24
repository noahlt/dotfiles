;; noah tye's .emacs file.

(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x C-k") 'kill-region)
(global-set-key (kbd "C-c C-k") 'kill-region)
(global-set-key (kbd "C-a") 'line-start)

;; maximize text, minimize ui
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

(line-number-mode 1)
(column-number-mode 1)

(setq-default indent-tabs-mode nil) ; spaces, not tabs

(defconst use-backup-dir t)   
(setq backup-directory-alist (quote ((".*" . "~/backup/")))
      version-control t                ; Use version numbers for backups
      kept-new-versions 16             ; Number of newest versions to keep
      kept-old-versions 2              ; Number of oldest versions to keep
      delete-old-versions t            ; Ask to delete excess backup versions?
      backup-by-copying-when-linked t) ; Copy linked files, don't rename.


(defun line-start ()
  "Go to the beginning of the text on a line; if already there, go to 
   the beginning of the line."
  (interactive)
  (let ((p (point)))
    (beginning-of-line-text)
    (if (= p (point))
	(beginning-of-line))))

