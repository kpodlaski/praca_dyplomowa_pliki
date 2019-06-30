% Author:  Krzysztof Podlaski (podlaski@uni.lodz.pl)
%          Faculty of Physics and Applied Informatics,
%          University of Lodz, Poland
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\message{... [wfiisul.cls] ---  (KP@WFiIS UL)  v0.1 <June 2019>  ...}

\newif\ifpdflatex\pdflatexfalse
\NeedsTeXFormat{LaTeX2e} %
\ProvidesClass{wfiisul}
\DeclareOption{pdflatex}{\pdflatextrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{report}}
\ProcessOptions\LoadClass[12pt,a4paper,twoside,openright]{report}

\RequirePackage{times}
\RequirePackage[T1]{fontenc}
\RequirePackage{graphicx}
\RequirePackage{geometry}
\RequirePackage{color}
\RequirePackage{fancyhdr}
\RequirePackage{url}
\RequirePackage{titlesec}
\RequirePackage{tocloft}
\RequirePackage{cite}
\RequirePackage[all,defaultlines=2]{nowidow} % Kontrola sierot i wdów - działa lepiej
\RequirePackage[polish]{babel}
\RequirePackage{polski}

\usepackage{polski}
\usepackage[utf8]{inputenc}
\usepackage{ifthen}
\usepackage{etoolbox}

\geometry{lmargin=25mm, rmargin=25mm, tmargin=20mm, bmargin=20mm, foot=15mm, head=15mm, bindingoffset=10mm}

\def\autor#1   {\gdef\@autor{#1}}
\def\tytul#1   {\gdef\@tytul{#1}}
\def\typpracy#1   {\gdef\@typpracy{#1}}
\def\acknowledgements#1   {\gdef\@acknowledgements{#1}}
\def\promotor#1   {\gdef\@promotor{#1}}
\def\katedra#1   {\gdef\@katedra{#1}}

\def\kierunek#1 {\gdef\@kierunek{#1}}
\def\specjalnosc#1 {\gdef\@specjalnosc{#1}}
\def\specjalizacja#1 {\gdef\@specjalizacja{#1}}
\def\sciezka#1 {\gdef\@sciezka{#1}}
\def\nralbumu#1 {\gdef\@nralbumu{#1}}

\linespread{1.2}

%\def\thesisheaders{
%\fancyfoot[LE,RO]{\small \@autor\quad\textit{\@tytul}}
%}


\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0pt}


\fancypagestyle{plain}{%
\fancyhf{} % clear all header and footer fields
\fancyhead[R]{\thepage}
\fancyfoot[C]{} % except the center
\fancyhead[RE]{\thepage}    %numer strony
\fancyhead[L]{\slshape \leftmark} % Rozdział
}

\newcommand{\stronatytulowa}{%

\pagestyle{empty}

\newpage \titlepage
\begin{center}

\vspace*{1.5cm}
%logo uniwersytetu
\includegraphics[width=12cm]{wfiislogoul.jpg}


\vspace{1.8cm}
{\Large \bfseries \@autor }\\[0.4cm]

\addvspace{1.5cm}

\begin{flushleft}
Kierunek: \@kierunek\\
%% Specjalnośći tylko na informatyce
\ifthenelse{\equal{\@kierunek}{informatyka}}{Specjalność:  \@specjalnosc \\}{}
%% Specjalizacja tylko informatyka inżynierska
\ifthenelse{\equal{\@typpracy}{inżynierska}\AND\equal{\@kierunek}{informatyka}}{Specjalizacja: \@specjalizacja\\}{}
%% Ścieżki fizyka oraz informatyka magisterska
\ifthenelse{\equal{\@kierunek}{fizyka}\OR\equal{\@typpracy}{magisterska}}{Ścieżka dydaktyczna: \@sciezka\\}{}
Numer albumu: \@nralbumu \\

\end{flushleft}

\vspace*{0.6cm}
\begin{center}
{\Large \bfseries \@tytul }\\[0.4cm]
\end{center}

\vspace*{1cm}
\begin{flushright}
\begin{minipage}{0.44\textwidth}
\begin{flushleft} \large
%\emph{ } \\
{\bf Praca\,\@typpracy}
\end{flushleft}
\end{minipage}

\addvspace{5pt}
\begin{minipage}{0.4\textwidth}
\begin{flushleft} \large
wykonana\,pod\,kierunkiem\\
\@promotor\\
W~Katedrze~\@katedra\\
WFiIS~UŁ
\end{flushleft}
\end{minipage}
\end{flushright}

\vspace{\fill}
{\large Łódź \the\year}\\[4cm] % Date
\end{center}
\cleardoublepage
\addtocontents{toc}{\protect\thispagestyle{empty}}
\tableofcontents
\cleardoublepage
\pagestyle{fancy}
%\fancyhead[LE]{\slshape \rightmark} % Sekcja
\fancyhead[RE]{\thepage}    %numer strony
\fancyhead[LE, RO]{\slshape \leftmark} % Rozdział
\fancyhead[LO]{\thepage}    %numer strony
\fancyfoot[C]{}



\newbool{firstbib}
\booltrue{firstbib}
\newbool{firstspis}
\booltrue{firstspis}
%Ustawienie stylu bibliografii i dodanie bibliografi do spisu treści
\preto{\bibitem}{\ifbool{firstbib}{\thispagestyle{fancy}\addcontentsline{toc}{chapter}{\bibname} \setbool{firstbib}{false}}{}}
%Ustawienie stylu dla spisów tabel i rysunków
%Dodanie spisu rysunków so spisu treści
\preto{\listoffigures}{\ifbool{firstspis}{\clearpage\setbool{firstspis}{false}}{}\addcontentsline{toc}{chapter}{\listfigurename}}
%Dodanie spisu tabel so spisu treści
\preto{\listoftables}{\ifbool{firstspis}{\clearpage\setbool{firstspis}{false}}{}\addcontentsline{toc}{chapter}{\listtablename}}

}


%Pusta strona
