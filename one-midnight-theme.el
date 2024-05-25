;;; one-midnight-theme.el --- One Midnight color theme

;; Copyright 2015-2019 Jonathan Chu

;; Author: Jonathan Chu <me@jonathanchu.is>
;; URL: https://github.com/jonathanchu/one-midnight-theme
;; Version: 0.4.0

;; This file is not part of GNU Emacs.

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; An Emacs port of the Atom One Dark theme from Atom.io, now in midnight blurple.

;;; Code:

(deftheme one-midnight
  "One Midnight - An Emacs port of the Atom One Dark theme from Atom.io, now in midnight blurple.")

(defvar one-midnight-colors-alist
  (let* ((256color  (eq (display-color-cells (selected-frame)) 256))
         (colors `(("one-midnight-accent"   . "#528BFF")
                   ("one-midnight-fg"       . (if ,256color "color-248" "#ABB2BF"))
                   ("one-midnight-bg"       . (if ,256color "color-235" "#060115"))
                   ("one-midnight-bg-1"     . (if ,256color "color-234" "#121417"))
                   ("one-midnight-bg-hl"    . (if ,256color "color-236" "#2C323C"))
                   ("one-midnight-gutter"   . (if ,256color "color-239" "#4B5363"))
                   ("one-midnight-mono-1"   . (if ,256color "color-248" "#ABB2BF"))
                   ("one-midnight-mono-2"   . (if ,256color "color-244" "#828997"))
                   ("one-midnight-mono-3"   . (if ,256color "color-240" "#5C6370"))
                   ("one-midnight-cyan"     . "#56B6C2")
                   ("one-midnight-blue"     . "#61AFEF")
                   ("one-midnight-purple"   . "#C678DD")
                   ("one-midnight-green"    . "#98C379")
                   ("one-midnight-red-1"    . "#E06C75")
                   ("one-midnight-red-2"    . "#BE5046")
                   ("one-midnight-orange-1" . "#D19A66")
                   ("one-midnight-orange-2" . "#E5C07B")
                   ("one-midnight-gray"     . (if ,256color "color-237" "#3E4451"))
                   ("one-midnight-silver"   . (if ,256color "color-247" "#9DA5B4"))
                   ("one-midnight-black"    . (if ,256color "color-233" "#130c27"))
                   ("one-midnight-border"   . (if ,256color "color-232" "#181A1F")))))
    colors)
  "List of One Midnight colors.")

(defmacro one-midnight-with-color-variables (&rest body)
  "Bind the colors list around BODY."
  (declare (indent 0))
  `(let ((class '((class color) (min-colors 89)))
         ,@ (mapcar (lambda (cons)
                      (list (intern (car cons)) (cdr cons)))
                    one-midnight-colors-alist))
     ,@body))

(one-midnight-with-color-variables
  (custom-theme-set-faces
   'one-midnight

   `(default ((t (:foreground ,one-midnight-fg :background ,one-midnight-bg))))
   `(success ((t (:foreground ,one-midnight-green))))
   `(warning ((t (:foreground ,one-midnight-orange-2))))
   `(error ((t (:foreground ,one-midnight-red-1 :weight bold))))
   `(link ((t (:foreground ,one-midnight-blue :underline t :weight bold))))
   `(link-visited ((t (:foreground ,one-midnight-blue :underline t :weight normal))))
   `(cursor ((t (:background ,one-midnight-accent))))
   `(fringe ((t (:background ,one-midnight-bg))))
   `(region ((t (:background ,one-midnight-gray :distant-foreground ,one-midnight-mono-2))))
   `(highlight ((t (:background ,one-midnight-gray :distant-foreground ,one-midnight-mono-2))))
   `(hl-line ((t (:background ,one-midnight-bg-hl :distant-foreground nil))))
   `(header-line ((t (:background ,one-midnight-black))))
   `(vertical-border ((t (:background ,one-midnight-border :foreground ,one-midnight-border))))
   `(secondary-selection ((t (:background ,one-midnight-bg-1))))
   `(query-replace ((t (:inherit (isearch)))))
   `(minibuffer-prompt ((t (:foreground ,one-midnight-silver))))
   `(tooltip ((t (:foreground ,one-midnight-fg :background ,one-midnight-bg-1 :inherit variable-pitch))))

   `(font-lock-builtin-face ((t (:foreground ,one-midnight-cyan))))
   `(font-lock-comment-face ((t (:foreground ,one-midnight-mono-3 :slant italic))))
   `(font-lock-comment-delimiter-face ((default (:inherit (font-lock-comment-face)))))
   `(font-lock-doc-face ((t (:inherit (font-lock-string-face)))))
   `(font-lock-function-name-face ((t (:foreground ,one-midnight-blue))))
   `(font-lock-keyword-face ((t (:foreground ,one-midnight-purple :weight normal))))
   `(font-lock-preprocessor-face ((t (:foreground ,one-midnight-mono-2))))
   `(font-lock-string-face ((t (:foreground ,one-midnight-green))))
   `(font-lock-type-face ((t (:foreground ,one-midnight-orange-2))))
   `(font-lock-constant-face ((t (:foreground ,one-midnight-cyan))))
   `(font-lock-variable-name-face ((t (:foreground ,one-midnight-red-1))))
   `(font-lock-warning-face ((t (:foreground ,one-midnight-mono-3 :bold t))))
   `(font-lock-negation-char-face ((t (:foreground ,one-midnight-cyan :bold t))))

   ;; mode-line
   `(mode-line ((t (:background ,one-midnight-black :foreground ,one-midnight-silver :box (:color ,one-midnight-border :line-width 1)))))
   `(mode-line-buffer-id ((t (:weight bold))))
   `(mode-line-emphasis ((t (:weight bold))))
   `(mode-line-inactive ((t (:background ,one-midnight-border :foreground ,one-midnight-gray :box (:color ,one-midnight-border :line-width 1)))))

   ;; window-divider
   `(window-divider ((t (:foreground ,one-midnight-border))))
   `(window-divider-first-pixel ((t (:foreground ,one-midnight-border))))
   `(window-divider-last-pixel ((t (:foreground ,one-midnight-border))))

   ;; custom
   `(custom-state ((t (:foreground ,one-midnight-green))))

   ;; ido
   `(ido-first-match ((t (:foreground ,one-midnight-purple :weight bold))))
   `(ido-only-match ((t (:foreground ,one-midnight-red-1 :weight bold))))
   `(ido-subdir ((t (:foreground ,one-midnight-blue))))
   `(ido-virtual ((t (:foreground ,one-midnight-mono-3))))

   ;; ace-jump
   `(ace-jump-face-background ((t (:foreground ,one-midnight-mono-3 :background ,one-midnight-bg-1 :inverse-video nil))))
   `(ace-jump-face-foreground ((t (:foreground ,one-midnight-red-1 :background ,one-midnight-bg-1 :inverse-video nil))))

   ;; ace-window
   `(aw-background-face ((t (:inherit font-lock-comment-face))))
   `(aw-leading-char-face ((t (:foreground ,one-midnight-red-1 :weight bold))))

   ;; centaur-tabs
   `(centaur-tabs-default ((t (:background ,one-midnight-black :foreground ,one-midnight-black))))
   `(centaur-tabs-selected ((t (:background ,one-midnight-bg :foreground ,one-midnight-fg :weight bold))))
   `(centaur-tabs-unselected ((t (:background ,one-midnight-black :foreground ,one-midnight-fg :weight light))))
   `(centaur-tabs-selected-modified ((t (:background ,one-midnight-bg
                                                     :foreground ,one-midnight-blue :weight bold))))
   `(centaur-tabs-unselected-modified ((t (:background ,one-midnight-black :weight light
                                                       :foreground ,one-midnight-blue))))
   `(centaur-tabs-active-bar-face ((t (:background ,one-midnight-accent))))
   `(centaur-tabs-modified-marker-selected ((t (:inherit 'centaur-tabs-selected :foreground,one-midnight-accent))))
   `(centaur-tabs-modified-marker-unselected ((t (:inherit 'centaur-tabs-unselected :foreground,one-midnight-accent))))

   ;; company-mode
   `(company-tooltip ((t (:foreground ,one-midnight-fg :background ,one-midnight-bg-1))))
   `(company-tooltip-annotation ((t (:foreground ,one-midnight-mono-2 :background ,one-midnight-bg-1))))
   `(company-tooltip-annotation-selection ((t (:foreground ,one-midnight-mono-2 :background ,one-midnight-gray))))
   `(company-tooltip-selection ((t (:foreground ,one-midnight-fg :background ,one-midnight-gray))))
   `(company-tooltip-mouse ((t (:background ,one-midnight-gray))))
   `(company-tooltip-common ((t (:foreground ,one-midnight-orange-2 :background ,one-midnight-bg-1))))
   `(company-tooltip-common-selection ((t (:foreground ,one-midnight-orange-2 :background ,one-midnight-gray))))
   `(company-preview ((t (:background ,one-midnight-bg))))
   `(company-preview-common ((t (:foreground ,one-midnight-orange-2 :background ,one-midnight-bg))))
   `(company-scrollbar-fg ((t (:background ,one-midnight-mono-1))))
   `(company-scrollbar-bg ((t (:background ,one-midnight-bg-1))))
   `(company-template-field ((t (:inherit highlight))))

   ;; doom-modeline
   `(doom-modeline-bar ((t (:background ,one-midnight-accent))))

   ;; flyspell
   `(flyspell-duplicate ((t (:underline (:color ,one-midnight-orange-1 :style wave)))))
   `(flyspell-incorrect ((t (:underline (:color ,one-midnight-red-1 :style wave)))))

   ;; flymake
   `(flymake-error ((t (:underline (:color ,one-midnight-red-1 :style wave)))))
   `(flymake-note ((t (:underline (:color ,one-midnight-green :style wave)))))
   `(flymake-warning ((t (:underline (:color ,one-midnight-orange-1 :style wave)))))

   ;; flycheck
   `(flycheck-error ((t (:underline (:color ,one-midnight-red-1 :style wave)))))
   `(flycheck-info ((t (:underline (:color ,one-midnight-green :style wave)))))
   `(flycheck-warning ((t (:underline (:color ,one-midnight-orange-1 :style wave)))))

   ;; compilation
   `(compilation-face ((t (:foreground ,one-midnight-fg))))
   `(compilation-line-number ((t (:foreground ,one-midnight-mono-2))))
   `(compilation-column-number ((t (:foreground ,one-midnight-mono-2))))
   `(compilation-mode-line-exit ((t (:inherit compilation-info :weight bold))))
   `(compilation-mode-line-fail ((t (:inherit compilation-error :weight bold))))

   ;; isearch
   `(isearch ((t (:foreground ,one-midnight-bg :background ,one-midnight-purple))))
   `(isearch-fail ((t (:foreground ,one-midnight-red-2 :background nil))))
   `(lazy-highlight ((t (:foreground ,one-midnight-purple :background ,one-midnight-bg-1 :underline ,one-midnight-purple))))

   ;; diff-hl (https://github.com/dgutov/diff-hl)
   '(diff-hl-change ((t (:foreground "#E9C062" :background "#8b733a"))))
   '(diff-hl-delete ((t (:foreground "#CC6666" :background "#7a3d3d"))))
   '(diff-hl-insert ((t (:foreground "#A8FF60" :background "#547f30"))))

   ;; dired-mode
   '(dired-directory ((t (:inherit (font-lock-keyword-face)))))
   '(dired-flagged ((t (:inherit (diff-hl-delete)))))
   '(dired-symlink ((t (:foreground "#FD5FF1"))))

   ;; dired-async
   `(dired-async-failures ((t (:inherit error))))
   `(dired-async-message ((t (:inherit success))))
   `(dired-async-mode-message ((t (:foreground ,one-midnight-orange-1))))

   ;; helm
   `(helm-header ((t (:foreground ,one-midnight-mono-2
                                  :background ,one-midnight-bg
                                  :underline nil
                                  :box (:line-width 6 :color ,one-midnight-bg)))))
   `(helm-source-header ((t (:foreground ,one-midnight-orange-2
                                         :background ,one-midnight-bg
                                         :underline nil
                                         :weight bold
                                         :box (:line-width 6 :color ,one-midnight-bg)))))
   `(helm-selection ((t (:background ,one-midnight-gray))))
   `(helm-selection-line ((t (:background ,one-midnight-gray))))
   `(helm-visible-mark ((t (:background ,one-midnight-bg :foreground ,one-midnight-orange-2))))
   `(helm-candidate-number ((t (:foreground ,one-midnight-green :background ,one-midnight-bg-1))))
   `(helm-separator ((t (:background ,one-midnight-bg :foreground ,one-midnight-red-1))))
   `(helm-M-x-key ((t (:foreground ,one-midnight-orange-1))))
   `(helm-bookmark-addressbook ((t (:foreground ,one-midnight-orange-1))))
   `(helm-bookmark-directory ((t (:foreground nil :background nil :inherit helm-ff-directory))))
   `(helm-bookmark-file ((t (:foreground nil :background nil :inherit helm-ff-file))))
   `(helm-bookmark-gnus ((t (:foreground ,one-midnight-purple))))
   `(helm-bookmark-info ((t (:foreground ,one-midnight-green))))
   `(helm-bookmark-man ((t (:foreground ,one-midnight-orange-2))))
   `(helm-bookmark-w3m ((t (:foreground ,one-midnight-purple))))
   `(helm-match ((t (:foreground ,one-midnight-orange-2))))
   `(helm-ff-directory ((t (:foreground ,one-midnight-cyan :background ,one-midnight-bg :weight bold))))
   `(helm-ff-file ((t (:foreground ,one-midnight-fg :background ,one-midnight-bg :weight normal))))
   `(helm-ff-executable ((t (:foreground ,one-midnight-green :background ,one-midnight-bg :weight normal))))
   `(helm-ff-invalid-symlink ((t (:foreground ,one-midnight-red-1 :background ,one-midnight-bg :weight bold))))
   `(helm-ff-symlink ((t (:foreground ,one-midnight-orange-2 :background ,one-midnight-bg :weight bold))))
   `(helm-ff-prefix ((t (:foreground ,one-midnight-bg :background ,one-midnight-orange-2 :weight normal))))
   `(helm-buffer-not-saved ((t (:foreground ,one-midnight-red-1))))
   `(helm-buffer-process ((t (:foreground ,one-midnight-mono-2))))
   `(helm-buffer-saved-out ((t (:foreground ,one-midnight-fg))))
   `(helm-buffer-size ((t (:foreground ,one-midnight-mono-2))))
   `(helm-buffer-directory ((t (:foreground ,one-midnight-purple))))
   `(helm-grep-cmd-line ((t (:foreground ,one-midnight-cyan))))
   `(helm-grep-file ((t (:foreground ,one-midnight-fg))))
   `(helm-grep-finish ((t (:foreground ,one-midnight-green))))
   `(helm-grep-lineno ((t (:foreground ,one-midnight-mono-2))))
   `(helm-grep-finish ((t (:foreground ,one-midnight-red-1))))
   `(helm-grep-match ((t (:foreground nil :background nil :inherit helm-match))))
   `(helm-swoop-target-line-block-face ((t (:background ,one-midnight-mono-3 :foreground "#222222"))))
   `(helm-swoop-target-line-face ((t (:background ,one-midnight-mono-3 :foreground "#222222"))))
   `(helm-swoop-target-word-face ((t (:background ,one-midnight-purple :foreground "#ffffff"))))
   `(helm-locate-finish ((t (:foreground ,one-midnight-green))))
   `(info-menu-star ((t (:foreground ,one-midnight-red-1))))

   ;; ivy
   `(ivy-confirm-face ((t (:inherit minibuffer-prompt :foreground ,one-midnight-green))))
   `(ivy-current-match ((t (:background ,one-midnight-gray :weight normal))))
   `(ivy-highlight-face ((t (:inherit font-lock-builtin-face))))
   `(ivy-match-required-face ((t (:inherit minibuffer-prompt :foreground ,one-midnight-red-1))))
   `(ivy-minibuffer-match-face-1 ((t (:background ,one-midnight-bg-hl))))
   `(ivy-minibuffer-match-face-2 ((t (:inherit ivy-minibuffer-match-face-1 :background ,one-midnight-black :foreground ,one-midnight-purple :weight semi-bold))))
   `(ivy-minibuffer-match-face-3 ((t (:inherit ivy-minibuffer-match-face-2 :background ,one-midnight-black :foreground ,one-midnight-green :weight semi-bold))))
   `(ivy-minibuffer-match-face-4 ((t (:inherit ivy-minibuffer-match-face-2 :background ,one-midnight-black :foreground ,one-midnight-orange-2 :weight semi-bold))))
   `(ivy-minibuffer-match-highlight ((t (:inherit ivy-current-match))))
   `(ivy-modified-buffer ((t (:inherit default :foreground ,one-midnight-orange-1))))
   `(ivy-virtual ((t (:inherit font-lock-builtin-face :slant italic))))

   ;; counsel
   `(counsel-key-binding ((t (:foreground ,one-midnight-orange-2 :weight bold))))

   ;; swiper
   `(swiper-match-face-1 ((t (:inherit ivy-minibuffer-match-face-1))))
   `(swiper-match-face-2 ((t (:inherit ivy-minibuffer-match-face-2))))
   `(swiper-match-face-3 ((t (:inherit ivy-minibuffer-match-face-3))))
   `(swiper-match-face-4 ((t (:inherit ivy-minibuffer-match-face-4))))

   ;; git-commit
   `(git-commit-comment-action  ((t (:foreground ,one-midnight-green :weight bold))))
   `(git-commit-comment-branch  ((t (:foreground ,one-midnight-blue :weight bold))))
   `(git-commit-comment-heading ((t (:foreground ,one-midnight-orange-2 :weight bold))))

   ;; git-gutter
   `(git-gutter:added ((t (:foreground ,one-midnight-green :weight bold))))
   `(git-gutter:deleted ((t (:foreground ,one-midnight-red-1 :weight bold))))
   `(git-gutter:modified ((t (:foreground ,one-midnight-orange-1 :weight bold))))

   ;; eshell
   `(eshell-ls-archive ((t (:foreground ,one-midnight-purple :weight bold))))
   `(eshell-ls-backup ((t (:foreground ,one-midnight-orange-2))))
   `(eshell-ls-clutter ((t (:foreground ,one-midnight-red-2 :weight bold))))
   `(eshell-ls-directory ((t (:foreground ,one-midnight-blue :weight bold))))
   `(eshell-ls-executable ((t (:foreground ,one-midnight-green :weight bold))))
   `(eshell-ls-missing ((t (:foreground ,one-midnight-red-1 :weight bold))))
   `(eshell-ls-product ((t (:foreground ,one-midnight-orange-2))))
   `(eshell-ls-special ((t (:foreground "#FD5FF1" :weight bold))))
   `(eshell-ls-symlink ((t (:foreground ,one-midnight-cyan :weight bold))))
   `(eshell-ls-unreadable ((t (:foreground ,one-midnight-mono-1))))
   `(eshell-prompt ((t (:inherit minibuffer-prompt))))

   ;; man
   `(Man-overstrike ((t (:inherit font-lock-type-face :weight bold))))
   `(Man-underline ((t (:inherit font-lock-keyword-face :slant italic :weight bold))))

   ;; woman
   `(woman-bold ((t (:inherit font-lock-type-face :weight bold))))
   `(woman-italic ((t (:inherit font-lock-keyword-face :slant italic :weight bold))))

   ;; dictionary
   `(dictionary-button-face ((t (:inherit widget-button))))
   `(dictionary-reference-face ((t (:inherit font-lock-type-face :weight bold))))
   `(dictionary-word-entry-face ((t (:inherit font-lock-keyword-face :slant italic :weight bold))))

   ;; erc
   `(erc-error-face ((t (:inherit error))))
   `(erc-input-face ((t (:inherit shadow))))
   `(erc-my-nick-face ((t (:foreground ,one-midnight-accent))))
   `(erc-notice-face ((t (:inherit font-lock-comment-face))))
   `(erc-timestamp-face ((t (:foreground ,one-midnight-green :weight bold))))

   ;; jabber
   `(jabber-roster-user-online ((t (:foreground ,one-midnight-green))))
   `(jabber-roster-user-away ((t (:foreground ,one-midnight-red-1))))
   `(jabber-roster-user-xa ((t (:foreground ,one-midnight-red-2))))
   `(jabber-roster-user-dnd ((t (:foreground ,one-midnight-purple))))
   `(jabber-roster-user-chatty ((t (:foreground ,one-midnight-orange-2))))
   `(jabber-roster-user-error ((t (:foreground ,one-midnight-red-1 :bold t))))
   `(jabber-roster-user-offline ((t (:foreground ,one-midnight-mono-3))))
   `(jabber-chat-prompt-local ((t (:foreground ,one-midnight-blue))))
   `(jabber-chat-prompt-foreign ((t (:foreground ,one-midnight-orange-2))))
   `(jabber-chat-prompt-system ((t (:foreground ,one-midnight-mono-3))))
   `(jabber-chat-error ((t (:inherit jabber-roster-user-error))))
   `(jabber-rare-time-face ((t (:foreground ,one-midnight-cyan))))
   `(jabber-activity-face ((t (:inherit jabber-chat-prompt-foreign))))
   `(jabber-activity-personal-face ((t (:inherit jabber-chat-prompt-local))))

   ;; eww
   `(eww-form-checkbox ((t (:inherit eww-form-submit))))
   `(eww-form-file ((t (:inherit eww-form-submit))))
   `(eww-form-select ((t (:inherit eww-form-submit))))
   `(eww-form-submit ((t (:background ,one-midnight-gray :foreground ,one-midnight-fg :box (:line-width 2 :color ,one-midnight-border :style released-button)))))
   `(eww-form-text ((t (:inherit widget-field :box (:line-width 1 :color ,one-midnight-border)))))
   `(eww-form-textarea ((t (:inherit eww-form-text))))
   `(eww-invalid-certificate ((t (:foreground ,one-midnight-red-1))))
   `(eww-valid-certificate ((t (:foreground ,one-midnight-green))))

   ;; js2-mode
   `(js2-error ((t (:underline (:color ,one-midnight-red-1 :style wave)))))
   `(js2-external-variable ((t (:foreground ,one-midnight-cyan))))
   `(js2-warning ((t (:underline (:color ,one-midnight-orange-1 :style wave)))))
   `(js2-function-call ((t (:inherit (font-lock-function-name-face)))))
   `(js2-function-param ((t (:foreground ,one-midnight-mono-1))))
   `(js2-jsdoc-tag ((t (:foreground ,one-midnight-purple))))
   `(js2-jsdoc-type ((t (:foreground ,one-midnight-orange-2))))
   `(js2-jsdoc-value((t (:foreground ,one-midnight-red-1))))
   `(js2-object-property ((t (:foreground ,one-midnight-red-1))))

   ;; ediff
   `(ediff-fine-diff-Ancestor                ((t (:background "#885555"))))
   `(ediff-fine-diff-A                       ((t (:background "#885555"))))
   `(ediff-fine-diff-B                       ((t (:background "#558855"))))
   `(ediff-fine-diff-C                       ((t (:background "#555588"))))
   `(ediff-current-diff-Ancestor             ((t (:background "#663333"))))
   `(ediff-current-diff-A                    ((t (:background "#663333"))))
   `(ediff-current-diff-B                    ((t (:background "#336633"))))
   `(ediff-current-diff-C                    ((t (:background "#333366"))))
   `(ediff-even-diff-Ancestor                ((t (:background "#181a1f"))))
   `(ediff-even-diff-A                       ((t (:background "#181a1f"))))
   `(ediff-even-diff-B                       ((t (:background "#181a1f"))))
   `(ediff-even-diff-C                       ((t (:background "#181a1f"))))
   `(ediff-odd-diff-Ancestor                 ((t (:background "#181a1f"))))
   `(ediff-odd-diff-A                        ((t (:background "#181a1f"))))
   `(ediff-odd-diff-B                        ((t (:background "#181a1f"))))
   `(ediff-odd-diff-C                        ((t (:background "#181a1f"))))

   ;; magit
   `(magit-section-highlight ((t (:background ,one-midnight-bg-hl))))
   `(magit-section-heading ((t (:foreground ,one-midnight-orange-2 :weight bold))))
   `(magit-section-heading-selection ((t (:foreground ,one-midnight-fg :weight bold))))
   `(magit-diff-file-heading ((t (:weight bold))))
   `(magit-diff-file-heading-highlight ((t (:background ,one-midnight-gray :weight bold))))
   `(magit-diff-file-heading-selection ((t (:foreground ,one-midnight-orange-2 :background ,one-midnight-bg-hl :weight bold))))
   `(magit-diff-hunk-heading ((t (:foreground ,one-midnight-mono-2 :background ,one-midnight-gray))))
   `(magit-diff-hunk-heading-highlight ((t (:foreground ,one-midnight-mono-1 :background ,one-midnight-mono-3))))
   `(magit-diff-hunk-heading-selection ((t (:foreground ,one-midnight-purple :background ,one-midnight-mono-3))))
   `(magit-diff-context ((t (:foreground ,one-midnight-fg))))
   `(magit-diff-context-highlight ((t (:background ,one-midnight-bg-1 :foreground ,one-midnight-fg))))
   `(magit-diffstat-added ((t (:foreground ,one-midnight-green))))
   `(magit-diffstat-removed ((t (:foreground ,one-midnight-red-1))))
   `(magit-process-ok ((t (:foreground ,one-midnight-green))))
   `(magit-process-ng ((t (:foreground ,one-midnight-red-1))))
   `(magit-log-author ((t (:foreground ,one-midnight-orange-2))))
   `(magit-log-date ((t (:foreground ,one-midnight-mono-2))))
   `(magit-log-graph ((t (:foreground ,one-midnight-silver))))
   `(magit-sequence-pick ((t (:foreground ,one-midnight-orange-2))))
   `(magit-sequence-stop ((t (:foreground ,one-midnight-green))))
   `(magit-sequence-part ((t (:foreground ,one-midnight-orange-1))))
   `(magit-sequence-head ((t (:foreground ,one-midnight-blue))))
   `(magit-sequence-drop ((t (:foreground ,one-midnight-red-1))))
   `(magit-sequence-done ((t (:foreground ,one-midnight-mono-2))))
   `(magit-sequence-onto ((t (:foreground ,one-midnight-mono-2))))
   `(magit-bisect-good ((t (:foreground ,one-midnight-green))))
   `(magit-bisect-skip ((t (:foreground ,one-midnight-orange-1))))
   `(magit-bisect-bad ((t (:foreground ,one-midnight-red-1))))
   `(magit-blame-heading ((t (:background ,one-midnight-bg-1 :foreground ,one-midnight-mono-2))))
   `(magit-blame-hash ((t (:background ,one-midnight-bg-1 :foreground ,one-midnight-purple))))
   `(magit-blame-name ((t (:background ,one-midnight-bg-1 :foreground ,one-midnight-orange-2))))
   `(magit-blame-date ((t (:background ,one-midnight-bg-1 :foreground ,one-midnight-mono-3))))
   `(magit-blame-summary ((t (:background ,one-midnight-bg-1 :foreground ,one-midnight-mono-2))))
   `(magit-dimmed ((t (:foreground ,one-midnight-mono-2))))
   `(magit-hash ((t (:foreground ,one-midnight-purple))))
   `(magit-tag  ((t (:foreground ,one-midnight-orange-1 :weight bold))))
   `(magit-branch-remote  ((t (:foreground ,one-midnight-green :weight bold))))
   `(magit-branch-local   ((t (:foreground ,one-midnight-blue :weight bold))))
   `(magit-branch-current ((t (:foreground ,one-midnight-blue :weight bold :box t))))
   `(magit-head           ((t (:foreground ,one-midnight-blue :weight bold))))
   `(magit-refname        ((t (:background ,one-midnight-bg :foreground ,one-midnight-fg :weight bold))))
   `(magit-refname-stash  ((t (:background ,one-midnight-bg :foreground ,one-midnight-fg :weight bold))))
   `(magit-refname-wip    ((t (:background ,one-midnight-bg :foreground ,one-midnight-fg :weight bold))))
   `(magit-signature-good      ((t (:foreground ,one-midnight-green))))
   `(magit-signature-bad       ((t (:foreground ,one-midnight-red-1))))
   `(magit-signature-untrusted ((t (:foreground ,one-midnight-orange-1))))
   `(magit-cherry-unmatched    ((t (:foreground ,one-midnight-cyan))))
   `(magit-cherry-equivalent   ((t (:foreground ,one-midnight-purple))))
   `(magit-reflog-commit       ((t (:foreground ,one-midnight-green))))
   `(magit-reflog-amend        ((t (:foreground ,one-midnight-purple))))
   `(magit-reflog-merge        ((t (:foreground ,one-midnight-green))))
   `(magit-reflog-checkout     ((t (:foreground ,one-midnight-blue))))
   `(magit-reflog-reset        ((t (:foreground ,one-midnight-red-1))))
   `(magit-reflog-rebase       ((t (:foreground ,one-midnight-purple))))
   `(magit-reflog-cherry-pick  ((t (:foreground ,one-midnight-green))))
   `(magit-reflog-remote       ((t (:foreground ,one-midnight-cyan))))
   `(magit-reflog-other        ((t (:foreground ,one-midnight-cyan))))

   ;; message
   `(message-cited-text ((t (:foreground ,one-midnight-green))))
   `(message-header-cc ((t (:foreground ,one-midnight-orange-1 :weight bold))))
   `(message-header-name ((t (:foreground ,one-midnight-purple))))
   `(message-header-newsgroups ((t (:foreground ,one-midnight-orange-2 :weight bold :slant italic))))
   `(message-header-other ((t (:foreground ,one-midnight-red-1))))
   `(message-header-subject ((t (:foreground ,one-midnight-blue))))
   `(message-header-to ((t (:foreground ,one-midnight-orange-2 :weight bold))))
   `(message-header-xheader ((t (:foreground ,one-midnight-silver))))
   `(message-mml ((t (:foreground ,one-midnight-purple))))
   `(message-separator ((t (:foreground ,one-midnight-mono-3 :slant italic))))

   ;; epa
   `(epa-field-body ((t (:foreground ,one-midnight-blue :slant italic))))
   `(epa-field-name ((t (:foreground ,one-midnight-cyan :weight bold))))

   ;; notmuch
   `(notmuch-crypto-decryption ((t (:foreground ,one-midnight-purple :background ,one-midnight-black))))
   `(notmuch-crypto-signature-bad ((t (:foreground ,one-midnight-red-1 :background ,one-midnight-black))))
   `(notmuch-crypto-signature-good ((t (:foreground ,one-midnight-green :background ,one-midnight-black))))
   `(notmuch-crypto-signature-good-key ((t (:foreground ,one-midnight-green :background ,one-midnight-black))))
   `(notmuch-crypto-signature-unknown ((t (:foreground ,one-midnight-orange-1 :background ,one-midnight-black))))
   `(notmuch-hello-logo-background ((t (:inherit default))))
   `(notmuch-message-summary-face ((t (:background ,one-midnight-black))))
   `(notmuch-search-count ((t (:inherit default :foreground ,one-midnight-silver))))
   `(notmuch-search-date ((t (:inherit default :foreground ,one-midnight-purple))))
   `(notmuch-search-matching-authors ((t (:inherit default :foreground ,one-midnight-orange-2))))
   `(notmuch-search-non-matching-authors ((t (:inherit font-lock-comment-face :slant italic))))
   `(notmuch-tag-added ((t (:underline t))))
   `(notmuch-tag-deleted ((t (:strike-through ,one-midnight-red-2))))
   `(notmuch-tag-face ((t (:foreground ,one-midnight-green))))
   `(notmuch-tag-unread ((t (:foreground ,one-midnight-red-1))))
   `(notmuch-tree-match-author-face ((t (:inherit notmuch-search-matching-authors))))
   `(notmuch-tree-match-date-face ((t (:inherit notmuch-search-date))))
   `(notmuch-tree-match-face ((t (:weight semi-bold))))
   `(notmuch-tree-match-tag-face ((t (:inherit notmuch-tag-face))))
   `(notmuch-tree-no-match-face ((t (:slant italic :weight light :inherit font-lock-comment-face))))

   ;; elfeed
   `(elfeed-log-debug-level-face ((t (:background ,one-midnight-black :foreground ,one-midnight-green))))
   `(elfeed-log-error-level-face ((t (:background ,one-midnight-black :foreground ,one-midnight-red-1))))
   `(elfeed-log-info-level-face ((t (:background ,one-midnight-black :foreground ,one-midnight-blue))))
   `(elfeed-log-warn-level-face ((t (:background ,one-midnight-black :foreground ,one-midnight-orange-1))))
   `(elfeed-search-date-face ((t (:foreground ,one-midnight-purple))))
   `(elfeed-search-feed-face ((t (:foreground ,one-midnight-orange-2))))
   `(elfeed-search-tag-face ((t (:foreground ,one-midnight-green))))
   `(elfeed-search-title-face ((t (:foreground ,one-midnight-mono-1))))
   `(elfeed-search-unread-count-face ((t (:foreground ,one-midnight-silver))))

   ;; perspective
   `(persp-selected-face ((t (:foreground ,one-midnight-blue))))

   ;; powerline
   `(powerline-active1 ((,class (:background ,one-midnight-bg-hl :foreground ,one-midnight-purple))))
   `(powerline-active2 ((,class (:background ,one-midnight-bg-hl :foreground ,one-midnight-purple))))
   `(powerline-inactive1 ((,class (:background ,one-midnight-bg :foreground ,one-midnight-fg))))
   `(powerline-inactive2 ((,class (:background ,one-midnight-bg :foreground ,one-midnight-fg))))

   ;; rainbow-delimiters
   `(rainbow-delimiters-depth-1-face ((t (:foreground ,one-midnight-blue))))
   `(rainbow-delimiters-depth-2-face ((t (:foreground ,one-midnight-green))))
   `(rainbow-delimiters-depth-3-face ((t (:foreground ,one-midnight-orange-1))))
   `(rainbow-delimiters-depth-4-face ((t (:foreground ,one-midnight-cyan))))
   `(rainbow-delimiters-depth-5-face ((t (:foreground ,one-midnight-purple))))
   `(rainbow-delimiters-depth-6-face ((t (:foreground ,one-midnight-orange-2))))
   `(rainbow-delimiters-depth-7-face ((t (:foreground ,one-midnight-blue))))
   `(rainbow-delimiters-depth-8-face ((t (:foreground ,one-midnight-green))))
   `(rainbow-delimiters-depth-9-face ((t (:foreground ,one-midnight-orange-1))))
   `(rainbow-delimiters-depth-10-face ((t (:foreground ,one-midnight-cyan))))
   `(rainbow-delimiters-depth-11-face ((t (:foreground ,one-midnight-purple))))
   `(rainbow-delimiters-depth-12-face ((t (:foreground ,one-midnight-orange-2))))
   `(rainbow-delimiters-unmatched-face ((t (:foreground ,one-midnight-red-1 :weight bold))))

   ;; rbenv
   `(rbenv-active-ruby-face ((t (:foreground ,one-midnight-green))))

   ;; elixir
   `(elixir-atom-face ((t (:foreground ,one-midnight-cyan))))
   `(elixir-attribute-face ((t (:foreground ,one-midnight-red-1))))

   ;; show-paren
   `(show-paren-match ((,class (:foreground ,one-midnight-purple :inherit bold :underline t))))
   `(show-paren-mismatch ((,class (:foreground ,one-midnight-red-1 :inherit bold :underline t))))

   ;; sh-mode
   `(sh-heredoc ((t (:inherit font-lock-string-face :slant italic))))

   ;; cider
   `(cider-fringe-good-face ((t (:foreground ,one-midnight-green))))

   ;; sly
   `(sly-error-face ((t (:underline (:color ,one-midnight-red-1 :style wave)))))
   `(sly-mrepl-note-face ((t (:inherit font-lock-comment-face))))
   `(sly-mrepl-output-face ((t (:inherit font-lock-string-face))))
   `(sly-mrepl-prompt-face ((t (:inherit comint-highlight-prompt))))
   `(sly-note-face ((t (:underline (:color ,one-midnight-green :style wave)))))
   `(sly-style-warning-face ((t (:underline (:color ,one-midnight-orange-2 :style wave)))))
   `(sly-warning-face ((t (:underline (:color ,one-midnight-orange-1 :style wave)))))

   ;; smartparens
   `(sp-show-pair-mismatch-face ((t (:foreground ,one-midnight-red-1 :background ,one-midnight-gray :weight bold))))
   `(sp-show-pair-match-face ((t (:background ,one-midnight-gray :weight bold))))

   ;; lispy
   `(lispy-face-hint ((t (:background ,one-midnight-border :foreground ,one-midnight-orange-2))))

   ;; lispyville
   `(lispyville-special-face ((t (:foreground ,one-midnight-red-1))))

   ;; spaceline
   `(spaceline-flycheck-error  ((,class (:foreground ,one-midnight-red-1))))
   `(spaceline-flycheck-info   ((,class (:foreground ,one-midnight-green))))
   `(spaceline-flycheck-warning((,class (:foreground ,one-midnight-orange-1))))
   `(spaceline-python-venv ((,class (:foreground ,one-midnight-purple))))

   ;; solaire mode
   `(solaire-default-face ((,class (:inherit default :background ,one-midnight-black))))
   `(solaire-minibuffer-face ((,class (:inherit default :background ,one-midnight-black))))

   ;; web-mode
   `(web-mode-doctype-face ((t (:inherit font-lock-comment-face))))
   `(web-mode-error-face ((t (:background ,one-midnight-black :foreground ,one-midnight-red-1))))
   `(web-mode-html-attr-equal-face ((t (:inherit default))))
   `(web-mode-html-attr-name-face ((t (:foreground ,one-midnight-orange-1))))
   `(web-mode-html-tag-bracket-face ((t (:inherit default))))
   `(web-mode-html-tag-face ((t (:foreground ,one-midnight-red-1))))
   `(web-mode-symbol-face ((t (:foreground ,one-midnight-orange-1))))

   ;; nxml
   `(nxml-attribute-local-name ((t (:foreground ,one-midnight-orange-1))))
   `(nxml-element-local-name ((t (:foreground ,one-midnight-red-1))))
   `(nxml-markup-declaration-delimiter ((t (:inherit (font-lock-comment-face nxml-delimiter)))))
   `(nxml-processing-instruction-delimiter ((t (:inherit nxml-markup-declaration-delimiter))))

   ;; flx-ido
   `(flx-highlight-face ((t (:inherit (link) :weight bold))))

   ;; rpm-spec-mode
   `(rpm-spec-tag-face ((t (:foreground ,one-midnight-blue))))
   `(rpm-spec-obsolete-tag-face ((t (:foreground "#FFFFFF" :background ,one-midnight-red-2))))
   `(rpm-spec-macro-face ((t (:foreground ,one-midnight-orange-2))))
   `(rpm-spec-var-face ((t (:foreground ,one-midnight-red-1))))
   `(rpm-spec-doc-face ((t (:foreground ,one-midnight-purple))))
   `(rpm-spec-dir-face ((t (:foreground ,one-midnight-cyan))))
   `(rpm-spec-package-face ((t (:foreground ,one-midnight-red-2))))
   `(rpm-spec-ghost-face ((t (:foreground ,one-midnight-red-2))))
   `(rpm-spec-section-face ((t (:foreground ,one-midnight-orange-2))))

   ;; guix
   `(guix-true ((t (:foreground ,one-midnight-green :weight bold))))
   `(guix-build-log-phase-end ((t (:inherit success))))
   `(guix-build-log-phase-start ((t (:inherit success :weight bold))))

   ;; gomoku
   `(gomoku-O ((t (:foreground ,one-midnight-red-1 :weight bold))))
   `(gomoku-X ((t (:foreground ,one-midnight-green :weight bold))))

   ;; tabbar
   `(tabbar-default ((,class (:foreground ,one-midnight-fg :background ,one-midnight-black))))
   `(tabbar-highlight ((,class (:underline t))))
   `(tabbar-button ((,class (:foreground ,one-midnight-fg :background ,one-midnight-bg))))
   `(tabbar-button-highlight ((,class (:inherit 'tabbar-button :inverse-video t))))
   `(tabbar-modified ((,class (:inherit tabbar-button :foreground ,one-midnight-purple :weight light :slant italic))))
   `(tabbar-unselected ((,class (:inherit tabbar-default :foreground ,one-midnight-fg :background ,one-midnight-black :slant italic :underline nil :box (:line-width 1 :color ,one-midnight-bg)))))
   `(tabbar-unselected-modified ((,class (:inherit tabbar-modified :background ,one-midnight-black :underline nil :box (:line-width 1 :color ,one-midnight-bg)))))
   `(tabbar-selected ((,class (:inherit tabbar-default :foreground ,one-midnight-fg :background ,one-midnight-bg :weight bold :underline nil :box (:line-width 1 :color ,one-midnight-bg)))))
   `(tabbar-selected-modified ((,class (:inherit tabbar-selected :foreground ,one-midnight-purple :underline nil :box (:line-width 1 :color ,one-midnight-bg)))))

   ;; linum
   `(linum ((t (:foreground ,one-midnight-gutter :background ,one-midnight-bg))))
   ;; hlinum
   `(linum-highlight-face ((t (:foreground ,one-midnight-fg :background ,one-midnight-bg))))
   ;; native line numbers (emacs version >=26)
   `(line-number ((t (:foreground ,one-midnight-gutter :background ,one-midnight-bg))))
   `(line-number-current-line ((t (:foreground ,one-midnight-fg :background ,one-midnight-bg))))

   ;; regexp-builder
   `(reb-match-0 ((t (:background ,one-midnight-gray))))
   `(reb-match-1 ((t (:background ,one-midnight-black :foreground ,one-midnight-purple :weight semi-bold))))
   `(reb-match-2 ((t (:background ,one-midnight-black :foreground ,one-midnight-green :weight semi-bold))))
   `(reb-match-3 ((t (:background ,one-midnight-black :foreground ,one-midnight-orange-2 :weight semi-bold))))

   ;; desktop-entry
   `(desktop-entry-deprecated-keyword-face ((t (:inherit font-lock-warning-face))))
   `(desktop-entry-group-header-face ((t (:inherit font-lock-type-face))))
   `(desktop-entry-locale-face ((t (:inherit font-lock-string-face))))
   `(desktop-entry-unknown-keyword-face ((t (:underline (:color ,one-midnight-red-1 :style wave) :inherit font-lock-keyword-face))))
   `(desktop-entry-value-face ((t (:inherit default))))

   ;; latex-mode
   `(font-latex-sectioning-0-face ((t (:foreground ,one-midnight-blue :height 1.0))))
   `(font-latex-sectioning-1-face ((t (:foreground ,one-midnight-blue :height 1.0))))
   `(font-latex-sectioning-2-face ((t (:foreground ,one-midnight-blue :height 1.0))))
   `(font-latex-sectioning-3-face ((t (:foreground ,one-midnight-blue :height 1.0))))
   `(font-latex-sectioning-4-face ((t (:foreground ,one-midnight-blue :height 1.0))))
   `(font-latex-sectioning-5-face ((t (:foreground ,one-midnight-blue :height 1.0))))
   `(font-latex-bold-face ((t (:foreground ,one-midnight-green :weight bold))))
   `(font-latex-italic-face ((t (:foreground ,one-midnight-green))))
   `(font-latex-warning-face ((t (:foreground ,one-midnight-red-1))))
   `(font-latex-doctex-preprocessor-face ((t (:foreground ,one-midnight-cyan))))
   `(font-latex-script-char-face ((t (:foreground ,one-midnight-mono-2))))

   ;; org-mode
   `(org-date ((t (:foreground ,one-midnight-cyan))))
   `(org-document-info ((t (:foreground ,one-midnight-mono-2))))
   `(org-document-info-keyword ((t (:inherit org-meta-line :underline t))))
   `(org-document-title ((t (:weight bold))))
   `(org-footnote ((t (:foreground ,one-midnight-cyan))))
   `(org-sexp-date ((t (:foreground ,one-midnight-cyan))))

   ;; calendar
   `(diary ((t (:inherit warning))))
   `(holiday ((t (:foreground ,one-midnight-green))))

   ;; gud
   `(breakpoint-disabled ((t (:foreground ,one-midnight-orange-1))))
   `(breakpoint-enabled ((t (:foreground ,one-midnight-red-1 :weight bold))))

   ;; realgud
   `(realgud-overlay-arrow1        ((t (:foreground ,one-midnight-green))))
   `(realgud-overlay-arrow3        ((t (:foreground ,one-midnight-orange-1))   `(realgud-overlay-arrow2        ((t (:foreground ,one-midnight-orange-2))))
                                    ))
   '(realgud-bp-enabled-face       ((t (:inherit (error)))))
   `(realgud-bp-disabled-face      ((t (:inherit (secondary-selection)))))
   `(realgud-bp-line-enabled-face  ((t (:box (:color ,one-midnight-red-1)))))
   `(realgud-bp-line-disabled-face ((t (:box (:color ,one-midnight-gray)))))
   `(realgud-line-number           ((t (:foreground ,one-midnight-mono-2))))
   `(realgud-backtrace-number      ((t (:inherit (secondary-selection)))))

   ;; rmsbolt
   `(rmsbolt-current-line-face ((t (:inherit hl-line :weight bold))))

   ;; ruler-mode
   `(ruler-mode-column-number ((t (:inherit ruler-mode-default))))
   `(ruler-mode-comment-column ((t (:foreground ,one-midnight-red-1))))
   `(ruler-mode-current-column ((t (:foreground ,one-midnight-accent :inherit ruler-mode-default))))
   `(ruler-mode-default ((t (:inherit mode-line))))
   `(ruler-mode-fill-column ((t (:foreground ,one-midnight-orange-1 :inherit ruler-mode-default))))
   `(ruler-mode-fringes ((t (:foreground ,one-midnight-green :inherit ruler-mode-default))))
   `(ruler-mode-goal-column ((t (:foreground ,one-midnight-cyan :inherit ruler-mode-default))))
   `(ruler-mode-margins ((t (:inherit ruler-mode-default))))
   `(ruler-mode-tab-stop ((t (:foreground ,one-midnight-mono-3 :inherit ruler-mode-default))))

   ;; undo-tree
   `(undo-tree-visualizer-current-face ((t (:foreground ,one-midnight-red-1))))
   `(undo-tree-visualizer-register-face ((t (:foreground ,one-midnight-orange-1))))
   `(undo-tree-visualizer-unmodified-face ((t (:foreground ,one-midnight-cyan))))

   ;; tab-bar-mode
   `(tab-bar-tab-inactive ((t (:background ,one-midnight-bg-hl :foreground ,one-midnight-fg))))
   `(tab-bar-tab          ((t (:background ,one-midnight-bg :foreground ,one-midnight-purple))))
   `(tab-bar              ((t (:background ,one-midnight-bg-hl))))
   ))

(one-midnight-with-color-variables
  (custom-theme-set-variables
   'one-midnight
   ;; fill-column-indicator
   `(fci-rule-color ,one-midnight-gray)

   ;; tetris
   ;; | Tetromino | Color                    |
   ;; | O         | `one-midnight-orange-2' |
   ;; | J         | `one-midnight-blue'     |
   ;; | L         | `one-midnight-orange-1' |
   ;; | Z         | `one-midnight-red-1'    |
   ;; | S         | `one-midnight-green'    |
   ;; | T         | `one-midnight-purple'   |
   ;; | I         | `one-midnight-cyan'     |
   '(tetris-x-colors
     [[229 192 123] [97 175 239] [209 154 102] [224 108 117] [152 195 121] [198 120 221] [86 182 194]])

   ;; ansi-color
   `(ansi-color-names-vector
     [,one-midnight-black ,one-midnight-red-1 ,one-midnight-green ,one-midnight-orange-2
      ,one-midnight-blue ,one-midnight-purple ,one-midnight-cyan ,one-midnight-fg])
   ))

(defvar one-midnight-theme-force-faces-for-mode t
  "If t, one-midnight-theme will use Face Remapping to alter the theme faces for
the current buffer based on its mode in an attempt to mimick the Atom One Dark
Theme from Atom.io as best as possible.
The reason this is required is because some modes (html-mode, jyaml-mode, ...)
do not provide the necessary faces to do theming without conflicting with other
modes.
Current modes, and their faces, impacted by this variable:
* js2-mode: font-lock-constant-face, font-lock-doc-face, font-lock-variable-name-face
* html-mode: font-lock-function-name-face, font-lock-variable-name-face
")

;; Many modes in Emacs do not define their own faces and instead use standard Emacs faces when it comes to theming.
;; That being said, to have a real "Atom One Dark Theme" for Emacs, we need to work around this so that these themes look
;; as much like "Atom One Dark Theme" as possible.  This means using per-buffer faces via "Face Remapping":
;;
;;   http://www.gnu.org/software/emacs/manual/html_node/elisp/Face-Remapping.html
;;
;; Of course, this might be confusing to some when in one mode they see keywords highlighted in one face and in another
;; mode they see a different face.  That being said, you can set the `one-midnight-theme-force-faces-for-mode` variable to
;; `nil` to disable this feature.
(defun one-midnight-theme-change-faces-for-mode ()
  (interactive)
  (when (or one-midnight-theme-force-faces-for-mode (called-interactively-p))
    (one-midnight-with-color-variables
      (cond
       ((member major-mode '(js2-mode))
        (face-remap-add-relative 'font-lock-constant-face :foreground one-midnight-orange-1)
        (face-remap-add-relative 'font-lock-doc-face '(:inherit (font-lock-comment-face)))
        (face-remap-add-relative 'font-lock-variable-name-face :foreground one-midnight-mono-1))
       ((member major-mode '(html-mode))
        (face-remap-add-relative 'font-lock-function-name-face :foreground one-midnight-red-1)
        (face-remap-add-relative 'font-lock-variable-name-face :foreground one-midnight-orange-1))))))

(add-hook 'after-change-major-mode-hook 'one-midnight-theme-change-faces-for-mode)

;;;###autoload
(and load-file-name
    (boundp 'custom-theme-load-path)
    (add-to-list 'custom-theme-load-path
                 (file-name-as-directory
                  (file-name-directory load-file-name))))
;; Automatically add this theme to the load path

(provide-theme 'one-midnight)

;; Local Variables:
;; no-byte-compile: t
;; End:
;;; one-midnight-theme.el ends here
