%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  USN-MSc.cls                                          %%
%%  LaTeX-class for USN mastergradsavhandling.           %%
%%                                                       %%
%%  Copyright 2026 Laurent Zogaj (modifications)         %%
%%  Copyright 2019-2020 Dietmar Winkler                  %%
%%      (original USN-LaTeX template)                    %%
%%                                                       %%
%%  Design adapted from USNs offisielle Word-mal:        %%
%%  https://min.usn.no/startside-student/tjenester-for-  %%
%%      studenter/oppgaveskriving/maler-for-             %%
%%      oppgaveskriving/                                 %%
%%                                                       %%
%%  Distributed under the LaTeX Project Public License   %%
%%  (LPPL) 1.3 or later. See LICENSE.                    %%
%%                                                       %%
%%  Compile with XeLaTeX or LuaLaTeX.                    %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{USN-MSc}[2026/04/27 USN mastergradsavhandling template]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}
\ProcessOptions\relax
\LoadClass[12pt, a4paper, oneside]{scrartcl}
\KOMAoptions{numbers=noendperiod}

% --- Page geometry: 2.5 cm margins ---
\RequirePackage{geometry}
\geometry{a4paper, top=2.5cm, bottom=2.5cm, left=2.5cm, right=2.5cm}

% --- Language ---
\RequirePackage[norsk]{babel}

% --- Fonts ---
% Body: Times New Roman 12pt.
% Headings and cover: Carlito (Calibri-equivalent), per USN visual identity.
\RequirePackage{fontspec}
\setmainfont{Times New Roman}
\RequirePackage{carlito}

% --- Line spacing: 1.5 ---
\RequirePackage{setspace}
\onehalfspacing

% --- Graphics ---
\RequirePackage{graphicx}
\graphicspath{{fig/}}

% --- Math ---
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{siunitx}

% --- Tables ---
\RequirePackage{booktabs}
\RequirePackage{longtable}
\RequirePackage{array}
\RequirePackage{tabularx}

% --- Figures and captions ---
\RequirePackage{float}
\RequirePackage{placeins}
\RequirePackage{caption}
\RequirePackage{subcaption}
\captionsetup{font=small, labelfont=bf, labelsep=colon}

% --- Lists and multi-column ---
\RequirePackage{enumitem}
\RequirePackage{multicol}

% --- Algorithms / pseudocode ---
\RequirePackage{algorithm}
\RequirePackage{algpseudocode}

% --- Quotes and code ---
\RequirePackage{csquotes}
\RequirePackage{listings}
\RequirePackage{xcolor}
\lstset{%
  basicstyle=\ttfamily\small,
  breaklines=true,
  frame=single,
  numbers=left,
  numberstyle=\tiny\color{black!50},
  keywordstyle=\color{blue!70!black}\bfseries,
  commentstyle=\color{green!40!black}\itshape,
  stringstyle=\color{red!60!black},
  showstringspaces=false,
  tabsize=2,
  captionpos=b
}

% --- Typography ---
\RequirePackage{microtype}

% --- Drawings, links, headings ---
\RequirePackage{tikz}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{xurl}
\RequirePackage{titlesec}
\RequirePackage{titletoc}
\RequirePackage{scrlayer-scrpage}

% --- Heading numbering depth ---
% Only "Overskrift 1" (\section) is numbered. \subsection and \subsubsection
% are unnumbered but still appear in the TOC (tocdepth=3).
\setcounter{secnumdepth}{1}
\setcounter{tocdepth}{3}

% --- Figure/table numbering per section (1.1, 1.2, 2.1, ...) ---
\numberwithin{figure}{section}
\numberwithin{table}{section}
\numberwithin{equation}{section}

% --- Heading styles ---
\titleformat{\section}
  {\sffamily\fontsize{20}{24}\selectfont\bfseries}{\thesection}{0.6em}{}
\titlespacing*{\section}{0pt}{2em}{1.5em}

\titleformat{\subsection}
  {\sffamily\fontsize{14}{18}\selectfont\bfseries}{}{0pt}{}
\titlespacing*{\subsection}{0pt}{1.5em}{0.5em}

\titleformat{\subsubsection}
  {\sffamily\bfseries\normalsize}{}{0pt}{}
\titlespacing*{\subsubsection}{0pt}{1.2em}{0.3em}

% Each section (numbered or starred) starts on a fresh page.
\AddToHook{cmd/section/before}{\clearpage}

% --- Appendix mechanism ---
% Call \USNappendix before the first appendix \section{...} to switch
% numbering to "Vedlegg A", "Vedlegg B", etc.
\newcommand{\USNappendix}{%
  \appendix
  \renewcommand{\thesection}{Vedlegg \Alph{section}}%
}

% --- Unnumbered section that appears in TOC and is clickable ---
% Usage: \USNsection{Sammendrag}
\newcommand{\USNsection}[1]{%
  \clearpage
  \phantomsection
  \addcontentsline{toc}{section}{#1}%
  \section*{#1}%
}

% --- Title-page meta commands ---
\newcommand{\faculty}[1]{\def\@faculty{#1}}
\newcommand{\thesistype}[1]{\def\@thesistype{#1}}
\newcommand{\subjectinfo}[1]{\def\@subjectinfo{#1}}
\newcommand{\semester}[1]{\def\@semester{#1}}
\newcommand{\candidate}[1]{\def\@candidate{#1}}
\renewcommand{\title}[1]{\def\@title{#1}}
\renewcommand{\subtitle}[1]{\def\@subtitle{#1}}

\faculty{Fakultet for\dots.}
\thesistype{Mastergradsavhandling}
\subjectinfo{Emnenavn/emnekode}
\semester{Årstall og semester}
\candidate{[Navn/kandidatnummer]}
\title{[Tittel]}
\subtitle{[Undertittel]}

% --- Cover page (sans-serif, single-spaced) ---
\newcommand{\USNcover}{%
  \begin{titlepage}
    \thispagestyle{empty}
    \begin{spacing}{1.0}
    \begin{tikzpicture}[remember picture, overlay]
      \node[anchor=south, inner sep=0pt]
        at (current page.south)
        {\includegraphics[width=\paperwidth]{cover-shapes}};

      \node[anchor=north west, inner sep=0pt]
        at ([xshift=2.5cm,yshift=-2.5cm]current page.north west)
        {\includegraphics[height=1.4cm]{USN_logo_main_nb_sort}};

      \node[anchor=north east, align=right, font=\sffamily]
        at ([xshift=-2.5cm,yshift=-3.3cm]current page.north east)
        {\@faculty\\\@thesistype\\\@subjectinfo\\\@semester};

      \node[anchor=north west, font=\sffamily, text width=14cm]
        at ([xshift=2.5cm,yshift=-12cm]current page.north west)
        {\@candidate};
      \node[anchor=north west, font=\sffamily\bfseries\fontsize{36}{42}\selectfont,
            text width=14cm]
        at ([xshift=2.5cm,yshift=-13.5cm]current page.north west)
        {\@title};
      \node[anchor=north west, font=\sffamily, text width=14cm]
        at ([xshift=2.5cm,yshift=-16cm]current page.north west)
        {\@subtitle};
    \end{tikzpicture}
    \end{spacing}
  \end{titlepage}
}

% --- Publisher info page ---
% Usage: \USNpublisherinfo{<institute>}{<year>}{<author>}{<study points>}
\newcommand{\USNpublisherinfo}[4]{%
  \clearpage
  \thispagestyle{empty}
  \vspace*{\fill}
  \noindent\begin{minipage}{\textwidth}
    Universitetet i Sørøst-Norge\\
    \@faculty\\
    #1\\
    Postboks 4\\
    3199 Borre\\
    \url{http://www.usn.no}\\[1em]
    \copyright~#2 #3\\[1em]
    Denne avhandlingen representerer #4 studiepoeng.
  \end{minipage}
  \vspace*{\fill}
  \clearpage
}

% --- Page style for body pages ---
\clearpairofpagestyles
\KOMAoptions{footsepline=true}
\setkomafont{pagefoot}{\sffamily\small\color{black!60}}
\setkomafont{pagenumber}{\sffamily\small\color{black}}
\ifoot*{\@candidate}
\cfoot*{\thepage}
\ofoot*{\@semester}
\pagestyle{scrheadings}

% --- TOC styling ---
\renewcommand{\contentsname}{Innhold}
\RedeclareSectionCommand[
  beforeskip=0pt,
  afterskip=2em
]{section}

\titlecontents{section}
  [0pt]
  {\addvspace{1em}\sffamily\bfseries}
  {\thecontentslabel\hspace{0.8em}}
  {}
  {\titlerule*[0.6pc]{.}\contentspage}
\titlecontents{subsection}
  [1.5em]
  {\sffamily}
  {}
  {}
  {\titlerule*[0.6pc]{.}\contentspage}
\titlecontents{subsubsection}
  [3em]
  {\sffamily}
  {}
  {}
  {\titlerule*[0.6pc]{.}\contentspage}
