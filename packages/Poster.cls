\ProvidesClass{Poster}[2020/04/21, v1.0]
% Baseline document formatting
\newif\if@singlespace
\newif\if@onehalfspace
\newif\if@doublespace
\newif\if@lite
\DeclareOption{singlespace}{\@singlespacetrue}
\DeclareOption{onehalfspace}{\@onehalfspacetrue}
\DeclareOption{doublespace}{\@doublespacetrue}
\DeclareOption{lite}{\@litetrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{baposter}}
\ExecuteOptions{}
\ProcessOptions\relax
\LoadClass{baposter}
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

% \RequirePackage[pdftex, pdfusetitle, plainpages=false,
% 				letterpaper, bookmarks, bookmarksnumbered,
% 				colorlinks, linkcolor=black, citecolor=black,
% 	         filecolor=black, urlcolor=black]
% 				{hyperref}
