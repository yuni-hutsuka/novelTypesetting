% novelClassPrise.cls

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{novelClassPrise}[2023/03/04 novelClassPrise]

\LoadClass[
    lualatex,                       % lualatexを使う
    tate,                           % 縦書き
    hanging_punctuation,            % ぶらさがり組
    open_bracket_pos=nibu_tentsuki, % 行頭開き括弧は二分天付き
    fontsize=10.5pt,                % 基本フォントサイズは10.5pt
    jafontsize=10.5pt,              % 日本語フォントサイズは10.5pt
    line_length=42zw,               % 一行当りの文字数は42文字
    number_of_lines=34,             % 一ページ当りの行数は34行
]{jlreq}

\RequirePackage{luatexja-fontspec, luatexja-ruby}

\setmainjfont[
    UprightFont={*-Regular.ttf},
    BoldFont={*-Bold.ttf},
    FontFace={eb}{\shapedefault}{*-Regular.ttf},
    Script=Default
]{ShipporiMincho}

\newcommand{\scene}{
    \vspace{0.75em}\hspace{3em}◇◆◇\vspace{0.75em}
}
