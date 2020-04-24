\ProvidesClass{Poster}[2020/04/21, v1.0]
% Baseline document formatting
\newif\if@singlespace
\newif\if@onehalfspace
\newif\if@doublespace
\DeclareOption{singlespace}{\@singlespacetrue}
\DeclareOption{onehalfspace}{\@onehalfspacetrue}
\DeclareOption{doublespace}{\@doublespacetrue}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{baposter}}
\ExecuteOptions{}
\ProcessOptions\relax
\LoadClass{baposter}
\RequirePackage{General}
\if@singlespace
\fi
\if@onehalfspace
  \onehalfspacing
\fi
\if@doublespace
  \doublespacing
\fi
