# Features

All the features available in this `report` template,
will be described here.

The template used is the report template, v\printtemplateversion.  

## biber

This template has support for references from a `.bib` file.
See \cite{website:BiberTemplates}.

And another reference to some random article: \cite{blackholes}.

## include markdown

## custom fonts

Load custom font files for the headers of the main body.

Use the following commands.

```{language=tex}
% fonts (according to fontspec rules)
% header font
\setheadfont{
    Path = {../fonts/nimbus-sans-l/} ,
    Extension = .ttf ,
    UprightFont = nimbus-sans-l_regular ,
    ItalicFont = nimbus-sans-l_italic ,
    BoldFont = nimbus-sans-l_bold ,
    BoldItalicFont = nimbus-sans-l_bold-italic,
    Ligatures = {   % Set Ligature options
       NoCommon,
       NoRequired,
       NoContextual,
       NoHistoric,
       NoDiscretionary,
       TeX
    }
}{nimbus-sans-l}
% body font
\setbodyfont{
    Path = {../fonts/liberation_sans/} ,
    Extension = .ttf ,
    UprightFont =LiberationSans-Regular ,
    ItalicFont = LiberationSans-Italic ,
    BoldFont = LiberationSans-Bold ,
    BoldItalicFont = LiberationSans-BoldItalic,
    Ligatures = {   % Set Ligature options
       NoCommon,
       NoRequired,
       NoContextual,
       NoHistoric,
       NoDiscretionary,
       TeX
    }
}{liberation-sans}
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
        \input{../packages/tikz-er2/docs/cars}
    }
    \caption{E-R diagram for a used car store database.}
    \label{fig:er_diagram_for_a_used_car_store_database.}
\end{figure}
