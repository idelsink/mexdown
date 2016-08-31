\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{derptex-cv}[2016/08/27 Custom CV layout/format by Ingmar Delsink]

\LoadClass{moderncv} % Load default class
\moderncvstyle{empty}
%\moderncvstyle{casual}
%\moderncvcolor{blue}
\newcommand{\subsubsection}{}
\newcommand{\paragraph}{}
\newcommand{\subparagraph}{}
\newcommand{\test}{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%    Packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\RequirePackage{showframe}      % for debug
\RequirePackage{csquotes}       % Context sensitive quotation facilities
\RequirePackage{biblatex}       % APA style bibliography support
\RequirePackage{geometry}       % Flexible and complete interface to document dimensions
\RequirePackage{graphicx}       % Include graphics
%\RequirePackage{titling}        % Title page
\RequirePackage{fancyhdr}       % Make header end footer
%\RequirePackage{tocloft}        % Control table of contents, figures, etc
\RequirePackage{changepage}     % for the adjustwidth environment
\RequirePackage{titlesec}       % set format per section type
\RequirePackage{fancyvrb}       % Sophisticated verbatim text
\RequirePackage{longtable}      % Longtable support
\RequirePackage{booktabs}       % toprule problem
%\RequirePackage{bookmark}       % Generate bookmarks
\RequirePackage[unicode]{hyperref}       % Generate links
\RequirePackage{xcolor}         % Color for links etc
\RequirePackage{etoolbox}       % e-TEX tools for LATEX
\RequirePackage{caption}        % Customizing captions in floating environments
\RequirePackage{subcaption}     % Support for sub-captions
\RequirePackage{chngcntr}       % Change the resetting of counters
\RequirePackage{float}          % Improved interface for floating objects
\RequirePackage{footmisc}       % A range of footnote options
\RequirePackage{dirtytalk}      % A package to typeset quotations easier
\RequirePackage{spreadtab}      % Spreadsheet features for LATEX tabular environments
\RequirePackage{multirow}       % Create tabular cells spanning multiple rows
\RequirePackage{wrapfig}        % Produces figures which text can flow around
\RequirePackage{listings}       % Typeset source code listings using LATEX
\RequirePackage{makecell}       % Tabular column heads and multilined cells
\RequirePackage{tabularx}       % Tabulars with adjustable-width columns
\RequirePackage{xargs}          % Define commands with many optional arguments
\RequirePackage{datetime}       % Change format of \today with commands for current time

% include custom packages
\RequirePackage{cv-properties}
\RequirePackage{custom-fonts}
\RequirePackage{include-markdown}
\RequirePackage{custom-fonts}
\RequirePackage{unlisted-toc}
\RequirePackage{lists}
\RequirePackage{tikz-er2}

% DerpTeX-cv template version
\def\templateversion#1{\def\@templateversion{#1}}
\newcommand{\printtemplateversion}{\@templateversion}
\templateversion{1.0.0} % set default value

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%    Styling
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Hyperlinks formatting
\hypersetup{
    colorlinks=true,            % Colors the text of links and anchors.
    pdfborderstyle={/S/U/W 1},  % underline links instead of boxes
    linkcolor=[RGB]{50,50,50},  % Color for normal internal links.
    anchorcolor=red,            % Color for anchor text.
    citecolor=red,              % Color for bibliographical citations in text.
    filecolor=magenta,          % Color for URLs which open local files.
    menucolor=red,              % Color for Acrobat menu items.
    runcolor=red,               % Color for run links (launch annotations).
    urlcolor=[RGB]{50,50,50},   % Color for linked URLs.
    bookmarks=true,             % A set of Acrobat bookmarks are written
    bookmarksnumbered=true,     % If Acrobat bookmarks are requested, include section numbers.
    citebordercolor=red,        % The color of the box around citations
    filebordercolor=red,        % The color of the box around links to files
    linkbordercolor=red,        % The color of the box around normal links
    menubordercolor=red,        % The color of the box around Acrobat menu links
    urlbordercolor=red,         % The color of the box around links to URLs
    runbordercolor=red,         % Color of border around ‘run’ links
    pdfinfo={                   % Global PDF info
        Title={\printtitle},
        Subject={\printsubtitle},
        Author={\printauthor},
        %Institution={\printinstitution},
        %Subdepartment={\printsubdepartment},
        Version={\printversion}
    }
}

% date format for year
\newdateformat{yeardate}{\THEYEAR}

%%%%%%%%%%%%%%%%%%%%%%
%% Custom fonts
%%%%%%%%%%%%%%%%%%%%%%
% define empty default fonts
\def\headfont{}
\def\bodyfont{}
\def\sectionfont{}

% define styles
% title
% section
\titleformat{\section}
    {\sectionfont\normalfont}
    {\thesection}{1em}{}

% set an environment style
% usage: \derptexcvstyle{env name}{style}
\newcommand{\derptexcvstyle}[2]{%
    \ifcsname#1\endcsname%
        \renewenvironment{#1}{#2}{}
    \else%
        \newenvironment{#1}{#2}{}
    \fi%
}
% styles cventry
\derptexcvstyle{cventrytitle}{}         % cventry title style
\derptexcvstyle{cventrysubtitle}{}      % cventry subtitle style
\derptexcvstyle{cventrybody}{}          % cventry main body style
\derptexcvstyle{cventrydate}{}          % cventry date style
\derptexcvstyle{cventrylocalization}{}  % cventry localization style

% cventry hspace
% usage: \hspaceTYPE{value}
\def\hspacecventrydate#1{\def\@hspacecventrydate{#1}}
\newcommand{\printhspacecventrydate}{\@hspacecventrydate}
\hspacecventrydate{0em} % set default value
\def\hspacecventrysubtitle#1{\def\@hspacecventrysubtitle{#1}}
\newcommand{\printhspacecventrysubtitle}{\@hspacecventrysubtitle}
\hspacecventrysubtitle{0.4em} % set default value
\def\hspacecventrybody#1{\def\@hspacecventrybody{#1}}
\newcommand{\printhspacecventrybody}{\@hspacecventrybody}
\hspacecventrybody{0.8em} % set default value

% add an entry to the CV
% #1: optional: vspace after cventry
% #2: optional: column-width date
% #3: optional: column-width localization
% #4: years/dates
% #5: institution/employer
% #6: degree/job title
% #7: localization
% #8: {optional: grade/...}
% #9: {optional: comment/job description}
% date - date | institution/employer        | localization
%             |  degree/job title           |
%             |   optional: grade/...       |
%             |   comment/job description   |
% usage: \cventry[x]{years}{degree/job title}{institution/employer}{localization}{optional: grade/...}{optional: comment/job description}
\renewcommandx{\cventry}[9][1=1ex, 2=.2\textwidth, 3=.15\textwidth]{%
    \let\oldhfuzz\hfuzz % read hfuzz value
    \let\oldhbadness\hbadness % read hbadness value
    \hfuzz=5.000pt % set temp value to ignore underfull errors
    \hbadness=10000 % set temp value to ignore underfull errors
    \begin{tabularx}{\textwidth}{ p{#2} X@{} p{#3} }
         \hspace{\printhspacecventrydate}\begin{cventrydate}\makecell[tl]{#4}\end{cventrydate} & \makecell[tl]{%
            \begin{cventrytitle}\makecell[tl]{#5}\end{cventrytitle}\\%
            \hspace{\printhspacecventrysubtitle}\begin{cventrysubtitle}\makecell[tl]{#6}\end{cventrysubtitle}%
            \ifx\relax#8%
                % empty
            \else
                \\\hspace{\printhspacecventrybody}\begin{cventrybody}\makecell[tl]{#8}\end{cventrybody}
            \fi
            \ifx\relax#9%
                % empty
            \else
                \\\hspace{\printhspacecventrybody}\begin{cventrybody}\makecell[tl]{#9}\end{cventrybody}
            \fi
            } & \begin{cventrylocalization}\makecell[tr]{#7}\end{cventrylocalization}
    \end{tabularx}

    \vspace{#1}
    \let\hfuzz\oldhfuzz % restore old value
    \let\hbadness\oldhbadness % restore old value
}

% makes a resume line with a header and a corresponding text
% usage: \cvitem[spacing]{header}{text}
% #1: optional: spacing from left
% #2: optional: spacing from center
% #3: optional: border style
% #4: header
% #5: text
% header | text
\renewcommandx{\cvitem}[5][1=.2\textwidth, 2=0pt, 3=\color{black}\vrule]{%
    \let\oldhfuzz\hfuzz % read hfuzz value
    \let\oldhbadness\hbadness % read hbadness value
    \hfuzz=5.000pt % set temp value to ignore underfull errors
    \hbadness=10000 % set temp value to ignore underfull errors
    \newlength\oldtabcolsep
    \oldtabcolsep=\the\tabcolsep
    \setlength{\tabcolsep}{#2}
    \begin{tabularx}{\textwidth}{ p{#1} !{#3} p{.2\textwidth} }
        \makecell[tr]{#4} & \makecell[tl]{#5}
    \end{tabularx}
    \par\vskip-1.4pt % makes it possible to merge multiple tables
    \setlength{\tabcolsep}{\oldtabcolsep} % restore old value
    \let\oldtabcolsep\relax % let it relax.....
    \let\hfuzz\oldhfuzz % restore old value
    \let\hbadness\oldhbadness % restore old value
}

% set picture
% photo[<picture width>][<picture frame thickness>]{<picture filename>}{<xshift>}{<yshift>}
% #1: picture width
% #2: picture frame thickness
% #3: picture filename
% #4: xshift
% #5: yshift
\renewcommandx{\photo}[5][1=2em, 2=1pt, 4=0pt, 5=0pt]{
    \def\@photowidth{#1}
    \def\@photoframethickness{#2}
    \def\@photofilename{#3}
    \def\@photoxshift{#4}
    \def\@photoyshift{#5}
}

% place picture
\newcommand{\printphoto}[0]{
    \makeatletter
    \begin{tikzpicture}[remember picture,overlay]
        \node[xshift=1in+\hoffset+\oddsidemargin+\@photoxshift+(\@photowidth/2),%
              yshift=\paperheight-1in+\voffset+\headsep+\topmargin+\headheight+\@photoyshift-(\@photowidth/2),%
              draw=black, line width=\@photoframethickness, inner sep=0pt] at (current page.south west){%
        \includegraphics[width=\@photowidth]{\@photofilename}};
    \end{tikzpicture}
    \makeatother
}
\endinput
