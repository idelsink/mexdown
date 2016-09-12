# Features

All the features available in this `report` template,
will be described here.

The template used is the report template, v\printtemplateversion.  

## biber

This template has support for references from a `.bib` file.
See \cite{website:BiberTemplates}.

And another reference to some random article: \cite{blackholes}.

## include markdown

```tex
\inputmarkdown{path}{filename}{optional parameters}
```

Optional parameters:

-   `unlisted` : unlisted chapter

## custom fonts

Load custom font files for the headers of the main body.

Use the following command.

```tex
% fonts (according to fontspec rules)
\addfontfamily{
    Path = {path to files} ,
    Extension = .extension-of-font-files ,
    UprightFont = filename-of-normal-font ,
    ItalicFont = filename-of-italic-font ,
    BoldFont = filename-of-bold-font ,
    BoldItalicFont = filename-of-bolditalic-font,
    Ligatures = {   % Set Ligature options
       NoCommon,
       NoRequired,
       NoContextual,
       NoHistoric,
       NoDiscretionary,
       TeX
    }
}{font name}{optional: macro name}
```

## lists

-   item 1
-   item 2

## EER diagrams

Make diagrams with tikz-er2

\usetikzlibrary{positioning}
\usetikzlibrary{shadows}
\begin{figure}[H]
    \centering
    \resizebox{.9\textwidth}{!}{
        \input{cars}
    }
    \caption{E-R diagram for a used car store database.}
    \label{fig:er_diagram_for_a_used_car_store_database.}
\end{figure}

## Linking to things

[This](#summary) links to the summary. 

## Tests

Add list at **END** of chapter.

-   item 1
-   item 2
