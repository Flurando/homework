(specifications->manifest
 (list
  ;; org用xelatex导出支持中文的PDF最低要求
  "texlive-scheme-basic"
  "texlive-xetex"
  "texlive-ulem"
  "texlive-fontspec"
  "texlive-xecjk"
  "texlive-ctex"
  "texlive-wrapfig"
  "texlive-capt-of"

  ;; 支持组件
  "font-wqy-zenhei"

  ;; 必要项
  "emacs"
  "guile"
  "bash-minimal"

  ;; 额外环境
  "r" "emacs-ess"
  "emacs-use-package"
  "emacs-cdlatex"
  "emacs-counsel"
  "emacs-swiper"
  "emacs-ivy"
  "emacs-geiser"
  "emacs-geiser-guile"
  ))
