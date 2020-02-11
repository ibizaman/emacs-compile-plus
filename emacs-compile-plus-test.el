;;; emacs-compile-plus-test.el --- Tests for emacs-compile-plus

;; Copyright (C) 2020 Pierre Penninckx

;; Author: Pierre Penninckx <ibizapeanut@gmail.com>

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

;;; Code:

(ert-deftest emacs-compile-plus-buffer-name ()
  "Tests buffer name."
  (should (equal
		   (funcall (emacs-compile-plus/buffer-name "my dir" "my cmd") "whatever mode")
		   "*my dir - my cmd*")))


(provide 'emacs-compile-plus-test)

;;; emacs-compile-plus-test.el ends here
