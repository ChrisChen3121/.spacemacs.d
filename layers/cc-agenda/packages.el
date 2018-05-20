;;; packages.el --- cc-agenda layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: chrischen <chrischen3121@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Code:

(defconst cc-agenda-packages
  '(
    org-agenda
    org-capture
    ))

(defun cc-agenda/post-init-org-capture ()
  (use-package org-capture
    :defer t
    :config
    (setq org-capture-templates
          '(("t" "todo" entry (file org-default-notes-file)
             "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
            ("n" "note" entry (file org-default-notes-file)
             "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
            ("m" "Meeting" entry (file org-default-notes-file)
             "* MEETING with %? :MEETING:\n%U" :clock-in t :clock-resume t)
            ("h" "Habit" entry (file org-default-notes-file)
             "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n")))
    ))

(defun setup-refile ()
  (with-eval-after-load 'org
    (setq org-refile-targets (quote ((nil :maxlevel . 5)
                                     (org-agenda-files :maxlevel . 5))))
    (setq org-refile-use-outline-path t)
    (setq org-outline-path-complete-in-steps nil)
    (setq org-refile-allow-creating-parent-nodes 'confirm)))

(defun setup-agenda-view ()
  (setq org-agenda-custom-commands
        '(("N" "Notes" tags "NOTE"
           ((org-agenda-overriding-header "Notes")
            (org-tags-match-list-sublevels t)))
          ("h" "Habits" tags-todo "STYLE=\"habit\""
           ((org-agenda-overriding-header "Habits")
            (org-agenda-sorting-strategy
             '(todo-state-down effort-up category-keep))))
          (" " "All todos"
           ((agenda "" nil)
            (tags "REFILE"
                  ((org-agenda-overriding-header "Tasks to Refile")
                   (org-tags-match-list-sublevels nil)))
            (tags-todo "-CANCELLED/!"
                       ((org-agenda-overriding-header "Stuck Projects")
                        (org-agenda-skip-function 'bh/skip-non-stuck-projects)
                        (org-agenda-sorting-strategy
                         '(category-keep))))
            (tags-todo "-HOLD-CANCELLED/!"
                       ((org-agenda-overriding-header "Projects")
                        (org-agenda-skip-function 'bh/skip-non-projects)
                        (org-tags-match-list-sublevels 'indented)
                        (org-agenda-sorting-strategy
                         '(category-keep))))
            (tags-todo "-CANCELLED/!NEXT"
                       ((org-agenda-overriding-header (concat "Project Next Tasks"
                                                              (if bh/hide-scheduled-and-waiting-next-tasks
                                                                  ""
                                                                " (including WAITING and SCHEDULED tasks)")))
                        (org-agenda-skip-function 'bh/skip-projects-and-habits-and-single-tasks)
                        (org-tags-match-list-sublevels t)
                        (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
                        (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)
                        (org-agenda-todo-ignore-with-date bh/hide-scheduled-and-waiting-next-tasks)
                        (org-agenda-sorting-strategy
                         '(todo-state-down effort-up category-keep))))
            (tags-todo "-REFILE-CANCELLED-WAITING-HOLD/!"
                       ((org-agenda-overriding-header (concat "Project Subtasks"
                                                              (if bh/hide-scheduled-and-waiting-next-tasks
                                                                  ""
                                                                " (including WAITING and SCHEDULED tasks)")))
                        (org-agenda-skip-function 'bh/skip-non-project-tasks)
                        (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
                        (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)
                        (org-agenda-todo-ignore-with-date bh/hide-scheduled-and-waiting-next-tasks)
                        (org-agenda-sorting-strategy
                         '(category-keep))))
            (tags-todo "-REFILE-CANCELLED-WAITING-HOLD/!"
                       ((org-agenda-overriding-header (concat "Standalone Tasks"
                                                              (if bh/hide-scheduled-and-waiting-next-tasks
                                                                  ""
                                                                " (including WAITING and SCHEDULED tasks)")))
                        (org-agenda-skip-function 'bh/skip-project-tasks)
                        (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
                        (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)
                        (org-agenda-todo-ignore-with-date bh/hide-scheduled-and-waiting-next-tasks)
                        (org-agenda-sorting-strategy
                         '(category-keep))))
            (tags-todo "-CANCELLED+WAITING|HOLD/!"
                       ((org-agenda-overriding-header (concat "Waiting and Postponed Tasks"
                                                              (if bh/hide-scheduled-and-waiting-next-tasks
                                                                  ""
                                                                " (including WAITING and SCHEDULED tasks)")))
                        (org-agenda-skip-function 'bh/skip-non-tasks)
                        (org-tags-match-list-sublevels nil)
                        (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
                        (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)))
            (tags "-REFILE/"
                  ((org-agenda-overriding-header "Tasks to Archive")
                   (org-agenda-skip-function 'bh/skip-non-archivable-tasks)
                   (org-tags-match-list-sublevels nil))))
           nil)))
  )

(defun set-todo-keywords ()
  (setq org-todo-keywords
        (quote ((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
                (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE" "MEETING"))))
  (setq org-todo-keyword-faces
        (quote (("TODO" :foreground "red" :weight bold)
                ("NEXT" :foreground "blue" :weight bold)
                ("DONE" :foreground "forest green" :weight bold)
                ("WAITING" :foreground "orange" :weight bold)
                ("HOLD" :foreground "magenta" :weight bold)
                ("CANCELLED" :foreground "forest green" :weight bold)
                ("MEETING" :foreground "forest green" :weight bold)
                ("PHONE" :foreground "forest green" :weight bold))))
  (setq org-todo-state-tags-triggers
        (quote (("CANCELLED" ("CANCELLED" . t))
                ("WAITING" ("WAITING" . t))
                ("HOLD" ("WAITING") ("HOLD" . t))
                (done ("WAITING") ("HOLD"))
                ("TODO" ("WAITING") ("CANCELLED") ("HOLD"))
                ("NEXT" ("WAITING") ("CANCELLED") ("HOLD"))
                ("DONE" ("WAITING") ("CANCELLED") ("HOLD"))))))


(defun cc-agenda/post-init-org-agenda ()
  (setq agenda-root "~/Dropbox/todo")
  (setq org-default-notes-file (concat agenda-root "/refile.org"))
  (setq org-agenda-files (list agenda-root))
  (set-todo-keywords)
  (setup-agenda-view)
  (setup-refile)
  (setq org-agenda-span 'day)
  (setq org-deadline-warning-days 10)
  (setq org-agenda-auto-exclude-function 'bh/org-auto-exclude-function)
  )

;;; packages.el ends here
