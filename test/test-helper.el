;;; test-helper.el --- F: Test helpers  -*- lexical-binding: t; -*-

;; Copyright (C) 2019 Jordan Schupbach

;; Author: Jordan Schupbach <jordans1882@gmail.com>
;; Maintainer: Jordan Schupbach <jordans1882@gmail.com>
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

(defvar misenplace-test/playground-path
  (expand-file-name "playground" misenplace-test/test-path)
  "Path to playground directory.")

(defvar misenplace-test/trash-path
  (expand-file-name "trash" misenplace-test/test-path)
  "Path to trash directory.")

(defmacro with-default-directory (&rest body)
  "Yield BODY with temporary `default-directory'."
  `(let ((default-directory "/default/directory")) ,@body))

(defmacro with-playground (&rest body)
  "Yield BODY in a playground environment.

The paths `misenplace-test/playground-path' and `misenplace-test/trash-path' are
available in BODY.  Both directories will be empty."
  `(let ((default-directory misenplace-test/playground-path))
     (mapc
      (lambda (path)
        (when (file-exists-p path)
          (delete-directory path 'recursive))
        (make-directory path))
      (list misenplace-test/playground-path misenplace-test/trash-path))
     ,@body))

(defun should-exist (filename &optional content)
  "Make sure FILENAME exists.

If CONTENT is specified, if a file, make sure that the file
includes the CONTENT."
  (let ((path (expand-file-name filename misenplace-test/playground-path)))
    (should (file-exists-p path))
    (when content
      (with-temp-buffer
        (if (multibyte-string-p content)
            (insert-file-contents path)
          (set-buffer-multibyte nil)
          (insert-file-contents-literally path))
        (should (string= (buffer-string) content))))))

(defun should-not-exist (filename)
  "Make sure that FILENAME does not exist."
  (let ((path (expand-file-name filename misenplace-test/playground-path)))
    (should-not (file-exists-p path))))

(defun chmod (file mode)
  "Run chmod command on FILE and set MODE."
  (let ((chmod (executable-find "chmod"))
        (args (list mode (misenplace-expand file misenplace-test/playground-path))))
    (apply 'call-process (append (list chmod nil nil nil) args))))

;;; test-helper.el ends here
