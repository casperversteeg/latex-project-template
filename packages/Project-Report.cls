\ProvidesClass{Project-Report}[2018/11/27, v1.0]
%






\renewcommand{\arraystretch}{1.2}




%% Bibliography packages and styling
\RequirePackage[sort&compress,numbers]{natbib}
%\bibliographystyle{plainnat}
\bibliographystyle{unsrtnat}
\renewcommand{\bibfont}{\small}

%% For hyperlinks


%% General formatting packages
\RequirePackage{listings}

\RequirePackage{array}
\RequirePackage{lscape}

\RequirePackage{adjustbox}





\RequirePackage{lipsum}
\RequirePackage{tabu}
\usepackage{longtable,tabularx}
\setlength\LTleft{0pt}


\RequirePackage{tikz}
\RequirePackage{schemabloc}
\RequirePackage{verbatim}

\RequirePackage{color}
\RequirePackage{soul}
\definecolor{DukeBlue}{rgb}{0,26,87}
\definecolor{backcolour}{rgb}{0.99,0.99,0.96}
\definecolor{mygreen}{RGB}{28,172,0} % color values Red, Green, Blue
\definecolor{mylilas}{RGB}{170,55,241}

\lstset{language=C++,%
   backgroundcolor=\color{backcolour},
    breaklines=true,%
    morekeywords={matlab2tikz},
    keywordstyle=\color{black},%
    morekeywords=[2]{1}, keywordstyle=[2]{\color{black}},
    identifierstyle=\color{black},%
    numberstyle=\tiny\color{codegray},
    stringstyle=\color{mylilas},
    commentstyle=\color{mygreen},%
    captionpos=b,
    showstringspaces=false,%without this there will be a symbol in the places where there is a space
    numbers=left,%
    numberstyle={\tiny \color{black}},% size of the numbers
    numbersep=9pt, % this defines how far the numbers are from the text
    emph=[1]{function,for,while,end,break,if, else, elseif, bool, double, int, byte, void, uint32_t, true, false},emphstyle=[1]\color{blue},
    emph=[2]{Wire, EEPROM, Serial, begin, delay, print, println, atan2, sqrt, millis, abs, constrain, digitalWrite, analogWrite, pinMode, digitalRead, micros, atan}, emphstyle= [2]\color{orange},
    basicstyle=\footnotesize,
    breakatwhitespace=false,
    breaklines=true,
    captionpos=b,
    keepspaces=true,
    numbers=left,
    numbersep=5pt,
    showspaces=false,
    showstringspaces=false,
    showtabs=false,
    tabsize=2
}
