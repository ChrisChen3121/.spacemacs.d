;;; packages.el --- cc-protobuf layer packages file for Spacemacs.
;;
;; Copyright (c) 2016 ChrisChen
;;
;; Author: ChrisChen <ChrisChen3121@gmail.com>
;; URL: https://github.com/ChrisChen3121/.spacemacs.d
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defconst cc-protobuf-packages
  '(
    protobuf-mode
    ))

(defun cc-protobuf/init-protobuf-mode ()
  (use-package protobuf-mode
    :defer t
    ))

;;; packages.el ends here
