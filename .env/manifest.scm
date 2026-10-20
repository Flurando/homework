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

  ;; 偶尔用到
  "texlive-multirow"
  "texlive-amsfonts" ; 附加的数学符号
  
  ;; 必要项
  "emacs-pgtk"
  "guile"
  "bash-minimal"
  "git"

  ;; 可能需要
  "fontconfig" ; 这个和下面的字体只在入口脚本净生成字体缓存时用到
  "font-wqy-zenhei"
  "curl" ; lean4附带的lake在更新依赖时需要用curl下载依赖目录之类的东西，虽然一般用不到

  ;; 额外环境
  "r" "emacs-ess" ; 在org代码块中运行R需要这两个包
  "lean4" "lean4-mathlib4" "emacs-lean4-mode" ; 用来数学证明的语言，垃圾但搞数学都用所以没有其它选择
  "emacs-dash" "emacs-lsp-mode" "emacs-magit-section" ; lean4-mode需要这几个包
  "emacs-company" "emacs-lsp-ivy" ; 需要这些包完善lsp体验
  "emacs-use-package"
  "emacs-cdlatex" ; 想在org中$$等数学区域内快捷打出\alpha之类的数学符号吗，这个包就提供这种功能
  "emacs-counsel"
  "emacs-swiper"
  "emacs-ivy"
  "emacs-geiser"
  "emacs-geiser-guile"
  ))
