\ProvidesClass{Letter}[2019/07/21, v1.0]
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
\if@singlespace
  \LoadClass[singlespace, lite=@lite]{Report}
\fi
\if@onehalfspace
  \LoadClass[onehalfspace, lite=@lite]{Report}
\fi
\if@doublespace
  \LoadClass[doublespace, lite=@lite]{Report}
\fi

\pagenumbering{gobble}
\pagestyle{plain}
