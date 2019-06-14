%chktex-file 1
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{problems}[2017/02/01 v1.0 Jake's problem sheet layout] %chktex 8
\LoadClass{article}

\RequirePackage{color, amsmath, mathtools, braket, multicol}
\RequirePackage[explicit]{titlesec}
\RequirePackage[super, sort&compress]{natbib}
\RequirePackage[colorlinks=true,citecolor=magenta,linkcolor=magenta]{hyperref}
% Packages below this line _must_ be loaded after hyperref.
\RequirePackage[a4paper, top=20mm, left=20mm, right=20mm, bottom=20mm]{geometry}
\RequirePackage{doi,cleveref}

% Set up the formatting for parts and subparts of questions.
% - romanalph (default) -> 1i.a
% - alphroman           -> 1a.i
\newcommand{\formatpart}{\roman}
\newcommand{\formatsubpart}{\alph}
\DeclareOption{alphroman}{
    \renewcommand\formatpart\alph
    \renewcommand\formatsubpart\roman
}
\DeclareOption{romanalph}{
    \renewcommand\formatpart\roman
    \renewcommand\formatsubpart\alph
}
\ProcessOptions\relax

% Set the citation separator to be a comma, not a semicolon.
\setcitestyle{comma}

% i.e. and e.g. commands. Use as `\ie\ in other words`---with the slash after,
% or you'll get funny spacing.
\newcommand{\ie}{\textit{i.e.}}
\newcommand{\eg}{\textit{e.g.}}

% An upright d for differential operators.
\newcommand{\dd}{\mathrm{d}}
% A command to denote an answer.
\newcommand{\answer}[1]{\underline{\underline{#1}}}

% Expectation value with default sized <>.
\newcommand{\expect}[1]{{\langle#1\rangle}}
% Expectation value with <> that grow to fit the contents---may be too big for
% e.g. \hat{O}.
\newcommand{\Expect}[1]{{\left<#1\right>}}

% The separation to use between brakets.
\newcommand{\bksep}{\negthickspace}

% A simple projector:
%   \proj{n}    -> |n><n|
%   \proj{x}{y} -> |x><y|
\newcommand{\proj}[1]{\ket{#1}\bksep\@ifnextchar\bgroup{\bra}{\bra{#1}}}

% Use Tr as the trace operator in equations.
\DeclareMathOperator{\Tr}{Tr}

% Set the column spacing.
\setlength{\columnsep}{5mm}

% Define equation spacing to be thinner.
\RequirePackage{etoolbox}
\apptocmd\normalsize{%
 \abovedisplayskip=0.5em
 \abovedisplayshortskip=0.2em
 \belowdisplayskip=0.5em
 \belowdisplayshortskip=0.5em
 \jot=0.5em
}{}{}

% Number equations based on the question number.
\numberwithin{equation}{section}

% Define the styling of the sections (question numbers).
\titleformat{\section}
 {\cleaders\vbox to 0.5\baselineskip{\titlerule[1pt]}\vskip0.5\baselineskip}
 {\large\bf \thesection}
 {1em}{\large\bf #1}
\titlespacing{\section}{0pt}{15pt plus 3pt minus 3pt}{2pt}

% A manual subsection separator, for when we have some text before the first
% part of a question.
\newlength{\subsectionspacing}
\setlength{\subsectionspacing}{2pt}
\newcommand{\qsepinternal}{\centerline{\hss\rule{0.5\linewidth}{0.4pt}\hss}}
\newcommand{\qsep}{\qsepinternal\vspace{\subsectionspacing}}

% Define the subsection (question parts) to be inline in the text and blue.
\renewcommand{\thesubsection}{(\thesection\textit{\formatpart{subsection}})}
\newcommand{\titlesubsection}{\textcolor{blue}{(\textit{\formatpart{subsection}})}}
\titleformat{\subsection}[runin]
  {\ifnumequal{\value{subsection}}{1}{}{\qsepinternal}}
  {\titlesubsection}
  {0em}{}
\titlespacing{\subsection}{0pt}{0pt}{0.6em}

% Define the subparts formatting.
\renewcommand{\thesubsubsection}{(\thesection\textit{\formatpart{subsection}.\formatsubpart{subsubsection}})}
\newcommand{\titlesubsubsection}{\textcolor{blue}{(\textit{\formatsubpart{subsubsection}})}}
\renewcommand{\subsubsection}{\refstepcounter{subsubsection}\titlesubsubsection}

% Alias more meaningful names to the sectioning commands.
\newcommand\question{\section{}}
\renewcommand\part{\subsection{}}
\newcommand\subpart{\subsubsection{}}

% Redefine the cleveref names for subsections to reference question parts
% instead.
\crefname{section}{q.\phantom{}~}{qs.\phantom{}~}
\Crefname{section}{Question}{Questions}
\crefname{subsection}{part}{parts}
\Crefname{subsection}{Part}{Parts}

% Add lecturer and problem sheet number commands that maketitle can access.
\let\@lecturer\@empty
\let\@sheetnum\@empty
\newcommand{\lecturer}[1]{\gdef\@lecturer{#1}}
\newcommand{\sheetnum}[1]{\gdef\@sheetnum{#1}}

% Redefine the title format.
\def\@maketitle{%
  \newpage
  \begin{center}%
  \let\footnote\thanks
    {\Large \textbf{\@title} \par}%
    {\large \itshape Problem sheet\ifx\@sheetnum\@empty\else\ \@sheetnum\fi%
\ifx\@lecturer\@empty\else\ for \@lecturer\fi\par }%
    {\large \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
  \end{center}%
  \par%
  \vskip 0.5em}

% Set up the bibliography.
\bibliographystyle{apsrev4-1} %chktex 8
\renewcommand\bibsection{}
\let\old@bibliography\bibliography
\renewcommand\bibliography[1]{
\begin{multicols}{2}[\noindent\rule{\textwidth}{1pt}]
    \old@bibliography{#1}
\end{multicols}}
