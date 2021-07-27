\ProvidesClass{Presentation}[2019/07/21, v1.0]
% Baseline document formatting
\newif\if@singlespace
\newif\if@onehalfspace
\newif\if@doublespace
\newif\if@lite
\DeclareOption{singlespace}{\@singlespacetrue}
\DeclareOption{onehalfspace}{\@onehalfspacetrue}
\DeclareOption{doublespace}{\@doublespacetrue}
\DeclareOption{lite}{\@litetrue}
\ExecuteOptions{}
\ProcessOptions\relax
% Load beamer class, without theorem environments
\LoadClass[8pt,t, aspectratio=169, noamsthm]{beamer}
\makeatletter
\let\th@plain\relax
\makeatother
% Load General.sty
\if@lite
  \usepackage[lite]{General}
\else
  \usepackage{General}
\fi
\if@singlespace
\fi
\if@onehalfspace
  \onehalfspacing
\fi
\if@doublespace
  \doublespacing
\fi
\RequirePackage{hyperref}

\pgfplotsset{compat=1.17}

\mode<presentation>

% INNER theme:
\setbeamertemplate{background}{
  \begin{tikzpicture}
  \useasboundingbox (0,0) rectangle(\the\paperwidth,\the\paperheight);
  \ifnum\thepage>1\relax%
   \fill[white,opacity=1] (0,0) rectangle(\the\paperwidth,\the\paperheight);
  \fi
  \end{tikzpicture}
}

% Title page
\defbeamertemplate*{title page}{Presentation}[1][]
{
  \vfill
  \begin{centering}
      \vskip1.75em%
      {
          \usebeamercolor[fg]{titlegraphic}
          \inserttitlegraphic\par
      }
      \vskip1.25em%
      \begin{beamercolorbox}[sep=0pt,center]{title}
        \rule{\linewidth}{0.2 mm}\\ [0.2cm]%
        \usebeamerfont{title}\inserttitle\par%
          \ifx\insertsubtitle@empty%
          \else%
              % \vskip0.25em%
              {\usebeamerfont{subtitle}\usebeamercolor[fg]{subtitle}\insertsubtitle\par}%
          \fi%
          \rule{\linewidth}{0.2 mm}%
      \end{beamercolorbox}%
      \vskip1em\par
      \begin{beamercolorbox}[sep=8pt,center]{author}
          \usebeamerfont{author}\insertauthor
      \end{beamercolorbox}
      \begin{beamercolorbox}[sep=8pt,center]{institute}
          \usebeamerfont{institute}\insertinstitute
      \end{beamercolorbox}
      \begin{beamercolorbox}[sep=8pt,center]{date}
          \usebeamerfont{date}\insertdate
      \end{beamercolorbox}\vskip0.5em
  \end{centering}
  \vfill
}

\setbeamertemplate{items}[square]
\setbeamertemplate{sections/subsections in toc}[square]

% OUTER theme:
\defbeamertemplate*{frametitle}{Presentation}[1][]
{
  \ifx\insertsectionhead\empty
    \begin{beamercolorbox}[wd=\paperwidth,ht=2.75ex,dp=1.375ex]{frametitle}
        \hspace*{1ex}Overview
    \end{beamercolorbox}
  \else
    \begin{beamercolorbox}[wd=\paperwidth,ht=2.75ex,dp=1.375ex]{frametitle}
      \hspace*{1ex}\insertframetitle \hfill {\large\insertsection} \hspace*{0ex}
    \end{beamercolorbox}

  \fi
  \par
  \begin{tikzpicture}[overlay]
    \coordinate (LeftEnd) at (-1, 0.3);
    \coordinate (LeftEndUnder) at (-1, 0.2);
    \coordinate (RightEnd) at (10, 0.3);
    \draw[DukeNavy, fill=DukeNavy] (LeftEnd)--(RightEnd)--(LeftEndUnder)--(LeftEnd);

    \coordinate (RightEnd) at (\paperwidth, 0.3);
    \coordinate (PreRightEnd) at (-1, 0.3);
    \draw[DukeNavy, thick] (RightEnd)--(PreRightEnd);
  \end{tikzpicture}\par
}

\defbeamertemplate*{footline}{Presentation}[1][]
{
  \begin{tikzpicture}[overlay]
    \ifnum\thepage>1%
      \coordinate (one) at (0,0.5);%
      \coordinate (two) at (0.03\textwidth,0.5);%
      \coordinate (three) at (0.27\textwidth,0.5);%
      \coordinate (four) at (\textwidth,0.5);%
      \draw[DukeNavy, very thick] (one) -- (two);%
      \draw[DukeNavy, very thick] (three) -- (four);%
      \node [inner sep=0pt,clip,rounded corners=0.0cm] (oxlogo) at (0.15\textwidth,0.6){\includegraphics[width=.25\textwidth]{images/duke-foot.png}};
      \node at (0.95\textwidth,0.25) {\large\insertframenumber / \large\inserttotalframenumber};%
    \fi%
  \end{tikzpicture}
}

% Colors
\setbeamercolor*{title}{parent=DukeNavy}
\setbeamercolor*{title}{fg=DukeNavy}
\setbeamercolor*{subtitle}{parent=DukeNavy}
\setbeamercolor*{author}{parent=Gainsboro}
\setbeamercolor*{date}{parent=DukeNavy}
\setbeamercolor*{institute}{parent=DukeNavy}

\setbeamercolor*{section title}{parent=DukeNavy}
\setbeamercolor*{subsection title}{parent=DukeNavy}
\setbeamercolor*{frametitle}{parent=DukeNavy}
\setbeamercolor*{background canvas}{parent=DukeNavy}
\setbeamercolor*{structure}{fg=DukeNavy}

\setbeamercolor*{page number in head/foot}{fg=DukeNavy}

% Fonts
\usefonttheme{serif}
\setbeamerfont{institute}{size=\small,shape=\scshape}
\def\beamer@andinst{\\[0.2em]}
\setbeamerfont{block title}{size=\large,series=\bfseries}
\setbeamerfont{block body}{size=\small}

% Remove nav symbols and define blocks aspect:
\setbeamertemplate{navigation symbols}{}
\setbeamertemplate{blocks}[rounded][shadow=true]

% section outline formatting
\AtBeginSection[]{\begin{frame}\frametitle{Overview}\tableofcontents[currentsection]\end{frame}}

% bibliography formatting for beamer
\setbeamertemplate{bibliography item}{\insertbiblabel}
\setbeamercolor*{bibliography entry title}{fg=black}
\setbeamercolor*{bibliography entry author}{fg=black}
\setbeamercolor*{bibliography entry location}{fg=black}
\setbeamercolor*{bibliography entry note}{fg=black}
\setbeamerfont*{bibliography item}{size=\footnotesize}
\setbeamerfont*{bibliography entry author}{size=\footnotesize}
\setbeamerfont*{bibliography entry title}{size=\footnotesize}
\setbeamerfont*{bibliography entry location}{size=\footnotesize}
\setbeamerfont*{bibliography entry note}{size=\footnotesize}

\mode<all>
