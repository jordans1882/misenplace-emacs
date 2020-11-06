;;; misenplace.el --- A simple vim-style Emacs configuration -*- lexical-binding: t; -*-

;; Copyright (C) 2019 Jordan Schupbach

;; Author: Jordan Schupbach <jordans1882@gmail.com>
;; Keywords: languages
;; Homepage: http://example.com/foo
;; Package-Version 0.0.1
;; Keywords: Emacs, vim, config
;; URL: http://github.com/jordans1882/misenplace.el
;; Package-Requires: ((evil "1.7.0") (use-package "2.2.0"))

;; This file is NOT part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to the
;; Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

;;; Comentary:

;; This package

;;; Code:

;; Package Management
;; Load Cask
(require 'cask "~/.cask/cask.el")
(cask-initialize)

;; Load Pallet
(require 'pallet)
(pallet-mode t)
(add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e")

;; use-package to load and configure packages
(require 'use-package)
(use-package alert
  :commands (alert)
  :init
  (setq alert-default-style 'notifier))
(use-package alarm-clock)
(use-package all-the-icons-ivy-rich
  :ensure t
  :init (all-the-icons-ivy-rich-mode 1))
;; (use-package awesome-tab
;;   :config
;;   (awesome-tab-mode t))
(use-package ivy-rich
  :ensure t
  :init (ivy-rich-mode 1))
;; (use-package auto-complete
;;   :config
;;   (ac-config-default))
(use-package auctex-latexmk
  :config
  (auctex-latexmk-setup))
(use-package all-the-icons)
(use-package ac-rtags)
(use-package ace-jump-mode)
(use-package cask-mode)
(use-package cask-mode)
;; (use-package centaur-tabs
;;    :config
;;    (setq centaur-tabs-style "bar"
;; 	  centaur-tabs-height 32
;; 	  centaur-tabs-set-icons t
;; 	  centaur-tabs-set-modified-marker t
;; 	  centaur-tabs-show-navigation-buttons t
;; 	  centaur-tabs-set-bar 'under
;; 	  x-underline-at-descent-line t)
;;    (centaur-tabs-headline-match)
;;    ;; (setq centaur-tabs-gray-out-icons 'buffer)
;;    ;; (centaur-tabs-enable-buffer-reordering)
;;    ;; (setq centaur-tabs-adjust-buffer-order t)
;;    (centaur-tabs-mode t)
;;    (setq uniquify-separator "/")
;;    (setq uniquify-buffer-name-style 'forward)
;;    (defun centaur-tabs-buffer-groups ()
;;      "`centaur-tabs-buffer-groups' control buffers' group rules.

;;  Group centaur-tabs with mode if buffer is derived from `eshell-mode' `emacs-lisp-mode' `dired-mode' `org-mode' `magit-mode'.
;;  All buffer name start with * will group to \"Emacs\".
;;  Other buffer group by `centaur-tabs-get-group-name' with project name."
;;      (list
;;       (cond
;; 	;; ((not (eq (file-remote-p (buffer-file-name)) nil))
;; 	;; "Remote")
;; 	((or (string-equal "*" (substring (buffer-name) 0 1))
;; 	     (memq major-mode '(magit-process-mode
;; 				magit-status-mode
;; 				magit-diff-mode
;; 				magit-log-mode
;; 				magit-file-mode
;; 				magit-blob-mode
;; 				magit-blame-mode
;; 				)))
;; 	 "Emacs")
;; 	((derived-mode-p 'prog-mode)
;; 	 "Editing")
;; 	((derived-mode-p 'dired-mode)
;; 	 "Dired")
;; 	((memq major-mode '(helpful-mode
;; 			    help-mode))
;; 	 "Help")
;; 	((memq major-mode '(org-mode
;; 			    org-agenda-clockreport-mode
;; 			    org-src-mode
;; 			    org-agenda-mode
;; 			    org-beamer-mode
;; 			    org-indent-mode
;; 			    org-bullets-mode
;; 			    org-cdlatex-mode
;; 			    org-agenda-log-mode
;; 			    diary-mode))
;; 	 "OrgMode")
;; 	(t
;; 	 (centaur-tabs-get-group-name (current-buffer))))))
;;    :hook
;;    (dashboard-mode . centaur-tabs-local-mode)
;;    (term-mode . centaur-tabs-local-mode)
;;    (calendar-mode . centaur-tabs-local-mode)
;;    (org-agenda-mode . centaur-tabs-local-mode)
;;    (helpful-mode . centaur-tabs-local-mode)
;;    :bind
;;    ("C-<prior>" . centaur-tabs-backward)
;;    ("C-<next>" . centaur-tabs-forward)
;;    ("C-c t s" . centaur-tabs-counsel-switch-group)
;;    ("C-c t p" . centaur-tabs-group-by-projectile-project)
;;    ("C-c t g" . centaur-tabs-group-buffer-groups)
;;    (:map evil-normal-state-map
;; 	  ("g t" . centaur-tabs-forward)
;; 	  ("g T" . centaur-tabs-backward)))
(use-package cheatsheet
  :config
  (cheatsheet-add-group 'Common
			'(:key "C-g" :description "Escape out of current command")
			'(:key "C-x C-c" :description "leave Emacs")
			'(:key "C-n" :description "Next line")
			'(:key "C-p" :description "Previous line"))

  (cheatsheet-add-group 'MiseEnPlace-term
			'(:key "M-h" :description "Move left a buffer")
			'(:key "M-l" :description "Move right a buffer")
			'(:key "M-j" :description "Move down a buffer")
			'(:key "M-k" :description "Move down a buffer")
			'(:key "M-s" :description "Split buffer below")
			'(:key "M-v" :description "Split buffer to right")
			'(:key "M-d" :description "Delete current window")
			'(:key "," :description "Global Leader key"))

  (cheatsheet-add-group 'Vim
			'(:key ":q" :description "Quit")
			'(:key ":wq" :description "Write and quit")
			'(:key "Esc" :description "Drop back into normal mode")
			'(:key "i" :description "Drop into insert mode")
			'(:key ":" :description "Jump into menu")
			'(:key "h" :description "Move cursor left")
			'(:key "j" :description "Move cursor down")
			'(:key "k" :description "Move cursor up")
			'(:key "l" :description "Move cursor right")
			'(:key "C-u" :description "Move up half screen")
			'(:key "C-d" :description "Move down half screen")
			'(:key "w" :description "Move forward word")
			'(:key "b" :description "Move forward word")
			'(:key "ciw" :description "Change inner word")
			'(:key "ci(" :description "Change inside parens")
			'(:key "dd" :description "Delete current line")
			'(:key "c0" :description "Change from cursor to beginning of line")
			'(:key "cw" :description "Change from cursor to end of word"))
  (cheatsheet-add-group 'Tmux
			'(:key "C-a c" :description "New screen")
                        '(:key "C-a n" :description "Next screen"))

  (defun cheatsheet-group-get (grp)
    "Get cheatsheet as list of group structs, keeping defining order."
    (list (list :name grp :cheats (cheatsheet--get-group grp))))
  
  
  (defun cheatsheet--format-group-list (grp)
    "Print the whole cheatsheet."
    (let* ((cheatsheet (cheatsheet-group-get grp))
           (formatted-groups (mapcar 'cheatsheet--format-group cheatsheet))
           (formatted-cheatsheet (apply 'concat formatted-groups)))
      formatted-cheatsheet))
  
  (defun cheatsheet-show-group (group)
    "Create buffer and show cheatsheet."
    (interactive)
    (switch-to-buffer-other-window "*cheatsheet*")
    (setq buffer-read-only nil)
    (cheatsheet-mode)
    (erase-buffer)
    (insert (cheatsheet--format-group-list group))
    (setq buffer-read-only t)
    )
  
  (defun counsel-cheatsheets ()
    "Forward to `describe-function'."
    (interactive)
    (ivy-read "Cheatsheats: "
    	  (cheatsheet--cheat-groups)
    	  :action (lambda (x)
    		    (cheatsheet-show-group x))))

  )
(use-package conda
  :ensure t
  :init
  (setq conda-anaconda-home (expand-file-name "~/anaconda3"))
  (setq conda-env-home-directory (expand-file-name "~/anaconda3")))
(use-package command-log-mode)
(use-package company
  :config
  (add-to-list 'auto-mode-alist '("\\.h\\'" . company-mode))
  (add-to-list 'auto-mode-alist '("\\.hpp\\'" . company-mode))
  (add-to-list 'auto-mode-alist '("\\.cpp\\'" . company-mode)))
(use-package company-irony)
(use-package cmake-ide
  :config
  (cmake-ide-setup))
(use-package counsel-projectile
  :config
  (counsel-projectile-mode))
(use-package counsel-org-clock
  :config
  (counsel-projectile-mode))
;; (use-package dimmer)
(use-package dockerfile-mode)
(use-package doom-modeline
      :ensure t
      :hook (after-init . doom-modeline-mode))
(use-package doom-themes
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-one t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
  (doom-themes-treemacs-config)
  
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-set-heading-icons t)
  (setq dashboard-set-file-icons t)
  (setq dashboard-startup-banner "~/git_repos/misenplace-emacs/assets/mise_en_place.png"))
(use-package dumb-jump
  :bind (("M-g o" . dumb-jump-go-other-window)
         ("M-g j" . dumb-jump-go)
         ("M-g b" . dumb-jump-back)
         ("M-g i" . dumb-jump-go-prompt)
         ("M-g x" . dumb-jump-go-prefer-external)
         ("M-g z" . dumb-jump-go-prefer-external-other-window))
  :config (setq dumb-jump-selector 'ivy) ;; (setq dumb-jump-selector 'helm)
  :ensure)
(use-package ein)
(use-package eglot)
(use-package egg-timer)
(use-package elpy
  :ensure t
  :init
  (elpy-enable))
;; (use-package esup ;; Seems to break things on startup...
;;   :ensure t
;;   ;; To use MELPA Stable use ":pin mepla-stable",
;;   :pin melpa
;;   :commands (esup))
(use-package eglot)
(use-package evil
   :config
   (evil-mode 1)
   (setq-default evil-escape-delay 0.05)
   (add-to-list 'evil-normal-state-modes 'ess-r-help-mode)
   (add-to-list 'evil-normal-state-modes 'inferior-ess--mode)
   (add-to-list 'evil-normal-state-modes 'package-menu-mode)
   (add-to-list 'evil-normal-state-modes 'magit-mode)
   (add-to-list 'evil-emacs-state-modes 'Compilation)
   (add-to-list 'evil-emacs-state-modes 'Summary)
   (add-to-list 'evil-emacs-state-modes 'Article)
   (add-to-list 'evil-emacs-state-modes 'DocView)

   ;; Create user keymap (personal leader)
   (defvar my-leader-map (make-sparse-keymap)
     "Keymap for \"leader key\" shortcuts.")

   (define-key my-leader-map "wd" 'evil-window-delete)
   (define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-page-up)
   (define-key evil-normal-state-map (kbd "q") 'evil-delete-buffer)
   (define-key evil-normal-state-map (kbd "Q") 'evil-record-macro)

   (define-key evil-normal-state-map (kbd "H-l") 'evil-window-increase-width)
   (define-key evil-normal-state-map (kbd "H-h") 'evil-window-decrease-width)
   (define-key evil-normal-state-map (kbd "H-j") 'evil-window-increase-height)
   (define-key evil-normal-state-map (kbd "H-k") 'evil-window-decrease-height)

   ;; TODO: find another binding for evil comment or some other binding to finish git commits
   ;; (i.e with-editor-finish)
   ;; (define-key evil-normal-state-map (kbd "C-c C-c") 'evilnc-comment-or-uncomment-lines)
   ;; binding "," to the keymap
   (define-key evil-normal-state-map "," my-leader-map)
   (define-key evil-normal-state-map (kbd "/") 'swiper)
   (define-key evil-normal-state-map (kbd "?") 'swiper-backward)

   ;; Manually add in my-leader-map bindings to states
   (define-key compilation-mode-map "," my-leader-map)

   ;; (define-key inferior-ess-mode-map "," my-leader-map)
   ;; (evil-define-key 'normal evil-normal-state-map "," 'my-leader-map)

   )
(use-package evil-snipe
  :config
  (evil-snipe-mode +1)
  (evil-snipe-override-mode +1))
(use-package evil-nerd-commenter)
(use-package ess
  :config
  ;; (require 'ess-site) ;; load ESS prolly delete this line
  (setq ess-use-flymake nil) ;; disable Flymake

  (add-hook 'ess-mode-hook '(lambda () (define-key ess-mode-map (kbd "M-<RET>") 'ess-eval-region-or-line-visibly-and-step)))
  (add-hook 'ess-mode-hook '(lambda () (define-key ess-mode-map (kbd "C-S-<RET>") 'ess-eval-region-or-function-or-paragraph-and-step)))
  ;;(eval-after-load 'ess
  ;;                  '(define-key evil-visual-state-map (kbd "<C-return>") 'ess-eval-region-or-line-visibly-and-step)

  ;;  (defun ess-eval-structure (&optional vis)
  ;;    "Send the current line to the inferior ESS process.
  ;;  VIS has same meaning as for `ess-eval-region'."
  ;;    (interactive "P")
  ;;    (let* ((beg (point-at-bol))
  ;;           (end (point-at-eol))
  ;;     (cmd (buffer-substring beg end))
  ;;           (msg (format "Structure for: %s" cmd))
  ;;    )
  ;;    (ess-send-string (ess-get-process) (concat (concat "str(" cmd) ")" ) t))
  ;;  )


  ;;   (defun ess-eval-structure (&optional vis)
  ;;     "Send the current line to the inferior ESS process.
  ;;   VIS has same meaning as for `ess-eval-region'."
  ;;     (interactive "P")
  ;;     (let* ((beg (point-at-bol))
  ;;            (end (point-at-eol))
  ;;      (cmd (thing-at-point 'word 'no-properties))
  ;;            (msg (format "Structure for: %s" cmd))
  ;;     )
  ;;     (ess-send-string (ess-get-process) (concat (concat "str(" cmd) ")" ) t))
  ;;   )
  ;;
  ;;
  ;;   )


  )
(use-package flycheck
  :config
  (global-flycheck-mode t)
)
(use-package git-gutter
  :config
  ;; If you enable global minor mode
  (global-git-gutter-mode t)

  ;; If you would like to use git-gutter.el and linum-mode
  ;;(git-gutter:linum-setup)
  )
(use-package git-auto-commit-mode
  config:
  (setq gac-automatically-push-p "t")
  )
(use-package ivy
  :config
  (ivy-mode 1)
  )
(use-package ivy-rtags)
(use-package irony
  config:
    (add-hook 'c++-mode-hook 'irony-mode)
    (add-hook 'c-mode-hook 'irony-mode)
    (add-hook 'objc-mode-hook 'irony-mode)
    (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options))

(use-package lorem-ipsum)
;; (use-package lsp-mode
;;   ;; set prefix for lsp-command-keymap (few alternatives - "C-l", "C-c l")
;;   :init (setq lsp-keymap-prefix "H-l")
;;   :hook (;; replace XXX-mode with concrete major-mode(e. g. python-mode)
;;          (c++-mode . lsp)
;;          (bash-mode . lsp)
;;          (sh-mode . lsp)
;;          (ess-mode . lsp)
;;          (python-mode . lsp)
;;          (R-mode . lsp)
;;          (ess-r-mode . lsp)
;;          ;; if you want which-key integration
;;          (lsp-mode . lsp-enable-which-key-integration))
;;   :commands lsp
;;   :config
;;     (add-to-list 'lsp-enabled-clients 'languageserver)
;;   )
;; (use-package lsp-ui
;;   :init (setq lsp-ui-doc-delay 2.00)
;;   :commands lsp-ui-mode)
;; (use-package lsp-jedi
;;   :ensure t
;;   :config
;;   (with-eval-after-load "lsp-mode"
;;     (add-to-list 'lsp-disabled-clients 'pyls)
;;     (add-to-list 'lsp-enabled-clients 'jedi)))
(use-package helm-ag
  :config
  (custom-set-variables
 '(helm-ag-base-command "rg --no-heading")
 `(helm-ag-success-exit-status '(0 2))))
(use-package helm-swoop)
(use-package company-lsp :commands company-lsp)
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
(use-package lsp-latex
  :commands
  (with-eval-after-load "tex-mode"
    (add-hook 'tex-mode-hook 'lsp)
    (add-hook 'latex-mode-hook 'lsp)
    (add-hook 'LaTeX-mode-hook 'lsp))

  ;; For YaTeX
  (with-eval-after-load "yatex"
    (add-hook 'yatex-mode-hook 'lsp))

  ;; For bibtex
  (with-eval-after-load "bibtex"
    (add-hook 'bibtex-mode-hook 'lsp)))
(use-package lsp-treemacs :commands lsp-treemacs-errors-list)
(use-package dap-mode)
(use-package mpc)
(use-package mu4e)
(use-package nyan-mode
  :config
  (nyan-mode 1))
(use-package ob-mermaid
  :config
  (setq ob-mermaid-cli-path "~/mermaid/node_modules/.bin/mmdc"))
(use-package org
  :config
   (setq org-latex-pdf-process
 	'("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
 	"bibtex %b"
 	"pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
 	"pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f")
        )

;;  (setq org-latex-pdf-process
;;	'("xelatex --shell-escape %f"
;;	"bibtex %b"
;;        "xelatex --shell-escape %f"
;;        "xelatex --shell-escape %f"))
  (setq org-confirm-babel-evaluate nil)
  (setq org-latex-image-default-width "")
  (org-babel-do-load-languages
    'org-babel-load-languages
    '((emacs-lisp . nil)
      (shell . t)
      (python . t)
      (R . t)))

(setq org-latex-classes
  '(("article"
     "\\documentclass[11pt]{article}"
     ("\\section{%s}" . "\\section*{%s}")
     ("\\subsection{%s}" . "\\subsection*{%s}")
     ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
     ("\\paragraph{%s}" . "\\paragraph*{%s}")
     ("\\subparagraph{%s}" . "\\subparagraph*{%s}"))
    ("report"
     "\\documentclass[11pt]{report}"
     ("\\part{%s}" . "\\part*{%s}")
     ("\\chapter{%s}" . "\\chapter*{%s}")
     ("\\section{%s}" . "\\section*{%s}")
     ("\\subsection{%s}" . "\\subsection*{%s}")
     ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
    ("book"
     "\\documentclass[11pt]{book}"
     ("\\part{%s}" . "\\part*{%s}")
     ("\\chapter{%s}" . "\\chapter*{%s}")
     ("\\section{%s}" . "\\section*{%s}")
     ("\\subsection{%s}" . "\\subsection*{%s}")
     ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
    ("beamer"
      "\\documentclass\[presentation\]\{beamer\}"
      ("\\section\{%s\}" . "\\section*\{%s\}")
      ("\\subsection\{%s\}" . "\\subsection*\{%s\}")
      ("\\subsubsection\{%s\}" . "\\subsubsection*\{%s\}"))))

  (setq org-latex-listings t)
;;   (add-to-list 'org-latex-classes
;;              '("book"
;;                "\\documentclass{book}"
;;                ("\\part{%s}" . "\\part*{%s}")
;;                ("\\chapter{%s}" . "\\chapter*{%s}")
;;                ("\\section{%s}" . "\\section*{%s}")
;;                ("\\subsection{%s}" . "\\subsection*{%s}")
;;                ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
;;              )
  (add-to-list 'org-latex-classes
             '("IEEEtran"
               "\\documentclass{IEEEtran}"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\subsubsection{%s}" . "\\subsubsection*{%s}"))
             )

  )
(use-package ox-reveal
  :config
  (setq org-reveal-root "file:///home/jordan/git_repos/reveal.js/"))
(use-package ox-latex
  :config
  (add-to-list 'org-latex-packages-alist '("" "minted"))
  (setq org-latex-listings 'minted)
  (setq org-latex-pdf-process
      '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
        "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f")))
(use-package org-ref
  :init
  (setq org-ref-completion-library 'org-ref-ivy-cite)
  :config
  (setq reftex-default-bibliography '("~/git_repos/phd_comps2/js_phd_comp.bib"))

  ;; see org-ref for use of these variables
  (setq org-ref-bibliography-notes "~/Dropbox/bibliography/notes.org"
     org-ref-default-bibliography '("~/git_repos/phd_comps2/js_phd_comp.bib")
     org-ref-pdf-directory "~/Dropbox/bibliography/bibtex-pdfs/")

  )
(use-package org-bullets
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  )
(use-package org-pomodoro)
(use-package org-projectile
  :bind (("C-c n p" . org-projectile-project-todo-completing-read)
         ("C-c c" . org-capture))
  :config
  (progn
    (org-projectile-per-project)
    (setq org-projectile-per-project-filepath "todo.org")
    (setq org-agenda-files (append org-agenda-files (org-projectile-todo-files)))
    (global-set-key (kbd "C-c c") 'org-capture)
    (global-set-key (kbd "C-c n p") 'org-projectile-project-todo-completing-read)))
(use-package polymode
  :ensure t)
(use-package poly-markdown
  :ensure t)
(use-package poly-R
  :ensure t)
(use-package poly-org
  :ensure t)
(use-package pyvenv)
(use-package prescient
  :config
  (prescient-persist-mode)
  )
(use-package ranger
  :config
  (ranger-override-dired-mode t)
  (setq ranger-cleanup-eagerly t))
(use-package ivy-prescient
  :config
  (ivy-prescient-mode)
  )
(use-package projectile
  :config
  (projectile-mode)
  (setq projectile-completion-system 'ivy)
  (defun projectile-test-suffix (project-type)
    "Find default test files suffix based on PROJECT-TYPE."
    (cond
     ((member project-type '(rails-rspec ruby-rspec)) "_spec")
     ((member project-type '(rails-test ruby-test lein-test go)) "_test")
     ((member project-type '(r)) "_test")
     ((member project-type '(scons)) "test")
     ((member project-type '(maven symfony)) "Test")
     ((member project-type '(gradle grails)) "Spec")))

  )
(use-package pdf-tools
  :config
  (evil-make-overriding-map pdf-view-mode-map 'normal)

  (evil-define-key 'normal pdf-view-mode-map
  "h" 'image-backward-hscroll
  "j" (lambda () (interactive) (pdf-view-next-line-or-next-page 5))
  "k" (lambda () (interactive) (pdf-view-previous-line-or-previous-page 5))
  "l" 'image-forward-hscroll
  "G" 'pdf-view-last-page)
  ;; (define-key pdf-view-mode-map (kbd "C-w C-w") 'evil-window-next)
  ;; Why these no work?
  ;; (define-key pdf-view-mode-map (kbd "g g") 'pdf-view-first-page)
  ;; (define-key pdf-view-mode-map "G" 'pdf-view-last-page)
  ;; (define-key pdf-view-mode-map "j" 'pdf-view-next-line-or-next-page)
  ;; (define-key pdf-view-mode-map "k" 'pdf-view-previous-line-or-previous-page)
  ;; (define-key pdf-view-mode-map "h" 'image-backward-hscroll)
  ;; (define-key pdf-view-mode-map "l" 'image-forward-hscroll)

  (define-key doc-view-mode-map (kbd "j") 'doc-view-next-line-or-next-page)
  (define-key doc-view-mode-map (kbd "k") 'doc-view-previous-line-or-previous-page)
  (define-key doc-view-mode-map (kbd "h") 'image-backward-hscroll)
  (define-key doc-view-mode-map (kbd "l") 'image-forward-hscroll)
  (define-key doc-view-mode-map (kbd "gg") 'doc-view-first-page)
  (define-key doc-view-mode-map (kbd "G") 'doc-view-last-page)
  (define-key doc-view-mode-map (kbd "C-w C-w") 'evil-window-next)
  (define-key doc-view-mode-map (kbd "C-w C-w") 'evil-window-next)
  (define-key doc-view-mode-map (kbd "-") 'doc-view-shrink)
  (define-key doc-view-mode-map (kbd "+") 'doc-view-enlarge)
  (define-key doc-view-mode-map "," my-leader-map)
  )
(use-package rainbow-delimiters)
;; (use-package vterm)
(use-package rtags)

(use-package treemacs
  :ensure t
  :defer t
  :init
  (defvar treemacs-no-load-time-warnings t)
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                 (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay      0.5
          treemacs-directory-name-transformer    #'identity
          treemacs-display-in-side-window        t
          treemacs-eldoc-display                 t
          treemacs-file-event-delay              5000
          treemacs-file-extension-regex          treemacs-last-period-regex-value
          treemacs-file-follow-delay             0.2
          treemacs-file-name-transformer         #'identity
          treemacs-follow-after-init             t
          treemacs-git-command-pipe              ""
          treemacs-goto-tag-strategy             'refetch-index
          treemacs-indentation                   2
          treemacs-indentation-string            " "
          treemacs-is-never-other-window         nil
          treemacs-max-git-entries               5000
          treemacs-missing-project-action        'ask
          treemacs-move-forward-on-expand        nil
          treemacs-no-png-images                 nil
          treemacs-no-delete-other-windows       t
          treemacs-project-follow-cleanup        nil
          treemacs-persist-file                  (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                      'left
          treemacs-recenter-distance             0.1
          treemacs-recenter-after-file-follow    nil
          treemacs-recenter-after-tag-follow     nil
          treemacs-recenter-after-project-jump   'always
          treemacs-recenter-after-project-expand 'on-distance
          treemacs-show-cursor                   nil
          treemacs-show-hidden-files             t
          treemacs-silent-filewatch              nil
          treemacs-silent-refresh                nil
          treemacs-sorting                       'alphabetic-asc
          treemacs-space-between-root-nodes      t
          treemacs-tag-follow-cleanup            t
          treemacs-tag-follow-delay              1.5
          treemacs-user-mode-line-format         nil
          treemacs-user-header-line-format       nil
          treemacs-width                         35)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode t)
    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple))))
  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag)))
(use-package treemacs-evil
  :after treemacs evil
  :ensure t)
(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)
(use-package treemacs-magit
  :after treemacs magit
  :ensure t)
(use-package which-key
  :config
  (which-key-mode)

  ;; binding ",a" for agenda (todo manager)
  (define-key my-leader-map "a" '("agenda-prefix"))
  (define-key my-leader-map "aa" 'org-agenda)
  (define-key my-leader-map "as" 'org-schedule)
  (define-key my-leader-map "an" 'org-projectile-capture-for-current-project)
  (define-key my-leader-map "acc" 'counsel-org-clock-goto)
  (define-key my-leader-map "aci" 'org-clock-in)
  (define-key my-leader-map "ach" 'counsel-org-clock-history)
  (define-key my-leader-map "aco" 'org-clock-out)
  (define-key my-leader-map "agp" 'org-projectile-goto-location-for-project)
  ;; (define-key my-leader-map "agg" 'org-projectile-goto-location-for-project)
  ;; (define-key my-leader-map "agp" 'org-projectile-goto-location-for-project)
  (define-key my-leader-map "at" 'org-todo)
  (define-key my-leader-map "ap" 'org-pomodoro)

  ;; binding ",b" for buffers
  (define-key my-leader-map "b" '("buffer-prefix"))
  (define-key my-leader-map "bb" 'ivy-switch-buffer)
  (define-key my-leader-map "bl" 'next-buffer)
  (define-key my-leader-map "bh" 'previous-buffer)
  (define-key my-leader-map "bn" 'evil-buffer-new)
  (define-key my-leader-map "bd" 'evil-delete-buffer)

  ;; binding ",c" for nerd commenter
  (define-key my-leader-map "c" '("comment-prefix"))
  (define-key my-leader-map "cc" 'evilnc-comment-or-uncomment-lines)

  ;; binding ",d" for dumb-jump
  (define-key my-leader-map "d" '("dumb-jump-prefix"))
  (define-key my-leader-map "dd" 'dumb-jump-go)
  (define-key my-leader-map "db" 'dumb-jump-back)
  (define-key my-leader-map "do" 'dumb-jump-go-other-window)
  (define-key my-leader-map "dp" 'dumb-jump-go-prompt)
  (define-key my-leader-map "dq" 'dumb-jump-quick-look)

  ;; binding ",e" for emacs
  (defun edit-config ()
    (interactive)
    (find-file "~/git_repos/misenplace-emacs/misenplace.el"))
  (defun edit-yas-config ()
    (interactive)
    (find-file "~/git_repos/misenplace-snippets/misenplace-snippets.el"))
  (defun reload-config ()
    (interactive)
    (load-file "~/git_repos/misenplace/misenplace.el"))

  ;; binding ",e" for emacs
  (define-key my-leader-map "e" '("evilnc-prefix"))
  (define-key my-leader-map "ec" 'evilnc-comment-or-uncomment-lines)

  ;; binding ",f" for files
  (define-key my-leader-map "f" '("files-prefix"))
  (define-key my-leader-map "ff" 'treemacs)
  (define-key my-leader-map "fc" 'treemacs-create-file)
  (define-key my-leader-map "fC" 'treemacs-create-dir)
  (define-key my-leader-map "fd" 'treemacs-delete)
  (define-key my-leader-map "fee" 'edit-config)
  (define-key my-leader-map "fer" 'reload-config)
  (define-key my-leader-map "fey" 'edit-yas-config)
  (define-key my-leader-map "fq" 'treemacs-quit)
  (define-key my-leader-map "fs" 'treemacs-visit-node-horizontal-split)
  (define-key my-leader-map "fv" 'treemacs-visit-node-vertical-split)

  ;; binding ",g" for git
  (define-key my-leader-map "g" '("git-prefix"))
  (define-key my-leader-map "gb" 'magit-branch)
  (define-key my-leader-map "gB" 'magit-branch-create)
  (define-key my-leader-map "gc" 'magit-commit)
  (define-key my-leader-map "gg" 'magit-status)
  (define-key my-leader-map "gl" 'magit-log)
  (define-key my-leader-map "gs" 'git-gutter:stage-hunk)
  (define-key my-leader-map "gS" 'magit-stage)
  (define-key my-leader-map "gU" 'magit-unstage)
  (define-key my-leader-map "gj" 'git-gutter:next-diff)
  (define-key my-leader-map "gk" 'git-gutter:previous-diff)
  (define-key my-leader-map "gp" 'magit-pull)
  (define-key my-leader-map "gP" 'magit-push)

  ;; binding ",h" for help
  (define-key my-leader-map "h" '("help-prefix"))
  (define-key my-leader-map "hh" 'describe-mode)
  (define-key my-leader-map "hv" 'describe-variable)
  (define-key my-leader-map "hm" 'toggle-menu-bar-mode-from-frame)
  (define-key my-leader-map "hc" 'counsel-cheatsheets)

  ;; binding ",j" for jump
  (define-key my-leader-map "j" '("jump-prefix"))
  (define-key my-leader-map "jb" 'dumb-jump-back)
  (define-key my-leader-map "jd" 'dumb-jump-go)
  (define-key my-leader-map "jt" 'projectile-find-tag)
  (define-key my-leader-map "jj" 'evil-ace-jump-char-mode)
  (define-key my-leader-map "jw" 'evil-ace-jump-word-mode)
  (define-key my-leader-map "jl" 'evil-ace-jump-line-mode)

  ;; binding ",p" for projects
  (define-key my-leader-map "p" '("projects-prefix"))
  (define-key my-leader-map "pA" 'projectile-add-known-project)
  (define-key my-leader-map "pa" 'counsel-projectile-org-agenda)
  (define-key my-leader-map "pc" 'counsel-projectile-org-capture)
  (define-key my-leader-map "pd" 'counsel-projectile-find-dir)
  (define-key my-leader-map "pm" 'projectile-compile-project)
  (define-key my-leader-map "pp" 'counsel-projectile-switch-project)
  (define-key my-leader-map "pf" 'counsel-projectile-find-file)
  (define-key my-leader-map "pq" 'projectile-kill-buffers)
  (define-key my-leader-map "pr" 'counsel-projectile-rg)
  (define-key my-leader-map "ps" 'projectile-run-shell)
  (define-key my-leader-map "ptt" 'projectile-find-tag)
  (define-key my-leader-map "ptr" 'projectile-tag-regenerate)
  (define-key my-leader-map "ptT" 'projectile-test-project)
  (define-key my-leader-map "ptf" 'projectile-find-test-file)
  (define-key my-leader-map "p[" 'projectile-previous-project-buffer)
  (define-key my-leader-map "p]" 'projectile-next-project-buffer)

  ;; binding ",y" for yasnippets
  (define-key my-leader-map "y" '("yas-prefix"))
  (define-key my-leader-map "yy" 'yas-insert-snippet)

  (defun ess-r-display-structure (&optional arg)
  "Interface for `devtools::build()'.
With prefix ARG, build with 'vignettes = FALSE'."
  (interactive "P")
  (ess-r-package-eval-linewise
   "devtools::build(%s)\n" "Building %s" arg
   '("" "vignettes = FALSE")))


  (defun asb-read-into-string (buffer)
  (with-current-buffer buffer
    (buffer-string)))

(defun asb-ess-R-object-popup (r-func)
  "R-FUNC: The R function to use on the object.
Run R-FUN for object at point, and display results in a popup."
  (let ((objname (current-word))
        (tmpbuf (get-buffer-create "**ess-R-object-popup**")))
    (if objname
        (progn
          (ess-command (concat "class(" objname ")\n") tmpbuf)
          (let ((bs (asb-read-into-string tmpbuf)))
            (if (not(string-match "\(object .* not found\)\|unexpected" bs))
                (progn
                  (ess-command (concat r-func "(" objname ")\n") tmpbuf)
                  (let ((bs (asb-read-into-string tmpbuf)))
                    (popup-tip bs
		       :scroll-bar t)))))))
  (kill-buffer tmpbuf)))

(defun asb-ess-R-object-popup-str ()
  "Popup structure of R object."
  (interactive)
  (asb-ess-R-object-popup "str"))

(defun asb-ess-R-object-popup-cls ()
  "Popup class of R object."
  (interactive)
  (asb-ess-R-object-popup "class"))


(defun asb-ess-R-object-popup-interactive (r-func)
  "R Object Interactive Popup.
R-FUNC: An R function to use on object"
  (interactive "sR function to execute: ")
  (asb-ess-R-object-popup r-func))

;; (evil-leader/set-key-for-mode 'ess-mode "ei" 'asb-ess-R-object-popup-str)
;; (evil-leader/set-key-for-mode 'ess-mode "eI"
;;   'asb-ess-R-object-popup-interactive)

  ;; binding ",r" for R programming language
  (define-key my-leader-map "rpb" 'ess-r-devtools-build)
  (define-key my-leader-map "rpc" 'ess-r-devtools-check-package)
  (define-key my-leader-map "rpi" 'ess-r-devtools-install-package)
  (define-key my-leader-map "rpl" 'ess-r-devtools-load-package)
  (define-key my-leader-map "rpt" 'ess-r-devtools-test-package)
  (define-key my-leader-map "rh" 'ess-display-help-on-object)
  (define-key my-leader-map "ro" 'ess-rdired)
  (define-key my-leader-map "rt" 'ess-eval-structure)
  (define-key my-leader-map "ri" 'asb-ess-R-object-popup-str)
  (define-key my-leader-map "rdi" 'asb-ess-R-object-popup-str)
  (define-key my-leader-map "rdI" 'asb-ess-R-object-popup-interactive)
  (define-key my-leader-map "rdc" 'asb-ess-R-object-popup-cls)
  (define-key my-leader-map "rI" 'asb-ess-R-object-popup-interactive)
  (define-key my-leader-map "rr" 'ess-eval-region-and-go)
  (define-key my-leader-map "rq" 'ess-watch-quit)

  ;; binding ",t" for tabs
  ;;(define-key my-leader-map "tr" 'ess-build-tags-for-directory)


  (define-key my-leader-map "tt" 'tab-bar-select-tab-by-name)
  (define-key my-leader-map "tT" 'toggle-tab-bar-mode-from-frame)
  (define-key my-leader-map "tc" 'tab-bar-new-tab)
  (define-key my-leader-map "td" 'tab-bar-close-tab)
  (define-key my-leader-map "tl" 'tab-bar-switch-to-next-tab)
  (define-key my-leader-map "th" 'tab-bar-switch-to-prev-tab)
  (define-key my-leader-map "tr" 'tab-bar-rename-tab)
  (define-key my-leader-map "tL" 'tab-bar-move-tab)

  ;; ;; Old centaur tabs bindigns
  ;; (define-key my-leader-map "tt" 'centaur-tabs-toggle-groups)
  ;; (define-key my-leader-map "th" 'centaur-tabs-backward)
  ;; (define-key my-leader-map "tl" 'centaur-tabs-forward)
  ;; (define-key my-leader-map "tp" 'centaur-tabs-backward-tab)
  ;; (define-key my-leader-map "tP" 'centaur-tabs-group-by-projectile-project)
  ;; (define-key my-leader-map "tn" 'centaur-tabs-forward-tab)
  ;; (define-key my-leader-map "tg" 'centaur-tabs-counsel-switch-group)
  ;; (define-key my-leader-map "tH" 'centaur-tabs-move-current-tab-to-left)
  ;; (define-key my-leader-map "tL" 'centaur-tabs-move-current-tab-to-right)

  ;; TODO: seem to not use these in favor of tabbar?
  ;; (define-key my-leader-map "Td" 'elscreen-kill)
  ;; (define-key my-leader-map "Tl" 'elscreen-next)
  ;; (define-key my-leader-map "Th" 'elscreen-previous)
  ;; (define-key my-leader-map "Tn" 'elscreen-create)
  ;; (define-key my-leader-map "Tr" 'elscreen-screen-nickname)
  ;; (define-key my-leader-map "Tt" 'elscreen-toggle)
  ;; (define-key my-leader-map "Ts" 'elscreen-swap)

  ;; binding ",x" for edit?
  (define-key my-leader-map "xi" 'text-scale-increase)
  (define-key my-leader-map "xd" 'text-scale-decrease)

  ;; binding ",w" for windows
  (define-key my-leader-map "wd" 'evil-window-delete)
  (define-key my-leader-map "wh" 'evil-window-left)
  (define-key my-leader-map "wn" 'evil-window-new)
  (define-key my-leader-map "wj" 'evil-window-down)
  (define-key my-leader-map "wk" 'evil-window-up)
  (define-key my-leader-map "wl" 'evil-window-right)
  (define-key my-leader-map "wm" 'maximize-window)
  (define-key my-leader-map "wM" 'minimize-window)
  (define-key my-leader-map "wu" 'winner-undo)
  (define-key my-leader-map "wv" 'evil-window-vsplit)
  (define-key my-leader-map "wr" 'winner-redo)
  (define-key my-leader-map "ws" 'evil-window-split)
  (define-key my-leader-map "wJ" 'evil-window-decrease-height)
  (define-key my-leader-map "wK" 'evil-window-increase-height)
  (define-key my-leader-map "wH" 'evil-window-decrease-width)
  (define-key my-leader-map "wL" 'evil-window-increase-width))
  (define-key my-leader-map "w-" 'evil-window-split)
  (define-key my-leader-map "w|" 'evil-window-vsplit)
(use-package yasnippet
  :config
  (yas-global-mode 1)

;;  (setq yas-snippet-dirs
;;        '("~/.emacs.d/snippets"                 ;; personal snippets
;;         ;; "/path/to/some/collection/"           ;; foo-mode and bar-mode snippet collection
;;          ;; "/path/to/yasnippet/yasmate/snippets" ;; the yasmate collection
;;          ;; "/home/jordan/.emacs.d/.cask/26.3/elpa/yasnippet-snippets-20200122.1140/snippets/" ;; the yasmate collection
;;          ))
    )
(use-package misenplace-snippets
  :load-path "/home/jordan/.emacs.d/.cask/26.3/elpa/"
  :after yasnippet)
(use-package slack
  :commands (slack-start)
  :init
  (setq slack-buffer-emojify t) ;; if you want to enable emoji, default nil
  (setq slack-prefer-current-team t)
  :config

  (evil-define-key 'normal slack-info-mode-map
    ",u" 'slack-room-update-messages)
  (evil-define-key 'normal slack-mode-map
    ",c" 'slack-buffer-kill
    ",ra" 'slack-message-add-reaction
    ",rr" 'slack-message-remove-reaction
    ",rs" 'slack-message-show-reaction-users
    ",pl" 'slack-room-pins-list
    ",pa" 'slack-message-pins-add
    ",pr" 'slack-message-pins-remove
    ",mm" 'slack-message-write-another-buffer
    ",me" 'slack-message-edit
    ",md" 'slack-message-delete
    ",u" 'slack-room-update-messages
    ",2" 'slack-message-embed-mention
    ",3" 'slack-message-embed-channel
    "\C-n" 'slack-buffer-goto-next-message
    "\C-p" 'slack-buffer-goto-prev-message)
   (evil-define-key 'normal slack-edit-message-mode-map
    ",k" 'slack-message-cancel-edit
    ",s" 'slack-message-send-from-buffer
    ",2" 'slack-message-embed-mention
    ",3" 'slack-message-embed-channel))
(use-package sublimity)

;; User-defined functions
(defun make-project ()
  "Prompt user to enter a directory name and create project."
  (interactive)
  (setq projectname (read-string "Enter your project name:"))
  (setq projectdir (concatenate 'string "~/git_repos/" projectname))
  (setq readme (concatenate 'string projectdir "/readme.org"))
  (setq todo (concatenate 'string projectdir "/todo.org"))
  (make-directory projectdir)
  (with-temp-file readme "")
  (with-temp-file todo "")
  (projectile-add-known-project projectdir)
  (treemacs-add-project-to-workspace projectdir projectname)
  (magit-init projectdir)
  )

;; Basic Configuration
(defun basic-config ()
  "Provide basic common configuration."
  (setq inhibit-splash-screen t)
  (setq-default indent-tabs-mode nil)

  (require 'cl) ; If you don't have it already
  (defun* get-closest-pathname (&optional (file "Makefile"))
    "Determine the pathname of the first instance of FILE starting from the current directory towards root.
  This may not do the correct thing in presence of links. If it does not find FILE, then it shall return the name
  of FILE in the current directory, suitable for creation"
    (let ((root (expand-file-name "/"))) ; the win32 builds should translate this correctly
      (expand-file-name file
  		      (loop
  			for d = default-directory then (expand-file-name ".." d)
  			if (file-exists-p (expand-file-name file d))
  			return d
  			if (equal d root)
  			return nil))))
  (require 'compile)
  (add-hook 'c-mode-hook (lambda () (set (make-local-variable 'compile-command) (format "make -f %s" (get-closest-pathname)))))
  (global-set-key [f9] 'toggle-menu-bar-mode-from-frame)
  (tool-bar-mode -1)
  ;; (set-default-font "DejaVu Sans Mono-12")
  ;; (set-face-attribute 'default nil :font "DejaVu Sans Mono-12" )
  ;; (set-frame-font "DejaVu Sans Mono-12" nil t)
  (linum-mode 1)
  (setq-default fill-column 80)
  (when (fboundp 'winner-mode)
    (winner-mode 1))
  (defun make-backup-file-name (file)
    "Function to generate backup file names.
  FILE: The name of the file to generate a backup file of"
    (concat “~/.emacs_backups/” (file-name-nondirectory file) “~”))
  (setq backup-directory-alist `(("." . "~/.emacs_backups")))
  (setq backup-by-copying t)
  (setq delete-old-versions t
    kept-new-versions 6
    kept-old-versions 2
    version-control t)
  (add-hook 'org-mode-hook 'turn-on-auto-fill)
  (add-hook 'org-mode-hook 'flyspell-mode)
  (setq auto-mode-alist
  (cons '("\\.org" . org-mode)auto-mode-alist))
  (setq org-directory "~/org/")
  (setq org-default-notes-file (concat org-directory "/codex.org"))
  (setq org-agenda-include-all-todo t)
  (setq org-agenda-include-diary t)
  (setq org-hide-leading-stars t)
  (setq org-odd-levels-only t)
  (setq org-todo-keywords
        '((sequence "PIPELINE"
                    "TODO"
                    "DONE")))
  (defvar org-journal-file "~/org/journal.org"
     "Path to OrgMode journal file.")
  (defvar org-journal-date-format "%Y-%m-%d"
     "Date format string for journal headings.")
  (defun org-journal-entry ()
    "Create a new diary entry for today or append to an existing one."
    (interactive)
    (switch-to-buffer (find-file org-journal-file))
    (widen)
    (let ((today (format-time-string org-journal-date-format)))
      (beginning-of-buffer)
      (unless (org-goto-local-search-headings today nil t)
        ((lambda ()
           (org-insert-heading)
           (insert today)
           (insert "\n\n  \n"))))
      (beginning-of-buffer)
      (org-show-entry)
      (org-narrow-to-subtree)
      (end-of-buffer)
      (backward-char 2)
      (unless (= (current-column) 2)
        (insert "\n\n  "))))
  (defun essh-next-code-line (&optional arg)
    "Move ARG lines of code forward (backward if ARG is negative).
  Skips past all empty and comment lines.	 Default for ARG is 1.

  On success, return 0.  Otherwise, go as far as possible and return -1."
    (interactive "p")
    (or arg (setq arg 1))
    (beginning-of-line)
    (let ((n 0)
  	(inc (if (> arg 0) 1 -1)))
      (while (and (/= arg 0) (= n 0))
        (setq n (forward-line inc)); n=0 is success
        (while (and (= n 0)
  		  (looking-at "\\s-*\\($\\|\\s<\\)"))
  	(setq n (forward-line inc)))
        (setq arg (- arg inc)))
      n))
  (defun process-shell ()
    "returns a list with existing shell process."
    (interactive)
    (setq listpr (process-list))
    (setq lengthpr (length listpr))
    (setq i 0)
    (setq listshellp '())
    (while (< i lengthpr)
      (setq pos (string-match "shell" (prin1-to-string (elt listpr i))))
      (if pos (add-to-list 'listshellp (process-name (get-process (elt listpr i)))))
      (setq i (+ 1 i)))
    listshellp)
  (defun process-shell-choose ()
    "returns which process to use."
  (interactive)
  (setq outpr 0)
  (setq cbuf (current-buffer))
  (setq shelllist (process-shell))
  (setq shelln (length shelllist))
  (if (eq shelln 0)
      (progn (shell)
  	   (switch-to-buffer cbuf)
  	   (setq outpr (get-process "shell"))
  	   (sleep-for 0.5)))
  (if (eq shelln 1)
      (setq outpr (get-process (elt shelllist 0))))
  (if (> shelln 1)
  (progn
  (setq proc (completing-read "Send code to:" shelllist nil t (elt shelllist 0)))
  (setq outpr (get-process proc))))
  outpr)
  (defun shell-eval-line (sprocess command)
    "Evaluates a single command into the shell process."
    (setq sbuffer (process-buffer sprocess))
    (setq command (concat command "\n"))
    (accept-process-output sprocess 0 10)
    (with-current-buffer sbuffer
      (end-of-buffer) ;point is not seen being moved (unless sbuffer is focused)
      (insert command)			;pastes the command to shell
      (set-marker (process-mark sprocess) (point-max))
      (process-send-string sprocess command)
      ;; (accept-process-output sprocess 0 10)
      ))
  (defun shell-cd-current-directory ()
    "Changes the shell working directory to the current buffer's one."
    (interactive)
    (setq sprocess (process-shell-choose))
    (setq com (format "cd %s" (file-name-directory default-directory)))
    (shell-eval-line sprocess com))
  (defun pipe-line-to-shell (&optional step)
    "Evaluates the current line to the shell."
    (interactive ())
    (setq com (buffer-substring (point-at-bol) (point-at-eol)))
    (if (> (length com) 0)
        (progn
  	(setq sprocess (process-shell-choose))
  	(shell-eval-line sprocess com)
  	(when step (essh-next-code-line)))
      (message "No command in this line")))
  (defun pipe-line-to-shell-and-step ()
    "Evaluates the current line to the shell and goes to next line."
    (interactive)
    (pipe-line-to-shell t))
  (defun pipe-region-to-shell (start end)
    "Sends a region to the shell."
    (interactive "r")
    (setq com (buffer-substring start end))	       ;reads command
    (setq lcom (length com))		       ;count chars
    (setq lastchar (substring com (1- lcom) lcom)) ;get last char
    (unless (string-match "\n" lastchar) ;if last char is not "\n", then...
      (setq com (concat com "\n")))	     ;...add it!
    (setq sprocess (process-shell-choose))
    (setq sbuffer (process-buffer sprocess))
    (while (> (length com) 0)
      (setq pos (string-match "\n" com))
      (setq scom (substring com 0 pos))
      (setq com (substring com (min (length com) (1+ pos))))
      (shell-eval-line sprocess scom)
      (accept-process-output sprocess 0 10)
      ))
  (defun pipe-buffer-to-shell ()
    "Evaluate whole buffer to the shell."
    (interactive)
    (pipe-region-to-shell (point-min) (point-max)))
  (defun pipe-function-to-shell ()
  "Evaluate function to the shell."
  (interactive)
  (setq beg-end (essh-beg-end-of-function))
  (if beg-end
      (save-excursion
        (setq beg (nth 0 beg-end))
        (setq end (nth 1 beg-end))
        (goto-line beg)
        (setq origin (point-at-bol))
        (goto-line end)
        (setq terminal (point-at-eol))
        (pipe-region-to-shell origin terminal))
    (message "No function at current point.")))
  (defun essh-beg-end-of-function ()
    "Returns the lines where the function starts and ends. If there is no function at current line, it returns nil."
    (interactive)
    (setq curline (line-number-at-pos))	;current line
    (setq curcom (buffer-substring (point-at-bol) (point-at-eol)))
    (setq pos (string-match "function" curcom))
    (save-excursion
      (if pos
  	(progn
  	  (setq beg curline))
        (progn
  	(while (not pos)
  	  (setq curline (1- curline))	;current line
  	  (previous-line)			;go to previous line
  	  (setq curcom (buffer-substring (point-at-bol) (point-at-eol)))
  	  (setq pos (string-match "function" curcom)))
        (setq beg curline)))
      (beginning-of-line)
      (forward-list)			; move pointer to first matching brace
      (setq end (line-number-at-pos)))
    ;; (message (format  "%d %d" beg end))
    (if (and (<= (line-number-at-pos) end) (>= (line-number-at-pos) beg))
        (list beg end)
      nil))
  (defun my-python-line ()
  (interactive)
  (save-excursion
    (setq the_script_buffer (format (buffer-name)))
    (end-of-line)
    (kill-region (point) (progn (back-to-indentation) (point)))
    (if  (get-buffer  "*Python*")
    (message "")
    (run-python "ipython" nil nil))
    ;; (setq the_py_buffer (format "*Python[%s]*" (buffer-file-name)))
    (setq the_py_buffer "*Python*")
    (switch-to-buffer-other-window  the_py_buffer)
    (goto-char (buffer-end 1))
    (yank)
    (comint-send-input)
    (switch-to-buffer-other-window the_script_buffer)
    (yank))
    (end-of-line)
    (next-line)
    )
  (setq python-shell-interpreter "python3")
  (setq python-shell-completion-native-disabled-interpreters '("python3"))

  )

(basic-config)


;;;; Some key bindings
(define-key lisp-interaction-mode-map (kbd "<C-return>") 'eval-defun)

;; Global bindings
(define-key global-map (kbd "C-=") 'text-scale-increase)
(define-key global-map (kbd "C-+") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)
(define-key global-map (kbd "C-h") 'evil-window-left)
(define-key global-map (kbd "C-l") 'evil-window-right)
(define-key global-map (kbd "C-j") 'evil-window-down)
(define-key global-map (kbd "C-k") 'evil-window-up)



;; (define-key global-map (kbd "C-w C-l") 'evil-window-increase-width)
;; (define-key global-map (kbd "C-w C-h") 'evil-window-decrease-width)
;; (define-key global-map (kbd "C-w C-j") 'evil-window-increase-height)
;; (define-key global-map (kbd "C-w C-k") 'evil-window-decrease-height)



;; Org mode bindings
(define-key org-mode-map (kbd "C-h") 'evil-window-left)
(define-key org-mode-map (kbd "C-l") 'evil-window-right)
(define-key org-mode-map (kbd "C-j") 'evil-window-down)
(define-key org-mode-map (kbd "C-k") 'evil-window-up)
(define-key org-mode-map (kbd "C-<tab>") 'tab-bar-switch-to-next-tab)

;; LaTeX mode bindings
(define-key LaTeX-mode-map (kbd "C-j") 'evil-window-down)

;; Misenpace-wm setup

;; (defun setup-misenplacewm()
;;   "Setup misenplacewm."
;;   (interactive)
;;   (menu-bar-mode -1)
;;   (tool-bar-mode -1)
;;   (scroll-bar-mode -1)
;;   (fringe-mode 1)
;;   (setq display-time-default-load-average nil)
;;   (display-time-mode t)
;;   (ido-mode 1)
;;   (server-start)
;;   (use-package exwm)
;;   (use-package exwm-config)
;;   (exwm-config-ido)
;;   (setq exwm-workspace-number 4)
;;   (add-hook 'exwm-update-class-hook
;;   	  (lambda ()
;;   	    (unless (or (string-prefix-p "sun-awt-X11-" exwm-instance-name)
;;   			(string= "gimp" exwm-instance-name))
;;   	      (exwm-workspace-rename-buffer exwm-class-name))))
;;   (add-hook 'exwm-update-title-hook
;;   	  (lambda ()
;;   	    (when (or (not exwm-instance-name)
;;   		      (string-prefix-p "sun-awt-X11-" exwm-instance-name)
;;   		      (string= "gimp" exwm-instance-name))
;;   	      (exwm-workspace-rename-buffer exwm-title))))
;;   (defun exwm-launch-term ()
;;     "Launch urxvt as terminal emulator."
;;     (interactive)
;;     (start-process-shell-command "urxvt" nil "urxvt"))
;;   (defun exwm-logout ()
;;     "Logout of exwm."
;;     (interactive)
;;     (recentf-save-list)
;;     (save-some-buffers)
;;     (start-process-shell-command "logout" nil "lxsession-logout"))
;; 
;;   (setq exwm-input-global-keys
;;        `(
;;  	([?\s-r] . exwm-reset)
;;  	([?\s-w] . exwm-workspace-switch)
;;  	([?\s-p] . counsel-linux-app)
;;  	([?\s-k] . evil-window-up)
;;  	([?\s-d] . evil-window-delete)
;;  	([?\s-j] . evil-window-down)
;;  	([?\s-l] . evil-window-right)
;;  	([?\s-h] . evil-window-left)
;;  	([?\s-j] . evil-window-down)
;;  	([?\s-s] . evil-window-split)
;;  	([?\s-v] . evil-window-vsplit)
;;  	;;([?\s-SPC] . evil-window-rotate-upwards)
;;  	([?\s-L] . enlarge-window-horizontally)
;;  	([?\s-H] . shrink-window-horizontally)
;;  	([?\s-J] . enlarge-window)
;;  	([?\s-K] . shrink-window)
;;  	([?\s-C] . evil-delete-buffer)
;;  	([s-return] . exwm-launch-term)
;;  	([?\s-m] . exwm-layout-toggle-fullscreen)
;;  	([?\s-Q] . exwm-logout)
;;     	;; ,@(mapcar (lambda (i)
;;     	;; 	    `(,(kbd (format "s-%d" i)) .
;;     	;; 	      (lambda ()
;;     	;; 		(interactive)
;;     	;; 		(exwm-workspace-switch-create ,(- i 1)))))
;;     	;; 	  (number-sequence 1 9))
;; 	,@(mapcar (lambda (i)
;;                   `(,(kbd (format "s-%d" i)) .
;;                     (lambda ()
;;                       (interactive)
;;                       (exwm-workspace-switch-create ,i))))
;;                 (number-sequence 0 9))
;;  	([?\s-!] . (lambda ()
;;  		     (interactive)
;;  		     (exwm-workspace-move exwm-workspace--current 0)))
;;  	([?\s-@] . (lambda ()
;;  		     (interactive)
;;  		     (exwm-workspace-move exwm-workspace--current 1)))
;;  	([?\s-#] . (lambda ()
;;  		     (interactive)
;;  		     (exwm-workspace-move exwm-workspace--current 2)))
;;  	([?\s-$] . (lambda ()
;;  		     (interactive)
;;  		     (exwm-workspace-move exwm-workspace--current 3)))
;;  	([?\s-%] . (lambda ()
;;  		     (interactive)
;;  		     (exwm-workspace-move exwm-workspace--current 4)))
;;  	([?\s-^] . (lambda ()
;;  		     (interactive)
;;  		     (exwm-workspace-move exwm-workspace--current 5)))
;;  	([?\s-&] . (lambda ()
;;  		     (interactive)
;;  		     (exwm-workspace-move exwm-workspace--current 6)))
;;  	([?\s-*] . (lambda ()
;;  		     (interactive)
;;  		     (exwm-workspace-move exwm-workspace--current 7)))
;; ;; 	([?\s-(] . (lambda ()
;; ;; 		     (interactive)
;; ;; 		     (exwm-workspace-move exwm-workspace--current 8)))
;;  	([s-f2] . (lambda ()
;;  		    (interactive)
;;  		    (start-process "" nil "/usr/bin/slock")))
;;     ))
;; 
;; 
;;   ;; (setq use-dialog-box nil)
;;   ;; (setq exwm-floating-border-width 3)
;;   ;; (setq exwm-floating-border-color "orange")
;;   ;; (add-hook 'exwm-update-class-hook #'exwmx-grocery--rename-exwm-buffer)
;;   ;; (add-hook 'exwm-update-title-hook #'exwmx-grocery--rename-exwm-buffer)
;;   ;; (add-hook 'exwm-manage-finish-hook #'exwmx-grocery--manage-finish-function)
;;   ;; (push ?\C-q exwm-input-prefix-keys)
;;   ;; (define-key exwm-mode-map [?\C-q] #'exwm-input-send-next-key)
;;   ;; (define-key exwm-mode-map (kbd "C-c y") #'exwmx-sendstring-from-kill-ring)
;;   ;; (add-hook 'sh-mode-hook '(lambda () (define-key sh-mode-map (kbd "<C-return>") 'pipe-line-to-shell-and-step)))
;;   ;; (add-hook 'python-mode-hook '(lambda () (local-set-key (kbd "<C-return>") 'my-python-line)))
;;   ;; ;; (add-hook 'emacs-lisp-mode-hook (lambda () (local-set-key emacs-lisp-mode-map (kbd "<C-return>") 'eval-region)))
;;   ;; (add-hook 'emacs-lisp-mode-hook '(lambda () (define-key emacs-lisp-mode-map "<C-return>" 'eval-region)))
;;   (exwm-enable)
;; )
;; (defun setup-misenplaceterm()
;;   "Setup terminal misenplace."
;;   (use-package eyebrowse
;;   :config
;;   (eyebrowse-mode t)
;;   (global-set-key (kbd "M-1") 'eyebrowse-switch-to-window-config-0)
;;   (global-set-key (kbd "M-2") 'eyebrowse-switch-to-window-config-1)
;;   (global-set-key (kbd "M-3") 'eyebrowse-switch-to-window-config-2)
;;   (global-set-key (kbd "M-4") 'eyebrowse-switch-to-window-config-3)
;;   (global-set-key (kbd "M-5") 'eyebrowse-switch-to-window-config-4)
;;   (global-set-key (kbd "M-6") 'eyebrowse-switch-to-window-config-5)
;;   (global-set-key (kbd "M-7") 'eyebrowse-switch-to-window-config-6)
;;   (global-set-key (kbd "M-8") 'eyebrowse-switch-to-window-config-7)
;;   (global-set-key (kbd "M-9") 'eyebrowse-switch-to-window-config-8)
;;   )
;;   (use-package tabbar
;;   :config
;;   (tabbar-mode))
;;   ;; Window bindings in non-exwm mode
;;   (global-set-key (kbd "M-d") 'evil-window-delete)
;;   (global-set-key (kbd "M-H") 'evil-window-rotate-upwards)
;;   (global-set-key (kbd "M-h") 'evil-window-left)
;;   (global-set-key (kbd "M-l") 'evil-window-right)
;;   (global-set-key (kbd "M-L") 'evil-window-rotate-downwards)
;;   (global-set-key (kbd "M-j") 'evil-window-down)
;;   (global-set-key (kbd "M-k") 'evil-window-up)
;;   (global-set-key (kbd "M-s") 'evil-window-split)
;;   (global-set-key (kbd "M-v") 'evil-window-vsplit)
;;   (global-set-key (kbd "M-<left>") 'evil-window-decrease-width)
;;   (global-set-key (kbd "M-<right>") 'evil-window-increase-width)
;;   (global-set-key (kbd "M-<up>") 'evil-window-increase-height)
;;   (global-set-key (kbd "M-<down>") 'evil-window-decrease-height)
;;   ;; (add-hook 'sh-mode-hook '(lambda () (define-key sh-mode-map (kbd "M-<RET>") 'pipe-line-to-shell-and-step)))
;;   ;; (add-hook 'ess-mode-hook '(lambda () (define-key ess-mode-map (kbd "M-<RET>") 'ess-eval-region-or-line-visibly-and-step)))
;;   ;; (add-hook 'python-mode-hook '(lambda () (define-key python-mode-map (kbd "M-<RET>") 'my-python-line)))
;;   ;; (add-hook 'emacs-lisp-mode-hook '(lambda () (define-key emacs-lisp-mode-map (kbd "M-<RET>") 'eval-region)))
;;   )
;; (defun setup-misenplacewm ()
;;   "Setup misenplacewm."
;;   (interactive)
;;   (menu-bar-mode -1)
;;   (tool-bar-mode -1)
;;   (scroll-bar-mode -1)
;;   (fringe-mode 1)
;;   (setq display-time-default-load-average nil)
;;   (display-time-mode t)
;;   (ido-mode 1)
;;   (server-start)
;;   (use-package exwm)
;;   (use-package exwm-config)
;;   (exwm-config-ido)
;;   (setq exwm-workspace-number 4)
;;   (add-hook 'exwm-update-class-hook
;;   	  (lambda ()
;;   	    (unless (or (string-prefix-p "sun-awt-X11-" exwm-instance-name)
;;   			(string= "gimp" exwm-instance-name))
;;   	      (exwm-workspace-rename-buffer exwm-class-name))))
;;   (add-hook 'exwm-update-title-hook
;;   	  (lambda ()
;;   	    (when (or (not exwm-instance-name)
;;   		      (string-prefix-p "sun-awt-X11-" exwm-instance-name)
;;   		      (string= "gimp" exwm-instance-name))
;;   	      (exwm-workspace-rename-buffer exwm-title))))
;;   (defun exwm-launch-term ()
;;     "Launch urxvt as terminal emulator."
;;     (interactive)
;;     (start-process-shell-command "urxvt" nil "urxvt"))
;;   (defun exwm-logout ()
;;     "Logout of exwm."
;;     (interactive)
;;     (recentf-save-list)
;;     (save-some-buffers)
;;     (start-process-shell-command "logout" nil "lxsession-logout"))
;;   (setq exwm-input-global-keys
;;        `(
;;  	([?\s-r] . exwm-reset)
;;  	([?\s-w] . exwm-workspace-switch)
;;  	([?\s-p] . counsel-linux-app)
;;  	([?\s-k] . evil-window-up)
;;  	([?\s-d] . evil-window-delete)
;;  	([?\s-j] . evil-window-down)
;;  	([?\s-l] . evil-window-right)
;;  	([?\s-h] . evil-window-left)
;;  	([?\s-j] . evil-window-down)
;;  	([?\s-s] . evil-window-split)
;;  	([?\s-v] . evil-window-vsplit)
;;  	([?\s-H] . evil-window-rotate-upwards)
;;  	([?\s-L] . evil-window-rotate-downwards)
;;  	([?\s-J] . exwm-layout-enlarge-window)
;;  	([?\s-K] . exwm-layout-shrink-window)
;;  	([?\s-C] . evil-delete-buffer)
;;  	([s-return] . exwm-launch-term)
;;  	([?\s-m] . exwm-layout-toggle-fullscreen)
;;  	([?\s-Q] . exwm-logout)
;; ;;  	,@(mapcar (lambda (i)
;; ;;  		    `(,(kbd (format "s-%d" i)) .
;; ;;  		      (lambda ()
;; ;;  			(interactive)
;; ;;  			(exwm-workspace-switch-create ,(- i 1))))
;; ;;  		  (number-sequence 1 9)))
;; 	,@(mapcar (lambda (i)
;;                   `(,(kbd (format "s-%d" i)) .
;;                     (lambda ()
;;                       (interactive)
;;                       (exwm-workspace-switch-create ,i))))
;;                 (number-sequence 0 9))
;;  	([?\s-!] . (lambda ()
;;  		     (interactive)
;;  		     (exwm-workspace-move exwm-workspace--current 0)))
;;  	([?\s-@] . (lambda ()
;;  		     (interactive)
;;  		     (exwm-workspace-move exwm-workspace--current 1)))
;;  	([?\s-#] . (lambda ()
;;  		     (interactive)
;;  		     (exwm-workspace-move exwm-workspace--current 2)))
;;  	([?\s-$] . (lambda ()
;;  		     (interactive)
;;  		     (exwm-workspace-move exwm-workspace--current 3)))
;;  	([?\s-%] . (lambda ()
;;  		     (interactive)
;;  		     (exwm-workspace-move exwm-workspace--current 4)))
;;  	([?\s-^] . (lambda ()
;;  		     (interactive)
;;  		     (exwm-workspace-move exwm-workspace--current 5)))
;;  	([?\s-&] . (lambda ()
;;  		     (interactive)
;;  		     (exwm-workspace-move exwm-workspace--current 6)))
;;  	([?\s-*] . (lambda ()
;;  		     (interactive)
;;  		     (exwm-workspace-move exwm-workspace--current 7)))
;; ;; 	([?\s-(] . (lambda ()
;; ;; 		     (interactive)
;; ;; 		     (exwm-workspace-move exwm-workspace--current 8)))
;;  	([s-f2] . (lambda ()
;;  		    (interactive)
;;  		    (start-process "" nil "/usr/bin/slock")))
;;     ))
;;   (define-key exwm-mode-map [?\C-q] #'exwm-input-send-next-key)
;;   (setq exwm-input-simulation-keys
;;         '(
;;   	([?\C-b] . [left])
;;   	([?\M-b] . [C-left])
;;   	([?\C-f] . [right])
;;   	([?\M-f] . [C-right])
;;   	([?\C-p] . [up])
;;   	([?\C-n] . [down])
;;   	([?\C-a] . [home])
;;   	([?\C-e] . [end])
;;   	([?\M-v] . [prior])
;;   	([?\C-v] . [next])
;;   	([?\C-d] . [delete])
;;   	([?\C-k] . [S-end delete])
;;   	([?\C-w] . [?\C-x])
;;   	([?\M-w] . [?\C-c])
;;   	([?\C-y] . [?\C-v])
;;   	([?\C-s] . [?\C-f])))
;;   (setq use-dialog-box nil)
;;   (setq exwm-floating-border-width 3)
;;   (setq exwm-floating-border-color "orange")
;;   (add-hook 'exwm-update-class-hook #'exwmx-grocery--rename-exwm-buffer)
;;   (add-hook 'exwm-update-title-hook #'exwmx-grocery--rename-exwm-buffer)
;;   (add-hook 'exwm-manage-finish-hook #'exwmx-grocery--manage-finish-function)
;;   (push ?\C-q exwm-input-prefix-keys)
;;   (define-key exwm-mode-map [?\C-q] #'exwm-input-send-next-key)
;;   (define-key exwm-mode-map (kbd "C-c y") #'exwmx-sendstring-from-kill-ring)
;;   (add-hook 'sh-mode-hook '(lambda () (define-key sh-mode-map (kbd "<C-return>") 'pipe-line-to-shell-and-step)))
;;   (add-hook 'python-mode-hook '(lambda () (local-set-key (kbd "<C-return>") 'my-python-line)))
;;   ;; (add-hook 'emacs-lisp-mode-hook (lambda () (local-set-key emacs-lisp-mode-map (kbd "<C-return>") 'eval-region)))
;;   (add-hook 'emacs-lisp-mode-hook '(lambda () (define-key emacs-lisp-mode-map "<C-return>" 'eval-region)))
;;   (exwm-enable)
;;   )

;; ;; Misenpace-term setup
;;
;; (defun setup-misenplaceterm()
;;   "Setup terminal misenplace."
;;   (use-package eyebrowse
;;   :config
;;   (eyebrowse-mode t)
;;   (global-set-key (kbd "M-1") 'eyebrowse-switch-to-window-config-0)
;;   (global-set-key (kbd "M-2") 'eyebrowse-switch-to-window-config-1)
;;   (global-set-key (kbd "M-3") 'eyebrowse-switch-to-window-config-2)
;;   (global-set-key (kbd "M-4") 'eyebrowse-switch-to-window-config-3)
;;   (global-set-key (kbd "M-5") 'eyebrowse-switch-to-window-config-4)
;;   (global-set-key (kbd "M-6") 'eyebrowse-switch-to-window-config-5)
;;   (global-set-key (kbd "M-7") 'eyebrowse-switch-to-window-config-6)
;;   (global-set-key (kbd "M-8") 'eyebrowse-switch-to-window-config-7)
;;   (global-set-key (kbd "M-9") 'eyebrowse-switch-to-window-config-8)
;;   )
;;   (use-package tabbar
;;   :config
;;   (tabbar-mode))
;;   ;; Window bindings in non-exwm mode
;;   (global-set-key (kbd "M-d") 'evil-window-delete)
;;   (global-set-key (kbd "M-H") 'evil-window-rotate-upwards)
;;   (global-set-key (kbd "M-h") 'evil-window-left)
;;   (global-set-key (kbd "M-l") 'evil-window-right)
;;   (global-set-key (kbd "M-L") 'evil-window-rotate-downwards)
;;   (global-set-key (kbd "M-j") 'evil-window-down)
;;   (global-set-key (kbd "M-k") 'evil-window-up)
;;   (global-set-key (kbd "M-s") 'evil-window-split)
;;   (global-set-key (kbd "M-v") 'evil-window-vsplit)
;;   (global-set-key (kbd "M-<left>") 'evil-window-decrease-width)
;;   (global-set-key (kbd "M-<right>") 'evil-window-increase-width)
;;   (global-set-key (kbd "M-<up>") 'evil-window-increase-height)
;;   (global-set-key (kbd "M-<down>") 'evil-window-decrease-height)
;;   (add-hook 'sh-mode-hook '(lambda () (define-key sh-mode-map (kbd "M-<RET>") 'pipe-line-to-shell-and-step)))
;;   (add-hook 'ess-mode-hook '(lambda () (define-key ess-mode-map (kbd "M-<RET>") 'ess-eval-region-or-line-visibly-and-step)))
;;   (add-hook 'python-mode-hook '(lambda () (define-key python-mode-map (kbd "M-<RET>") 'my-python-line)))
;;   (add-hook 'emacs-lisp-mode-hook '(lambda () (define-key emacs-lisp-mode-map (kbd "M-<RET>") 'eval-region))))


;; General Coding utilities

(defun set-target-buffer (buffer)
  "Switch to BUFFER.
BUFFER may be a string or nil."
  (setq target-buffer buffer))

(defun ivy-set-process-target ()
  "Switch to another buffer."
  (interactive)
  (ivy-read "Switch to buffer: " #'internal-complete-buffer
            :keymap ivy-switch-buffer-map
            :preselect (buffer-name (other-buffer (current-buffer)))
            :action #'set-target-buffer
            :matcher #'ivy--switch-buffer-matcher
            :caller 'ivy-switch-buffer))

(defun send-line-to-target-process ()
  "Send a line to process defined by target-buffer."
  (interactive)
  (setq proc (get-process target-buffer))
  (setq com (concat (buffer-substring (point-at-bol) (point-at-eol)) "\n"))
  (process-send-string target-buffer com)
  (next-line)
  )


;; TODO... change these to mode map bindings?
(global-set-key (kbd "C-SPC") (lambda () (interactive) (send-line-to-target-process)))

;; Transparency functions
(defun toggle-transparency ()
  (interactive)
  (if (/=
       (cadr (frame-parameter nil 'alpha))
       100)
      (set-frame-parameter nil 'alpha '(100 100))
    (set-frame-parameter nil 'alpha '(85 50))))

(defun day ()
  (interactive)
  (counsel-load-theme-action "doom-gruvbox-light"))

(defun night ()
  (interactive)
  (counsel-load-theme-action "doom-gruvbox"))


(provide 'misenplace)

(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

(use-package counsel-gtags
  :config

    (add-hook 'c-mode-hook 'counsel-gtags-mode)
    (add-hook 'c++-mode-hook 'counsel-gtags-mode)

    (with-eval-after-load 'counsel-gtags
        (define-key counsel-gtags-mode-map (kbd "M-t") 'counsel-gtags-find-definition)
        (define-key counsel-gtags-mode-map (kbd "M-r") 'counsel-gtags-find-reference)
        (define-key counsel-gtags-mode-map (kbd "M-s") 'counsel-gtags-find-symbol)
        (define-key counsel-gtags-mode-map (kbd "M-,") 'counsel-gtags-go-backward)))


;;; misenplace.el ends here
