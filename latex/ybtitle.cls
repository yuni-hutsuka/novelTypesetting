% novelClassBunko.cls

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ymain}[2023/03/04 ymain]

\LoadClass[
    lualatex,                       % lualatexを使う
    yoko,                           % 縦書き
    book,                           % 本
    paper={111mm,154mm},            % 紙の大きさは文庫本
    head_space=14mm,                % 天の余白領域は17mm
    fontsize=8.0pt,                 % 基本フォントサイズは8.0pt
    jafontsize=8.0pt,               % 日本語フォントサイズは8.0pt
]{jlreq}
