\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mexdown-report}[2016/05/29 Custom report layout/format by Ingmar Delsink]

\LoadClass{report} % Load default class

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%    Packages
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%\RequirePackage[utf8]{inputenc} % Accept different input encodings
\RequirePackage{csquotes}       % Context sensitive quotation facilities
\RequirePackage{biblatex}       % APA style bibliography support
\RequirePackage{geometry}       % Flexible and complete interface to document dimensions
\RequirePackage{graphicx}       % Include graphics
\RequirePackage{titling}        % Title page
\RequirePackage{fancyhdr}       % Make header end footer
\RequirePackage{tocloft}        % Control table of contents, figures, etc
\RequirePackage{changepage}     % for the adjustwidth environment
\RequirePackage{titlesec}       % set format per section type
\RequirePackage{fancyvrb}       % Sophisticated verbatim text
\RequirePackage{longtable}      % Longtable support
\RequirePackage{booktabs}       % toprule problem
\RequirePackage{bookmark}       % Generate bookmarks
\RequirePackage{hyperref}       % Generate links
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
\RequirePackage{parskip}        % Replace paragraph indents with vertical whitespace
\RequirePackage{mwe}            % Packages and image files for minimal working example (MWE)

% include custom packages
\RequirePackage{tikz-er2}
\RequirePackage{include-markdown}
\RequirePackage{custom-fonts}
\RequirePackage{unlisted-toc}
\RequirePackage{report-properties}
\RequirePackage{lists}
\RequirePackage{hyperlink-hyperref}
\RequirePackage{fontawesome}

% include custom listings language highlight packages
\RequirePackage{language-basicstyle}
\RequirePackage{language-tex}

% mexdown-report template version
\def\templateversion#1{\def\@templateversion{#1}}
\newcommand{\printtemplateversion}{\@templateversion}
\templateversion{2.0.0} % set default value

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%    Styling
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Hyperlinks formatting
\AtEndPreamble{%
    \hypersetup{
        colorlinks=true,            % Colors the text of links and anchors.
        pdfborderstyle={/S/U/W 1},  % underline links instead of boxes
        linkcolor=[RGB]{50,50,50},  % Color for normal internal links.
        anchorcolor=red,            % Color for anchor text.
        citecolor=[RGB]{50,50,50},  % Color for bibliographical citations in text.
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
            Institution={\printinstitution},
            Subdepartment={\printsubdepartment},
            Version={\printversion}
        },
        pdfstartpage  = 1,
        pdfauthor = {\printauthor},
        pdftitle = {\printtitle},
        pdfcreator = {\LaTeX{} with 'mexdown-report' package},
        bookmarksdepth = 2 % to show sections and subsections
    }
}

%%%%%%%%%%%%%%%%%%%%%%
%% Custom fonts
%%%%%%%%%%%%%%%%%%%%%%
% define empty default fonts
\def\bodyfont{}
\def\headfont{}
\def\sourcecodefont{}
% Footnotes
\renewcommand{\footnotelayout}{
    \footnotesize\bodyfont
}

%%%%%%%%%%%%%%%%%%%%%%
%% Table of Content
%%%%%%%%%%%%%%%%%%%%%%
\setlength{\cftbeforetoctitleskip}{0ex} % Set ToC before height
\setcounter{tocdepth}{2}                % Set depth of entries
\setcounter{secnumdepth}{2}             % Section number dept (subsection)
\addtocontents{toc}{                    % Add "Page" on top of ToC #
    ~\hfill{\headfont Page}\par
}
% Indent size {<entry>}{<indent>}{<numwidth>}
\cftsetindents{chapter}{0em}{2.5em}
\cftsetindents{section}{1em}{2.5em}
\cftsetindents{subsection}{1.8em}{3.2em}
\cftsetindents{subsubsection}{6.0em}{5em}
\cftsetindents{paragraph}{7.0em}{5.0em}
\cftsetindents{subparagraph}{12.0em}{6.0em}
% sectional unit title format per section
\renewcommand{\cfttoctitlefont}{\Huge\headfont}     % ToC title
\renewcommand{\cftchapfont}{\normalsize\headfont}   % chapter
\renewcommand{\cftsecfont}{\normalsize\bodyfont}      % section
\renewcommand{\cftsubsecfont}{\normalsize\bodyfont}   % subsection
% Page number format per section
%% Skip distance
\renewcommand\cftchapafterpnum{\vskip6pt}   % chapter page
\renewcommand\cftsecafterpnum{\vskip6pt}    % section page
\renewcommand\cftsubsecafterpnum{\vskip6pt} % subsection page
%% Font
\renewcommand{\cftchappagefont}{\small\headfont}  % chapter page font
\renewcommand{\cftsecpagefont}{\small\bodyfont}     % section page font
\renewcommand{\cftsubsecpagefont}{\small\bodyfont}  % subsection page font

% Add clearpage before ToC
\newcommand{\printtableofcontents}{
    \clearpage
    \tableofcontents
}
% ToC title
\def\toctitle#1{\def\contentsname{#1}}
%\newcommand{\printtoctitle}{\@toctitle}
\toctitle{\contents} % set default value

%%%%%%%%%%%%%%%%%%%%%%
%% List of Tables
%%%%%%%%%%%%%%%%%%%%%%
\setlength{\cftbeforelottitleskip}{0ex} % Set LoT before height
\setcounter{lotdepth}{2}                % Set depth of entries
\addtocontents{lot}{                    % Add "Page" on top of LoT #
    ~\hfill{\headfont Page}\par
}
% sectional unit title format per section
\renewcommand{\cftlottitlefont}{\Huge\headfont}     % LoT title
\renewcommand{\cfttabfont}{\normalsize\bodyfont{Table }}  % LoT entries
\setlength{\cfttabnumwidth}{4em}  % Modify number width in LoT
% Page number format per section
%% Skip distance
\renewcommand\cfttabafterpnum{\vskip6pt}        % figure page
%% Font
\renewcommand{\cfttabpagefont}{\small\bodyfont}   % figure page font

% Print LoT
\newcommand{\printlistoftables}[1]{% #1 = unlisted
    \clearpage      % Clear page for LoT
    \phantomsection % For hyperreflinking
    \ifthenelse{\equal{#1}{unlisted}} {%
    }{% false
        \addcontentsline{toc}{chapter}{\listtablename}  % Add LoT to ToC
    }
    \listoftables                   % Generate and include a LoT
    %\thispagestyle{empty}           % Disable header and footer on LoT
}

%%%%%%%%%%%%%%%%%%%%%%
%% List of Figures
%%%%%%%%%%%%%%%%%%%%%%
\setlength{\cftbeforeloftitleskip}{0ex} % Set LoF before height
\setcounter{lofdepth}{2}                % Set depth of entries
\addtocontents{lof}{                    % Add "Page" on top of LoF #
    ~\hfill{\headfont Page}\par
}
% sectional unit title format per section
\renewcommand{\cftloftitlefont}{\Huge\headfont} % LoF title
\renewcommand{\cftfigfont}{\normalsize\bodyfont{Figure }}  % LoF entries
\setlength{\cftfignumwidth}{4em}  % Modify number width in LoF

% Page number format per section
%% Skip distance
\renewcommand\cftfigafterpnum{\vskip6pt}        % figure page
%% Font
\renewcommand{\cftfigpagefont}{\small\bodyfont}   % figure page font

% Print LoF
\newcommand{\printlistoffigures}[1]{% #1 = unlisted
    \clearpage      % Clear page for LoT
    \phantomsection % For hyperreflinking
    \ifthenelse{\equal{#1}{unlisted}} {%
    }{% false
        \addcontentsline{toc}{chapter}{\listfigurename} % Add LoF to ToC
    }
    \listoffigures                   % Generate and include a LoF
    %\thispagestyle{empty}           % Disable header and footer on LoF
}
%%%%%%%%%%%%%%%%%%%%%%
%% Bibliography
%%%%%%%%%%%%%%%%%%%%%%
\def\bibfont{\bodyfont}   % Set font

%%%%%%%%%%%%%%%%%%%%%%
%% Format per section
%%%%%%%%%%%%%%%%%%%%%%
% Chapter
\titleformat{\chapter}
    [hang] % shape
    {\Large\headfont} % format
    {\thechapter} % label
    {1.5em} % horizontal sep between label and title body
    {} % before-code
    [] % after-code
\titlespacing{\chapter}
    {0em}   % left spacing
    {0ex}   % before spacing
    {3ex}   % after spacing
% Section
\titleformat{\section}
    [hang] % shape
    {\Large\headfont} % format
    {\thesection} % label
    {2em} % horizontal sep between label and title body
    {} % before-code
    [] % after-code
\titlespacing{\section}
    {0em}   % left spacing
    {2ex}   % before spacing
    {2ex}   % after spacing
% Subsection
\titleformat{\subsection}
    [hang] % shape
    {\normalsize\headfont} % format
    {\thesubsection} % label
    {2.5em} % horizontal sep between label and title body
    {} % before-code
    [] % after-code
\titlespacing{\subsection}
    {0em}   % left spacing
    {2ex}   % before spacing
    {1ex}   % after spacing
% Subsubsection
\titleformat{\subsubsection}
    [hang] % shape
    {\headfont} % format
    {\thesubsubsection} % label
    {3em} % horizontal sep between label and title body
    {} % before-code
    [] % after-code
\titlespacing{\subsubsection}
    {0em}   % left spacing
    {2ex}   % before spacing
    {1ex}   % after spacing
% Paragraph
\titleformat{\paragraph}
    [hang] % shape
    {\normalfont\normalsize\headfont\color{cyan}} % format
    {\theparagraph} % label
    {1em} % horizontal sep between label and title body
    {} % before-code
    [] % after-code
\titlespacing{\paragraph}
    {0em}   % left spacing
    {2ex}   % before spacing
    {1ex}   % after spacing

%%%%%%%%%%%%%%%%%%%%%%
%% Format captions
%%%%%%%%%%%%%%%%%%%%%%
% Tables
\renewcommand{\thetable}{\arabic{table}}        % numbering:  1, 2 etc.
\DeclareCaptionFormat{tabcapfont}
    {\bodyfont \small\textit{\textbf{#1#2}}#3}    % caption format
\captionsetup[table]{format=tabcapfont}         % set defined caption
\counterwithin{table}{chapter}
% Sub Tables
\renewcommand{\thesubtable}{\alph{subtable}}   % a, b etc.
% Figures
\renewcommand{\thefigure}{\arabic{figure}}      % numbering:  1, 2 etc.
\DeclareCaptionFormat{figcapfont}
    {\bodyfont \small\textit{\textbf{#1#2}}#3}    % caption format
\captionsetup[figure]{format=figcapfont}        % set defined caption
\counterwithin{figure}{chapter}
% Sub figures
\renewcommand{\thesubfigure}{\alph{subfigure}}  % a, b etc.
%%%%%%%%%%%%%%%%%%%%%%
%% Header and Footer
%%%%%%%%%%%%%%%%%%%%%%
\pagestyle{fancy}                       % Set default style
\fancyhf{}                              % Clear all header and footer fields
\lhead{\bodyfont\printtitle}                   % Left head
\rhead{\bodyfont\nouppercase\leftmark}    % Right head
\lfoot{\bodyfont\printdate}                 % Left foot
\rfoot{\bodyfont\thepage}                 % Right foot
% Redefine the plain page style
\fancypagestyle{plain}{ % Used at start of chapter
    \fancyhf{} % clear all header and footer fields
    \lhead{\bodyfont\printtitle}
    \rhead{\bodyfont\nouppercase\leftmark}
    \lfoot{\bodyfont\printdate}
    \rfoot{\bodyfont\thepage}
}
