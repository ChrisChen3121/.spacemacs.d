;;; packages.el --- cc-puml layer packages file for Spacemacs.
;;
;; Copyright (c) 2016 ChrisChen
;;
;; Author: ChrisChen <ChrisChen3121@gmail.com>
;; URL: https://github.com/ChrisChen3121/.spacemacs.d
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3


(defconst cc-puml-packages
  '(
    puml-mode
    ))

(defun cc-puml/init-puml-mode ()
  (use-package puml-mode
    :defer t
    :init
    (progn
      (setq puml-plantuml-jar-path "/home/chrischen/tools/plantuml.jar")
      (add-to-list 'auto-mode-alist '("\\.puml\\'" . puml-mode)))
    :config
    (add-hook 'org-mode-hook
              (lambda () (add-to-list
                          'org-src-lang-modes '("plantuml" . puml))))
    ))


;;; packages.el ends here
