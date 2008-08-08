;; noah tye's .emacs file.

(defvar *emacs-load-start* (current-time))

(require 'cl)

(defvar emacs-root "/home/noah/emacs/")

(labels ((add-path (p)
           (add-to-list 'load-path (concat emacs-root p))))
  (add-path "mmm-mode-0.4.8")
  (add-path "mmm-mako-0.2"))

;; soft word wrap in text modes
(autoload 'longlines-mode
  "longlines" "Minor mode for editing long lines." t)
(add-hook 'text-mode-hook 'longlines-mode)

;; (load-library "mmm-mode")
;; (load-library "mmm-mako")

;; (autoload 'mmm-mode
;;   "mmm-mode" "Minor mode that allows Multiple Major Modes to coexist in one buffer" t)
;; (autoload 'mmm-mako
;;   "mmm-mako" "Edit mako templates with mmm-mode" t)
;; (add-to-list 'auto-mode-alist '("\\.mako\\'" . html-mode))
;; (mmm-add-mode-ext-class 'html-mode "\\.mako\\'" 'mako)
;; (add-to-list 'auto-mode-alist '("\\.mak\\'" . html-mode))
;; (mmm-add-mode-ext-class 'html-mode "\\.mak\\'" 'mako)

(global-set-key (kbd "C-w") 'backward-kill-word)
(global-set-key (kbd "C-x C-k") 'kill-region)
(global-set-key (kbd "C-c C-k") 'kill-region)
(global-set-key (kbd "C-a") 'line-start)
;; only frame operations, ie that interact with the wm, get bound to s- keys.
(global-set-key (kbd "s-n") 'new-frame)

;; maximize text, minimize ui
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

(line-number-mode 1)
(column-number-mode 1)
(show-paren-mode 1)

;; unique buffer names.
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)


(setq-default indent-tabs-mode nil) ; spaces, not tabs

(defconst use-backup-dir t)   
(setq backup-directory-alist (quote ((".*" . "~/backup/")))
      version-control t                ; Use version numbers for backups
      kept-new-versions 16             ; Number of newest versions to keep
      kept-old-versions 2              ; Number of oldest versions to keep
      delete-old-versions t            ; Ask to delete excess backup versions?
      backup-by-copying-when-linked t) ; Copy linked files, don't rename.


;; Always end searches at the beginning of the matching expression.
(add-hook 'isearch-mode-end-hook 'custom-goto-match-beginning)
(defun custom-goto-match-beginning ()
  "Use with isearch hook to end search at first char of match."
  (when isearch-forward (goto-char isearch-other-end)))


(defun line-start ()
  "Go to the beginning of the text on a line; if already there, go to 
   the beginning of the line."
  (interactive)
  (let ((p (point)))
    (beginning-of-line-text)
    (if (= p (point))
	(beginning-of-line))))



(message ".emacs loaded in %ds"
         (destructuring-bind (hi lo ms) (current-time)
           (- (+ hi lo) (+ (first *emacs-load-start*)
                           (second *emacs-load-start*)))))

