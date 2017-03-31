; To use this file, load it in .emacs:
;
;     (load ~/dotfiles/emacs)
;

;; General behavior

(setq user-emacs-directory "~/dotfiles/emacs")


;; Appearance 

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

(set-face-background 'default "grey9")
(set-face-foreground 'default "grey75")

;(setq-default cursor-type 'bar)
(blink-cursor-mode 't)

(set-face-background 'mode-line "grey15")
(set-face-foreground 'mode-line "#ffffff")

(set-face-background 'mode-line-inactive "#000000")
(set-face-foreground 'mode-line-inactive "#888888")

(set-face-attribute 'mode-line nil :box "grey40")
(set-face-attribute 'mode-line-inactive nil :box 1)

(global-font-lock-mode 1)
(show-paren-mode 1)
(setq show-paren-delay 0)
(global-auto-revert-mode 1)
(global-visual-line-mode 1)

(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)

(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)


; jumpy scrolling sucks.
(setq scroll-step 1
      scroll-conservatively 10000)

(setq
   backup-by-copying t      ; don't clobber symlinks
   backup-directory-alist
    '(("." . "~/.saves"))   ; don't litter my fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups

;; Open all links in a new browser window, and use Google Chrome.
(setq browse-url-browser-function (quote browse-url-generic))
(setq browse-url-generic-program "open")


;; Key bindings ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(global-set-key (kbd "C-x C-k") 'kill-region)
(global-set-key (kbd "C-a") 'noah-beginning-of-line)
(global-set-key (kbd "M-c") 'capitalize-previous-word)
(global-set-key (kbd "C-<return>") 'newline-and-indent)
(global-set-key (kbd "C-z") ctl-x-map) ; dvorak
(global-set-key (kbd "M-z") 'execute-extended-command) ; dvorak
(global-set-key (kbd "C-h") 'backward-delete-char-untabify) ; dvorak
(global-set-key (kbd "C-S-h") 'noah-backward-kill)
(global-set-key (kbd "M-p") 'hippie-expand)

; Okay, so here's some gnarly stuff.  Emacs tends to interpret C-m as
; RET and C-i as TAB, which means we can't just define C-m and C-i, we
; have to translate C-m to H-m and C-i to H-i then bind commands to
; H-m and H-i instead.
;
; solution from http://stackoverflow.com/questions/1792326/how-do-i-bind-a-command-to-c-i-without-changing-tab/11319885#11319885
(define-key input-decode-map (kbd "C-m") (kbd "H-m"))
(global-set-key (kbd "H-m") 'goto-matching-paren)

(global-set-key (kbd "C-?") 'help)

;;;; Navigation commands
(global-set-key (kbd "M-n M-l") 'goto-line)
(global-set-key (kbd "M-n M-s") #'(lambda ()
                                    (interactive)
                                    (switch-to-buffer "*scratch*")))
(global-set-key (kbd "M-n M-b") 'switch-to-buffer)

;;;; git commands
(global-set-key (kbd "M-g M-s") 'magit-status)

;;;; Custom "programmer layout" using right alt key

(defmacro make-insert-function (text)
  `(lambda ()
     (interactive)
     (insert ,text)))

(global-set-key (kbd "A-u") (make-insert-function "["))
(global-set-key (kbd "A-h") (make-insert-function "]"))

(global-set-key (kbd "A-e") (make-insert-function "("))
(global-set-key (kbd "A-t") (make-insert-function ")"))

(global-set-key (kbd "A-o") (make-insert-function "{"))
(global-set-key (kbd "A-n") (make-insert-function "}"))

(global-set-key (kbd "A-a") (make-insert-function "<"))
(global-set-key (kbd "A-s") (make-insert-function ">"))

(global-set-key (kbd "A-'") (make-insert-function "\""))
(global-set-key (kbd "A-/") (make-insert-function "\\"))
(global-set-key (kbd "A-`") (make-insert-function "~"))
(global-set-key (kbd "A-1") (make-insert-function "!"))
(global-set-key (kbd "A-2") (make-insert-function "@"))
(global-set-key (kbd "A-3") (make-insert-function "#"))
(global-set-key (kbd "A-4") (make-insert-function "$"))
(global-set-key (kbd "A-5") (make-insert-function "%"))
(global-set-key (kbd "A-l") (make-insert-function "λ"))

;;;; Symbols

(global-set-key (kbd "A--") (make-insert-function "—"))
(global-set-key (kbd "A-;") (make-insert-function "ö"))
(global-set-key (kbd "A-x") (make-insert-function "×"))
(global-set-key (kbd "A-X") (make-insert-function "÷"))

;(global-set-key (kbd "<") (make-insert-function "‘"))


;; custom commands using right alt key
(global-set-key (kbd "A-d") 'insert-date)
(global-set-key (kbd "A-r") 'newline-and-indent)

(global-set-key (kbd "C-M-z") 'zap-to-char)

;; I never want to background my emacs process, and I often want to
;; return to my notebook's index.
(global-set-key (kbd "C-z C-z")
		(lambda ()
		  (interactive)
		  (find-file "~/notes/Index")))

(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'alt)

;; (add-to-list 'load-path "~/emacs/color-theme-6.6.0/")
;; (add-to-list 'load-path "~/emacs/solarized/")
;; (require 'color-theme)
;; (eval-after-load "color-theme"
;;   '(progn
;;      (color-theme-initialize)
;;      (require 'color-theme-solarized)
;;      (color-theme-solarized-light)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Modes

(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.org/packages/")))

(add-to-list 'load-path "~/dotfiles/emacs")

(package-initialize)
(unless (package-installed-p 'scala-mode2)
  (package-refresh-contents) (package-install 'scala-mode2))

(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(dolist (extension (list "\\.text\\'" "\\.md\\'" "\\.markdown\\'"))
  (add-to-list 'auto-mode-alist (cons extension 'markdown-mode)))

(autoload 'terraform-mode "terraform-mode"
  "Major mode for editing Terraform configuraiton files" t)
(dolist (extension (list "\\.tf\\'"))
  (add-to-list 'auto-mode-alist (cons extension 'terraform-mode)))

(setq terraform-indent-level 4)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Custom functions

(load "projects.el")

(defun noah-beginning-of-line ()
  "Go to beginning of line text.  If already there, go to beginning of line."
  (interactive)
  (let ((init-pos (point)))
    (beginning-of-line-text)
    (if (= (point) init-pos)
	  (beginning-of-line))))

(defun noah-return ()
  (interactive)
  (indent-according-to-mode)
  (newline-and-indent))

(defun backward-word-position ()
  (let ((init-pos (point)))
    (backward-word)
    (let ((r (point)))
      (goto-char init-pos)
      r)))

(defun noah-backward-kill ()
  "Exactly like backward-kill-word, except doesn't kill across line breaks."
  (interactive)
  (let ((init-pos (point))
	(line-begin (line-beginning-position))
	(word-begin (backward-word-position)))
    (if (= (point) line-begin)
	(backward-delete-char 1)
      (if (< word-begin line-begin)
	  (kill-region line-begin init-pos)
	(backward-kill-word 1)))))

(defun insert-date (prefix)
  "Insert the current date."
  (interactive "P")
  (insert (format-time-string "%d %B %Y")))

(defun capitalize-previous-word ()
  (interactive)
  (let ((init-pos (point)))
    (backward-word)
    (capitalize-word 1)
    (goto-char init-pos)))

(defun goto-matching-paren (arg)
  "Go to the matching  if on (){}[], similar to vi style of % "
  (interactive "p")
  ;; first, check for "outside of bracket" positions expected by forward-sexp, etc.
  (cond ((looking-at "[\[\(\{]") (forward-sexp))
        ((looking-back "[\]\)\}]" 1) (backward-sexp))
        ;; now, try to succeed from inside of a bracket
        ((looking-at "[\]\)\}]") (forward-char) (backward-sexp))
        ((looking-back "[\[\(\{]" 1) (backward-char) (forward-sexp))
        (t nil)))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(quack-programs
   (quote
    ("mzscheme" "bigloo" "csi" "csi -hygienic" "gosh" "gracket" "gsi" "gsi ~~/syntax-case.scm -" "guile" "kawa" "mit-scheme" "racket" "racket -il typed/racket" "rs" "scheme" "scheme48" "scsh" "sisc" "stklos" "sxi"))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "grey9" :foreground "grey75" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight light :height 100 :width normal :foundry "nil" :family "Source Code Pro")))))
