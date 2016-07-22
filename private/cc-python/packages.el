;;; packages.el --- cc-python layer packages file for Spacemacs.
;;
;; Copyright (c) 2016 ChrisChen
;;
;; Author: ChrisChen <ChrisChen3121@gmail.com>
;; URL: https://github.com/ChrisChen3121/.spacemacs.d
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3
(defconst cc-python-packages
  '(
    sphinx-doc
    ))


(defun cc-python/init-sphinx-doc ()
  (use-package sphinx-doc
    :defer t
    ))
