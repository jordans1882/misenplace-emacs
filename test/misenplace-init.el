;;; misenplace-init.el --- misenplace: Initialization for the tests  -*- lexical-binding: t; -*-

;; Copyright (C) 2019 Jordan Schupbach

;; Author: Jordan Schupbach jordans1882@gmail.com>
;; Maintainer: Jordan Schupbach jordans1882@gmail.com>
;; URL: http://github.com/jordans1882/misenplace.el

;; This file is NOT part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;;; Code:

(require 'undercover)
(undercover "misenplace.el")

(defvar misenplace-test/test-path
  (directory-file-name (file-name-directory load-file-name))
  "Path to tests directory.")

(defvar misenplace-test/root-path
  (directory-file-name (file-name-directory misenplace-test/test-path))
  "Path to root directory.")

;; TODO: WHERE CAN WE PUT THIS?
;; (unload-feature 'f 'force)

(load (expand-file-name "misenplace" misenplace-test/root-path) 'noerror 'nomessage)

(require 'ert-async)
(unless (require 'ert nil t)
  (require 'ert (expand-file-name "ert" misenplace-test/vendor-path)))

(provide 'misenplace-init)

;;; misenplace-init.el ends here
