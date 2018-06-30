;;; packages.el --- cc-dev-base layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: chrischen <chrischen3121@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defconst cc-dev-base-packages
  '(
    yasnippet-snippets
    ))

(defun cc-dev-base/init-yasnippet-snippets ()
  (use-package yasnippet-snippets
    :defer t)
  )

;;; packages.el ends here