;;; packages.el --- cc-better-defaults layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: chrischen <chrischen3121@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defconst cc-better-defaults-packages
  '(
    whole-line-or-region
    switch-window
    ))

(defun cc-better-defaults/init-whole-line-or-region ()
  (use-package whole-line-or-region
    :config
    (whole-line-or-region-global-mode)
    ))

(defun cc-better-defaults/init-switch-window ()
  (use-package switch-window
    :config
    (global-set-key (kbd "C-x o") 'switch-window)
    ))
;;; packages.el ends here
