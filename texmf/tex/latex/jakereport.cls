\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{jakereport}[2019/06/14 v1.0 Jake's reports layout]
\LoadClass[a4paper,11pt,oneside]{scrbook}

\RequirePackage[british]{babel}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[sort&compress, numbers]{natbib}
\RequirePackage[final]{microtype}
\RequirePackage[most]{tcolorbox}
\RequirePackage[singlespacing]{setspace}
\RequirePackage{scrhack, floatrow, caption, graphicx, import}

\AtEndPreamble{%
    \RequirePackage{hyperref}%
    \RequirePackage{cleveref}%
    \hypersetup{%
        colorlinks=true,
        linkcolor=solblue,
        citecolor=solviolet,
        urlcolor=solmagenta,
    }%
}

% Set font of headings to bold and serif.
\setkomafont{disposition}{\rmfamily\bfseries}

% Declare the base caption setup.  This has the label in smallcaps, separated
% from the body of text by an em-dash.
\DeclareCaptionLabelSeparator{emdash}{---}
\captionsetup{format = plain,
              labelsep = emdash,
              singlelinecheck = false,
              font = {footnotesize, singlespacing},
              labelfont = sc}

% Create the separator between a float and the body of the text, assuming that
% the floats will always be floated to the top of the page.
\newcommand*\afterfloat{\hrulefill}

\newlength\narrowfloatwidth
\setlength\narrowfloatwidth{95mm}
\newcommand\narrowfloat[4]{%
    \begin{#1}[t]%
        \floatbox[%
            {\capbeside%
             \thisfloatsetup{floatwidth=\narrowfloatwidth,%
                             capbesideposition={left, top},%
                             capbesidewidth=sidefil,%
                             capbesidesep=qquad,%
                             }%
            }]{#1}[\FBwidth]%
            {\caption[#3]{#4}}%
            {\footnotesize #2}%
        \afterfloat%
    \end{#1}%
}

\DeclareCaptionFormat{underline}{#1#2#3\afterfloat}
\newcommand\widefloat[4]{%
    \begin{#1}[t]%
        \captionsetup{format=underline, singlelinecheck=true}%
        {\footnotesize #2}{\caption[#3]{#4}}%
    \end{#1}%
}

\makeatletter
\let\old@maketitle\maketitle
\renewcommand*\maketitle{%
    \old@maketitle{\hypersetup{linkcolor=black}\tableofcontents\listoffigures}%
}
\makeatother

\bibliographystyle{apsrev4-1}
\let\bibfont\footnotesize
\setlength\bibsep{0.25\baselineskip}
