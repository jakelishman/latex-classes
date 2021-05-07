\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{notes}[2019/06/14 v1.0 Jake's notes layout]
\LoadClass[a4paper,11pt]{scrartcl}

\RequirePackage[british]{babel}
\RequirePackage[T1]{fontenc}
\RequirePackage[sort&compress, numbers]{natbib}
\RequirePackage[final]{microtype}
\RequirePackage[sc]{mathpazo}
\RequirePackage[most]{tcolorbox}
\RequirePackage{jakecolours}
\RequirePackage{scrhack, floatrow, caption, graphicx, import}
\RequirePackage{indentfirst, setspace}

\addtokomafont{disposition}{\rmfamily}

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

\numberwithin{equation}{section}

\makeatletter
\let\old@title\title
\renewcommand*\title[1]{\old@title{\vspace*{-3em}#1}}
\let\old@tableofcontents\tableofcontents
\renewcommand*\tableofcontents{%
    {\hypersetup{linkcolor=black}\let\clearpage\relax\old@tableofcontents}

    \smallskip
    \begin{center}$\ast\ \ast\ \ast$\end{center}%
}
\makeatother

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
            {\caption[#3]{\small#4}}%
            {\footnotesize #2}%
        \afterfloat%
    \end{#1}%
}

\DeclareCaptionFormat{underline}{\small#1#2#3\afterfloat}
\newcommand\widefloat[4]{%
    \begin{#1}[t]%
        \captionsetup{format=underline, singlelinecheck=true}%
        {\footnotesize #2}{\caption[#3]{#4}}%
    \end{#1}%
}

\bibliographystyle{apsrev4-1}
