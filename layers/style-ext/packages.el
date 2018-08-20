(defconst style-ext-packages
  '((style-ext :location (recipe :fetcher local))))

(defun style-ext/init-style-ext ()
  (use-package style-ext
    :init
    (progn
      (evil-leader/set-key
        "wa" 'style-ext/default-frame
        "wA" 'style-ext/max-frame
        "we" 'style-ext/default-right-frame
        "wT" 'style-ext/toggle-frame-size
        "zd" 'style-ext/default-face-attribute)))
  ;;(style-ext/default-face-attribute))
  )

