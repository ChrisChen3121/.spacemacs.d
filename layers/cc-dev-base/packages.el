;; packages.el --- cc-dev-base layer packages file for Spacemacs.
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
    protobuf-mode
    cheat-sh
    ))

(defun cc-dev-base/init-yasnippet-snippets ()
  (use-package yasnippet-snippets
    :defer t))


(defun cc-dev-base/init-protobuf-mode ()
  (use-package protobuf-mode
    :defer t))

(defun cc-dev-base/init-cheat-sh ()
  (use-package cheat-sh
    :config
    (progn
      (which-key-add-key-based-replacements
        "C-c h" "cheat")
      (global-set-key (kbd "C-c h c") 'cheat-sh)
      (global-set-key (kbd "C-c h h") 'cheat-sh-help)
      (global-set-key (kbd "C-c h s") 'cheat-sh-search)
      (global-set-key (kbd "C-c h t") 'cheat-sh-search-topic)
      (global-set-key (kbd "C-c h l") 'cheat-sh-list)
      )
    ))

;;; packages.el ends here
