;;; packages.el --- cc-org layer packages file for Spacemacs.
;;
;; Copyright (c) 2016 ChrisChen
;;
;; Author: ChrisChen <ChrisChen3121@gmail.com>
;; URL: https://github.com/ChrisChen3121/.spacemacs.d
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3
(defconst cc-org-packages
  '(
    org
    graphviz-dot-mode
    org-agenda
    ))

(defun cc-org/init-graphviz-dot-mode ()
  (use-package graphviz-dot-mode
    :defer t
    ))

(defun cc-org/pre-init-org-agenda ()
  (with-eval-after-load 'org-agenda
    (require 'org-projectile)
    (push (org-projectile:todo-files) org-agenda-files)))

(defun cc-org/pre-init-org ()
  (with-eval-after-load 'org
    (setq org-ditaa-jar-path "~/tools/ditaa.jar")
    (setq org-confirm-babel-evaluate nil)
    (org-babel-do-load-languages
     'org-babel-load-languages
     '((emacs-lisp . t)
       (sh . t)
       (ditaa . t)
       (dot . t)
       (plantuml . t)
       (python . t)
       (C . t)
       (lisp . t)
       (sql . t)
       (org . t)))))
