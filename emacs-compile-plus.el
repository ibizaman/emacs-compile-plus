;;; emacs-compile-plus --- enhanced compile function

;; Copyright (C) 2020 Pierre Penninckx

;; Author: Pierre Penninckx <ibizapeanut@gmail.com>
;; URL: https://github.com/ibizaman/emacs-compile-plus
;; Version: 0.1.0

;; This file is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published
;; by the Free Software Foundation, either version 3 of the License,
;; or (at your option) any later version.

;; This file is distributed in the hope that it will be useful, but
;; WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
;; General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this file.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; `emacs-compile-plus' replaces the stock `compile' function with an
;; enhanced one.
;;
;; The provided function will ask for a directory to run in and uses a
;; more unique name for the buffer by using the directory name and the
;; actual command that is ran.
;;
;; Requiring this package automatically replaces the `compile'
;; function so no other action is required.

;;; Code:

(require 'compile)

(defun emacs-compile-plus/buffer-name(dir command)
  "Return a function suitable for `compilation-buffer-name-function'.

The returned function concatenates the DIR and COMMAND."
  `(lambda (majormode)
	 (concat "*" ,dir " - " ,command "*")))

(defun emacs-compile-plus/compile(dir command)
  "Compile by explicitly giving the DIR to compile the given COMMAND in and."
  (interactive (list
				(read-directory-name "Directory to compile in: ")
				;; Rest is copied from `compile'.
				(let ((command (eval compile-command)))
				  (if (or compilation-read-command current-prefix-arg)
					  (compilation-read-command command)))))
  (let ((default-directory dir)
		(compilation-buffer-name-function (emacs-compile-plus/buffer-name dir command)))
	(message "CMD:: %s" command)
	(message "DIR:: %s" dir)
	;; Rest is copied from `compile'.
	(message "%s" (funcall compilation-buffer-name-function "my cmd"))
	(unless (equal command (eval compile-command))
	  (setq compile-command command))
	(save-some-buffers (not compilation-ask-about-save)
					   compilation-save-buffers-predicate)
	(setq-default compilation-directory default-directory)
	(compilation-start command nil)))

(advice-add #'compile :override #'emacs-compile-plus/compile)

(provide 'emacs-compile-plus)
;;; emacs-compile-plus.el ends here
