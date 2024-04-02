\ProvidesClass{TechnicalVolume}[2024/04/02, v1.1]
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
\LoadClass[10pt]{article}
\RequirePackage[pdftex, pdfusetitle,
				bookmarks, bookmarksnumbered,
				colorlinks, linkcolor=black, citecolor=black,
	         filecolor=black, urlcolor=black]
				{hyperref}
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
\RequirePackage[letterpaper,margin=1in, headsep=0.5in]{geometry}

% Title page
\RequirePackage[yyyymmdd]{datetime}
\RequirePackage[explicit]{titlesec} % gives access to \theauthor etc.
\RequirePackage[blocks]{authblk}                % Adds author name and affil
\renewcommand{\Authfont}{\normalsize\upshape}
\renewcommand{\Affilfont}{\normalsize\itshape}
\setlength{\affilsep}{0pt}

%Header styles
\pagestyle{fancy}
\fancyhf{}
\fancyhead[C]{\scriptsize \parbox{0.5\textwidth}{\centering \@title }}
\fancyhead[L]{\scriptsize \parbox{0.3\textwidth}{\raggedright \CMtitle \\ REV. DATE: \thedate}}
\fancyhead[R]{\parbox{0.2\textwidth}{\includegraphics[width=0.2\textwidth]{images/TurionLogo.eps}}}
\fancyfoot[C]{\scriptsize Use or disclosure of information contained on this sheet is subject to the restriction on the title page of this report.}
\fancyfoot[R]{\thepage}
\renewcommand{\headrulewidth}{0pt}
\renewcommand{\footrulewidth}{0pt}
% \setlength{\headsep}{0.2in}

%Figure styles

%Formatting text around equations
\setlength{\abovedisplayskip}{\baselineskip}
\setlength{\belowdisplayskip}{\baselineskip}
\setlength{\abovedisplayshortskip}{\baselineskip}
\setlength{\belowdisplayshortskip}{\baselineskip}

%Formatting lists
\RequirePackage{enumitem}
% list item formatting types
\setlist{labelindent=\parindent,leftmargin=*,nosep}
\setlist[enumerate]{label={\arabic*)}}
