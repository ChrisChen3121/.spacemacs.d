;;; packages.el --- cc-c++ layer packages file for Spacemacs.
;;
;; Copyright (c) 2016 ChrisChen
;;
;; Author: ChrisChen <ChrisChen3121@gmail.com>
;; URL: https://github.com/ChrisChen3121/.spacemacs.d
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defconst cc-c++-packages
  '(
    google-c-style
    company
    ))

(defun cc-c++/init-google-c-style ()
  (use-package google-c-style
    :defer t
    :init
    (add-hook 'c++-mode-hook
              (lambda ()
                (google-set-c-style)
                (google-make-newline-indent)))))


;; (when (configuration-layer/layer-usedp 'auto-completion)
;;   (defun cc-c++/post-init-company ()
;;     (use-package company
;;       :if (configuration-layer/package-usedp 'company)
;;       :defer t
;;       :init
;;       (progn
;;         (delete 'company-gtags company-backends-c-mode-common)
;;         (delete 'company-etags company-backends-c-mode-common)))))
;;; packages.el ends here
