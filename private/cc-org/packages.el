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
    graphviz-dot-mode
    ))

(defun cc-org/init-graphvix-doc-mode ()
  (use-package graphviz-dot-mode
    :defer t))
