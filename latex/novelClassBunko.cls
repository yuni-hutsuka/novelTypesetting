% novelClassBunko.cls

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{novelClassBunko}[2023/03/04 novelClassBunko]

\LoadClass[
    lualatex,                       % lualatexを使う
    tate,                           % 縦書き
    hanging_punctuation,            % ぶらさがり組
    open_bracket_pos=nibu_tentsuki, % 行頭開き括弧は二分天付き
    titlepage,                      % タイトルあり
    paper={111mm,154mm},            % 紙の大きさは文庫本
    head_space=17mm,                % 天の余白領域は17mm
    fontsize=8.0pt,                 % 基本フォントサイズは8.0pt
    jafontsize=8.0pt,               % 日本語フォントサイズは8.0pt
    line_length=42zw,               % 一行当りの文字数は43文字
    number_of_lines=34,             % 一ページ当りの行数は18行
]{jlreq}

% 本文で使う用
\RequirePackage{luatexja-fontspec, luatexja-otf, luatexja-ruby}
\RequirePackage{pdfpages}
\RequirePackage{tocloft, titletoc}

% 表紙などの装丁で使う用
\RequirePackage{lltjext}
\RequirePackage{framed}
\RequirePackage{tikz}

\usetikzlibrary{intersections, calc, arrows.meta}

% -------------------------------------------------------------------------------------------------


% フォント設定
\setsansfont[
    UprightFont = {*},
    BoldFont = {*},
    FontFace = {eb}{\shapedefault}{*},
    Script = Default
]{GenEiNombre}

\setmainjfont[
    UprightFont={*-Regular.ttf},
    BoldFont={*-Bold.ttf},
    FontFace={eb}{\shapedefault}{*-Regular.ttf},
    Script=Default
]{ShipporiMincho}

\setsansjfont{HackGenNerd}[
    UprightFont = {*-Regular},
    BoldFont = {*-Bold},
    FontFace = {eb}{\shapedefault}{*-Bold},
    Script = Default
]

% pagestyle
\NewPageStyle{novelpage}{
    font={\small},
    nombre={\quad\thepage\quad},
    gap=1\zw,
    running_head_position=top-left,
    nombre_position=top-left,
    odd_running_head={_chapter},
    even_running_head={_part}
    mark_format={
        _chapter={#1},
        _section={#1},
    }
}

\ModifyHeading{part}{
    number=false,
    format={\null\vfill {\Huge #1#2}\vfill},
    pagestyle=empty
}

\ModifyHeading{chapter}{
    number=false,
    pagebreak=begin_with_odd_page
}

\ModifyHeading{section}{
    number=false
}

\renewcommand{\cfttoctitlefont}{\thispagestyle{empty}\clearpage\hspace*{30mm}\LARGE\bfseries}
\renewcommand{\cftaftertoctitle}{\hfill\null}

\renewcommand{\cftbeforetoctitleskip}{20mm}
\renewcommand{\cftaftertoctitleskip}{15mm}

\titlecontents{part}[20mm]{\bfseries}{\thecontenslabel}{}{\hfill\hspace*{20mm}}
\titlecontents{chapter}[25mm]{}{\large\thecontenslabel}{}{\hfill\textsf{\contentspage}\hspace*{20mm}}


% -------------------------------------------------------------------------------------------------


% 各種パラメータ
\newcommand{\novelTitle}{}           % 文庫本のタイトル
\newcommand{\novelSubtitle}{}        % 文庫本のサブタイトル
\newcommand{\novelNumber}{}          % 文庫ナンバリング
\newcommand{\novelPublishInfo}{}     % 版情報など
\newcommand{\novelPrinterInfo}{}     % 印刷会社の情報
\newcommand{\novelIllustratorInfo}{} % 装丁画担当者の情報
\newcommand{\novelCopyrightInfo}{}   % 版権元の情報
\newcommand{\novelYear}{}            % 発行年

% マーク
\newcommand{\markDoubleSun}{
    \begin{tikzpicture}
        \draw[dash dot, very thick] (0,0) circle (1.5cm);
        \draw[dash dot, very thick] (0,0) circle (0.5cm);
        \foreach \angle in
            {0, 30, 60, 90, 120, 150, 180, 210, 240, 270, 300, 330}
            {\draw[very thick] (\angle:0.8cm) -- (\angle:2.5cm);}
        \foreach \angle in
            {15, 45, 75, 105, 135, 165, 195, 225, 255, 285, 315, 345}
            {\draw[very thick] (\angle:1.0cm) -- (\angle:2.0cm);}
    \end{tikzpicture}
}

% 表紙に使う用マーク
\newcommand{\markDoubleSuninWindow}{
    \begin{tikzpicture}
        \draw[dash dot, very thin] (0,0) circle (0.3cm);
        \draw[dash dot, very thin] (0,0) circle (0.1cm);
        \foreach \angle in
            {0, 30, 60, 90, 120, 150, 180, 210, 240, 270, 300, 330}
            {\draw[very thin] (\angle:0.16cm) -- (\angle:0.5cm);}
        \foreach \angle in
            {15, 45, 75, 105, 135, 165, 195, 225, 255, 285, 315, 345}
            {\draw[very thin] (\angle:0.2cm) -- (\angle:0.4cm);}
    \end{tikzpicture}
}


% タイトル窓のコマンド
\newcommand{\novelTitleWindow}[5]{
    % args
    % : [1] = title
    % : [2] = subtitle
    % : [3] = publisher

    % number rule
    % {発行年二桁}
    % {1 or 2 (次創作)}
    % {3 or 4 <-> 短編集 or 長編}
    % {5 or 6 <-> 単独 or 合同}{発行順番号}
    \renewcommand{\novelTitle}{#1}
    \renewcommand{\novelSubtitle}{#2}
    \renewcommand{\novelNumber}{#3}

    \begin{tikzpicture}
        \draw[ultra thick] (0, 0) rectangle (5.0, 4.4);
        \draw[ultra thick] (0.05, 0.05) rectangle (4.95, 4.35);
        \draw (0.15, 0.15) rectangle (4.85, 4.25);
        \draw (2.5, 3.5) node[above]{\textbf{\LARGE{\novelTitle}}};   % タイトル：引数で指定
        \draw (2.5, 3) node[above]{\novelSubtitle};                   % サブタイトル：引数で指定
        \draw (2.5, 2.5) node[above]{\small{二日ゆに}};               % 著者名：随時共著者の名前を入れる事
        \draw (2.5, 0.7) node[above]{\markDoubleSuninWindow};                 % オリジナルマーク
        \draw (1.80, 0.25) node[above]{\small{奇跡文庫}};             % 文庫名：とりあえずは奇跡文庫で。
        \draw (3.1, 0.27) node[above]{\textsf{\small{\novelNumber}}}; % 文庫番号：
    \end{tikzpicture}
}

\newcommand{\novelInfoWindow}[5]{
    \renewcommand{\novelPublishInfo}{#1}
    \renewcommand{\novelPrinterInfo}{#2}
    \renewcommand{\novelIllustratorInfo}{#3}
    \renewcommand{\novelCopyrightInfo}{#4}
    \renewcommand{\novelYear}{#5}


    \begin{minipage}<t>[b]{50mm}
        \small
        \begin{tabular}{ll}
            \novelPublishInfo
            % 令和三年七月十八日 & 初版発行
        \end{tabular}

        \begin{tabular}{ll}
            発行者   & \textbf{二日ゆに}\\
            サークル & \textbf{ゆにの工房}\\
                     & Mail: yuni.wille999@\\
                     & \hspace{10mm} gmail.com\\
            印刷所 \novelPrinterInfo
            % 印刷所   & 株式会社明光社 STARBOOKS\\
            %          & 〒122 - 0001\\
            %          & 東京都文京区白山 3 - 6 - 21\\
            %          & TEL: 03 - 3814 - 4989\\
            %          & MAIL: info@starbooks.jp\\
            装丁画 \novelIllustratorInfo
            % 装丁画   & \textbf{}\\
            %          & Twitter: @Some\_bowwow\\
        \end{tabular}

        \vspace{5mm}

        \scriptsize{
            本書の無断複製（コピー、スキャン、デジタル化等）並びに無断複製物の譲渡および配信はお控え下さい。
            また、本書を代行業者等の第三者に依頼して複製する行為は、たとえ個人や家庭内の利用であってもご遠慮下さい。\\
            \novelCopyrightInfo
            % エヴァンゲリオンは（株）カラーの著作物です。本書は（株）カラーのガイドラインに則り発行しました。  % とりあえずはエヴァの版権表示
        }
    \end{minipage}

    \\

    \vspace{2mm}

    Yuni Hutsuka \novelYear Printed in Japan
}
