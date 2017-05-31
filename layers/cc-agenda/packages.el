;;; packages.el --- cc-agenda layer packages file for Spacemacs.
;;
;; Copyright (c) 2016 ChrisChen
;;
;; Author: ChrisChen <ChrisChen3121@gmail.com>
;; URL: https://github.com/ChrisChen3121/.spacemacs.d
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(defconst cc-agenda-packages
  '(
    org
    org-agenda
    ))

(defun cc-agenda/post-init-org ()
  (progn
    (setq org-directory "~/Dropbox/todo")

    (global-set-key (kbd "C-c g") 'org-clock-goto)
    (global-set-key (kbd "C-c o i") 'org-clock-in)
    (global-set-key (kbd "C-c o o") 'org-clock-out)
    (global-set-key (kbd "C-c o I") 'bh/punch-in)
    (global-set-key (kbd "C-c o O") 'bh/punch-out)

    ;;==============================================
    ;; todo keywords
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
                  ("DONE" ("WAITING") ("CANCELLED") ("HOLD")))))

    ;;===============================================
    ;; org capture


    ;;==============================================
    ;; refile setup
    ; Targets include this file and any file contributing to the agenda - up to 9 levels deep
    ;; (setq org-refile-targets (quote ((nil :maxlevel . 9)
    ;;                                  (org-agenda-files :maxlevel . 9))))

    ;;                                     ;; Use full outline paths for refile targets - we file directly with IDO
    ;; (setq org-refile-use-outline-path t)

    ;;                                     ;; Targets complete directly with IDO
    ;; (setq org-outline-path-complete-in-steps nil)

    ;;                                     ;; Allow refile to create parent tasks with confirmation
    ;; (setq org-refile-allow-creating-parent-nodes (quote confirm))

    ;;                                     ;; Use IDO for both buffer and file completion and ido-everywhere to t
    ;; (setq org-completion-use-ido t)
    ;; (setq ido-everywhere t)
    ;; (setq ido-max-directory-size 100000)
    ;; (ido-mode (quote both))
    ;;                                     ;; Use the current window when visiting files and buffers with ido
    ;; (setq ido-default-file-method 'selected-window)
    ;; (setq ido-default-buffer-method 'selected-window)
    ;;                                     ;; Use the current window for indirect buffer display
    ;; (setq org-indirect-buffer-display 'current-window)
    ;; (setq org-refile-target-verify-function 'bh/verify-refile-target)

    ))

(defun cc-agenda/pre-init-org ()
  (progn (setq org-agenda-files '("~/Dropbox/todo"))
         (setq org-clock-out-remove-zero-time-clocks t)
         (with-eval-after-load 'org
           (add-to-list 'org-modules 'org-habit)
           ;;==========================================
           ;; org clock setup
           ;; Resume clocking task when emacs is restarted
           ;; (org-clock-persistence-insinuate)
           ;; ;; Show lot of clocking history so it's easy to pick items off the C-F11 list
           ;; (setq org-clock-history-length 23)
           ;; ;; Resume clocking task on clock-in if the clock is open
           ;; (setq org-clock-in-resume t)
           ;; ;; Change tasks to NEXT when clocking in
           ;; (setq org-clock-in-switch-to-state 'bh/clock-in-to-next)
           ;; ;; Separate drawers for clocking and logs
           ;; (setq org-drawers (quote ("PROPERTIES" "LOGBOOK")))
           ;; ;; Save clock data and state changes and notes in the LOGBOOK drawer
           ;; (setq org-clock-into-drawer t)
           ;; ;; Sometimes I change tasks I'm clocking quickly - this removes clocked tasks with 0:00 duration
           ;; (setq org-clock-out-remove-zero-time-clocks t)
           ;; ;; Clock out when moving task to a done state
           ;; (setq org-clock-out-when-done t)
           ;; ;; Save the running clock and all clock history when exiting Emacs, load it on startup
           ;; (setq org-clock-persist t)
           ;; ;; Do not prompt to resume an active clock
           ;; (setq org-clock-persist-query-resume nil)
           ;; ;; Enable auto clock resolution for finding open clocks
           ;; (setq org-clock-auto-clock-resolution (quote when-no-clock-is-running))
           ;; ;; Include current clocking task in clock reports
           ;; (setq org-clock-report-include-clocking-task t)
           ;; (setq bh/keep-clock-running nil)
           ;; (add-hook 'org-clock-out-hook 'bh/clock-out-maybe 'append)
           )
         (with-eval-after-load 'org-capture
           (setq org-default-notes-file (concat org-directory "/refile.org"))
           (setq org-capture-templates
                 '(("t" "todo" entry (file org-default-notes-file)
                    "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
                   ("n" "note" entry (file org-default-notes-file)
                    "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
                   ("m" "Meeting" entry (file org-default-notes-file)
                    "* MEETING with %? :MEETING:\n%U" :clock-in t :clock-resume t)
                   ("h" "Habit" entry (file org-default-notes-file)
                    "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n")))
           )
         ))

(defun cc-agenda/post-init-org-agenda ()
  (progn
    (setq org-agenda-auto-exclude-function 'bh/org-auto-exclude-function)

    ;; ==========================================
    ;; custom agenda view
    (setq org-agenda-custom-commands
          '(("N" "Notes" tags "NOTE"
             ((org-agenda-overriding-header "Notes")
              (org-tags-match-list-sublevels t)))
            ("h" "Habits" tags-todo "STYLE=\"habit\""
             ((org-agenda-overriding-header "Habits")
              (org-agenda-sorting-strategy
               '(todo-state-down effort-up category-keep))))
            ("x" "All todos"
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
    ))
