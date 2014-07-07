;; Appearance 

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))

(set-face-background 'default "grey9")
(set-face-foreground 'default "grey75")

; Don't anti-alias fonts. Only works on OS X.
(setq ns-antialias-text nil)

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
(setq uniquify-buffer-name-style 'post-forward)
(global-auto-revert-mode 1)
(global-visual-line-mode 1)

(setq indent-tabs-mode nil)

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
(setq browse-url-generic-program "chrome-new-window.sh")


;; Key bindings ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;(global-set-key (kbd "C-w") 'backward-kill-word) ; qwerty
;(global-set-key (kbd "C-c C-m") 'execute-extended-command) ; qwerty
(global-set-key (kbd "C-x C-k") 'kill-region)
(global-set-key (kbd "C-c C-k") 'kill-region)
(global-set-key (kbd "C-a") 'noah-beginning-of-line)
(global-set-key (kbd "M-c") 'capitalize-previous-word)
(global-set-key (kbd "C-<return>") 'newline-and-indent)
(global-set-key (kbd "C-z") ctl-x-map) ; dvorak
(global-set-key (kbd "M-z") 'execute-extended-command) ; dvorak
(global-set-key (kbd "C-h") 'backward-delete-char-untabify) ; dvorak
;(global-set-key (kbd "C-H") 'noah-backward-kill)
(global-set-key (kbd "C-x C-o") 'other-frame)
(global-set-key (kbd "M-g") 'goto-line)
(global-set-key (kbd "M-p") 'hippie-expand)
(global-set-key (kbd "M-m") 'goto-match-paren)
(global-set-key (kbd "C-?") 'help)

;;;; Textmate commands
; (I don't use a typical emacs+OSX keyboard layout, so the built-in
; bindings don't work well for me.)

(global-set-key (kbd "M-<return>") 'textmate-next-line)
;(define-key map [(control c)(control t)] 'textmate-clear-cache)
;(define-key map [(control c)(control a)] 'align)
(global-set-key (kbd "C-<tab>") 'textmate-shift-right)
(global-set-key (kbd "C-S-<tab>") 'textmate-shift-left)
(global-set-key (kbd "M-t") 'textmate-goto-file)
;(global-set-key [(meta shift l)] 'textmate-select-line)
;(global-set-key [(meta shift t)] 'textmate-goto-symbol)

(global-set-key (kbd "<f5>")
	        (lambda ()
		  (interactive)
		  (find-file "~/workspace/twitter/README.md")))

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
(global-set-key (kbd "A-3") (make-insert-function "#"))
(global-set-key (kbd "A-4") (make-insert-function "$"))
(global-set-key (kbd "A-5") (make-insert-function "%"))

;;;; Symbols

(global-set-key (kbd "A--") (make-insert-function "—"))
(global-set-key (kbd "A-;") (make-insert-function "ö"))
(global-set-key (kbd "A-x") (make-insert-function "×"))
(global-set-key (kbd "A-X") (make-insert-function "÷"))
(global-set-key (kbd "A-`") (make-insert-function "✓"))

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
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)

;(add-to-list 'load-path "~/dotfiles/emacs")

; Make emacs' path the same as bash's path.
;(require 'exec-path-from-shell)
;(exec-path-from-shell-initialize)

; Modern Scheme mode featuring Racket support.
;(require 'quack)
; Way easier to type than C-c C-q
;(setq quack-scheme-mode-keymap-prefix "\C-c\C-s")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Custom functions

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

(defun goto-match-paren (arg)
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
 '(quack-programs (quote ("mzscheme" "bigloo" "csi" "csi -hygienic" "gosh" "gracket" "gsi" "gsi ~~/syntax-case.scm -" "guile" "kawa" "mit-scheme" "racket" "racket -il typed/racket" "rs" "scheme" "scheme48" "scsh" "sisc" "stklos" "sxi"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "grey9" :foreground "grey75" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 100 :width normal :foundry "apple" :family "Monaco")))))
