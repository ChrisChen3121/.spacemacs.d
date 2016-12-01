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
    semantic
    ))

(defun cc-c++/init-google-c-style ()
  (use-package google-c-style
    :defer t
    :init
    (add-hook 'c++-mode-hook
              (lambda ()
                (google-set-c-style)
                (google-make-newline-indent)
                (when (configuration-layer/package-usedp 'projectile)
                  (progn
                    (add-to-list 'projectile-other-file-alist '("h" "cc"))
                    (add-to-list 'projectile-other-file-alist '("cc" "h"))))))))

(when (configuration-layer/layer-usedp 'auto-completion)
  (defun cc-c++/post-init-company ()
    (use-package company
      :if (configuration-layer/package-usedp 'company)
      :defer t
      :init
      (progn
        (setq company-async-timeout 5)
        (setq company-backends-c-mode-common
              '((company-c-headers
                 company-semantic
                 ;; (company-dabbrev-code company-gtags company-etags company-keywords)
                 company-files
                 company-dabbrev)))
        ))))

(when (configuration-layer/layer-usedp 'semantic)
  (defun cc-c++/post-init-semantic ()
    (use-package semantic
      :if (configuration-layer/package-usedp 'semantic)
      :defer t
      :init
      (progn (add-to-list 'semantic-default-submodes
                          'global-semantic-idle-local-symbol-highlight-mode)))))

;;; packages.el ends here
