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
\let\old@maketitle\maketitle
\renewcommand*\maketitle{%
    \old@maketitle

    {\hypersetup{linkcolor=black}\let\clearpage\relax\tableofcontents}

    \smallskip
    \begin{center}$\ast\ \ast\ \ast$\end{center}%
}
\makeatother

\bibliographystyle{apsrev4-1}
