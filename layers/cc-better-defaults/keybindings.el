(which-key-add-key-based-replacements
  "C-c @" "hs"
  "C-c ," "semantic"
  "C-c C-w" "eyebrowse"
  "C-c C-d" "describe"
  "C-x ESC" "redo"
  "C-x RET" "lang env"
  "C-x 4" "other window"
  "C-x 5" "other frame"
  "C-x 8" "special char"
  "C-x @" "event apply"
  "C-x a" "abbrev"
  "C-x n" "narrow"
  "C-x r" "retangle|register"
  "C-x X" "edebug"
  "C-x C-a" "edebug-mode"
  "C-c !" "flycheck"
  "C-c p" "projectile"
  )

(global-set-key (kbd "S-SPC") 'set-mark-command)
(global-set-key (kbd "<backtab>") 'spacemacs/indent-region-or-buffer)
