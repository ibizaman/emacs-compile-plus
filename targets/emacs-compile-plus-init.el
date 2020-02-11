;;; emacs-compile-plus-init.el --- bare emacs-compile-plus init

;; Copyright (C) 2020 Pierre Penninckx

;; Author: Pierre Penninckx <ibizapeanut@gmail.com>
;; Maintainer: Pierre Penninckx <ibizapeanut@gmail.com>
;; URL: https://github.com/ibizaman/emacs-compile-pluss

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

;; Bare init file for Makefile's run target.

;;; Code:

(add-to-list 'load-path default-directory)
(mapc #'byte-compile-file '("emacs-compile-plus.el"))
(require 'emacs-compile-plus)

(provide 'emacs-compile-plus-init)

;;; emacs-compile-plus-init.el ends here
