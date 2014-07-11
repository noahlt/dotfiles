(require 'cl)

(defun get-extension (filename)
  (car (last (split-string filename "\\."))))

(defun filename-sans-path (full-path)
  (car (last (split-string full-path "/"))))

(defun recursive-file-listing (path)
  (apply #'append
         (mapcar 
          #'(lambda (file-and-attributes)
              (let ((filename (first file-and-attributes))
                    (is-dir (second file-and-attributes)))
                (cond ((not is-dir)
                       (list filename))
                      ((and is-dir (not (equal "." (substring filename -1))))
                       (recursive-file-listing filename))
                      (t nil))))
          (directory-files-and-attributes path t))))

(setq filenames-to-paths (make-hash-table :test #'equal))

(defun add-dir-to-current-project (dirname)
  (mapc (lambda (filename)
          (puthash (filename-sans-path filename) filename filenames-to-paths))
        (recursive-file-listing dirname)))

(defun hash-keys (hash-table)
  (let (keys)
    (maphash (lambda (k v) (setq keys (cons k keys))) hash-table)
    keys))

(defun filename-to-path ()
  (gethash (ido-completing-read "Switch to file in project: "
                                (hash-keys filenames-to-paths))
           filenames-to-paths))

(defun find-project-file ()
  (interactive)
  (find-file (filename-to-path)))

(defun use-project (label &rest directories)
  (mapc (lambda (path) (add-dir-to-current-project path)) directories))

(use-project "Experimentation"
  "~/workspace/science/src/scala/com/twitter/experiments"
  "~/workspace/science/tests/scala/com/twitter/experiments")

(use-project "Logger"
  "~/logger/")

(global-set-key (kbd "M-n M-p") 'find-project-file)

; So, current status:
;  - to switch projects, eval the use-project clause
;  - when you switch to a project, emacs reloads everything (traverses
;    the project directory tree to find all the project files)
;  - this looks at all files. should only look at non-gitignored files.

; beyond that:
;  - if other people would find this useful, I can split it into its own
;    small package?
;  - how fast is it? should time how long it takes to:
;     - start up
;     - switch projects
;     - get to the ido prompt when nav to new file
;  - show a menu screen with all available projects
