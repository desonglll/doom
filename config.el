;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq backup-directory-alist `(("." . "~/.emacs.d/backups/")))
(setq auto-save-file-name-transforms `((".*" "~/.emacs.d/backups/" t)))

(map! :g
      "M-<f1>" #'magit-status
      "M-<f2>" #'dirvish
      "C-," #'duplicate-line
      "C-:" #'avy-goto-char-2
      "s-\\" #'avy-goto-char-2
      "M-#" #'consult-fd
      "s-u" #'revert-buffer
      "s-i" #'imenu-list
      "s-e" #'treemacs
      "M-o" #'ace-window)

(setq symbols-outline-window-position 'right)

(add-to-list 'exec-path "/opt/homebrew/bin/")
(add-to-list 'exec-path "~/.local/bin/")

(after! eglot
  (add-to-list 'eglot-server-programs '((python-mode python-ts-mode) . ("ty" "server")))
  (add-to-list 'eglot-server-programs '((ruby-mode ruby-ts-mode) . ("ruby-lsp")))
  (add-to-list 'eglot-server-programs '((typescript-mode typescript-ts-mode) . ("tsc" "--lsp" "--stdio")))
  (setq elixir-lsp-path "~/elixir-ls-v0.31.1/")
  (add-to-list 'eglot-server-programs `((elixir-mode elixir-ts-mode) . (,(expand-file-name "language_server.sh" elixir-lsp-path)))))

(after! pyim-basedict
  (pyim-basedict-enable)

  )

(after! consult
  (consult-customize
   consult-ripgrep consult-git-grep consult-grep consult-man
   consult-bookmark consult-recent-file consult-xref
   consult-source-bookmark consult-source-file-register
   consult-source-recent-file consult-source-project-recent-file
   :preview-key '(:debounce 0.4 any))
  )


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;; (setq doom-font (font-spec :family "Terminess Nerd Font" :size 25 :weight 'regular)
;;       doom-variable-pitch-font (font-spec :family "Terminess Nerd Font" :size 25))

(setq doom-font (font-spec :family "Iosevka Term SS15" :size 16 :weight 'regular)
      doom-variable-pitch-font (font-spec :family "Iosevka Term SS15" :size 16))

(add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-hook 'emacs-startup-hook
          (lambda ()
            (select-frame-set-input-focus (selected-frame))))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'gruber-darker)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `with-eval-after-load' block, otherwise Doom's defaults may override your
;; settings. E.g.
;;
;;   (with-eval-after-load 'PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look them up).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys

(use-package! yasnippet
  :config
  (yas-global-mode 1)
  )

;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
