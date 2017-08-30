\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{lessonplan}[2017/07/26 Code for Life Lesson Plans]
\LoadClass[a4paper,12pt,oneside]{article}

\RequirePackage{enumitem}
\RequirePackage{fancyhdr}
\RequirePackage{fontspec}
\RequirePackage[a4paper, left=1cm, right=1.33cm, top=100pt, bottom=100pt, head=33pt, foot=33pt]{geometry}
\RequirePackage{graphicx}
\RequirePackage{multicol}
\RequirePackage[parfill]{parskip}
\RequirePackage{ragged2e}
\RequirePackage[usenames,dvipsnames,svgnames,table]{xcolor}
\RequirePackage{xltxtra}
\RequirePackage{xunicode}
\RequirePackage[percent]{overpic}
\RequirePackage[none]{hyphenat}


\RequirePackage{wrapfig}

\RequirePackage{paracol}

\RequirePackage{tikz}
\usetikzlibrary{positioning}
\usetikzlibrary{shapes.geometric}
\usetikzlibrary{shapes.misc}

\RequirePackage{hyperref}

\setmainfont[
    Ligatures=TeX,
    BoldFont={SourceSansPro-SemiBold},
    ItalicFont={SourceSansPro-LightItalic}
    ]{SourceSansPro-Light}

\newfontfamily{\baloo}{Baloo-Regular}
\newfontfamily{\sourcesansreg}{SourceSansPro-Regular}

\definecolor{cflblack}{HTML}{3C3C3B}
\definecolor{cflblue}{HTML}{009EE3}
\definecolor{cflgreen}{HTML}{A0C445}
\definecolor{cflred}{HTML}{CD1619}
\definecolor{cflpurple}{HTML}{510862}

\setlength{\columnsep}{20mm}

\AtBeginDocument{
    \RaggedRight
    \pagestyle{fancy}
    \fancyhf{}
    \header
    \footer
}

\newcommand{\cflroot}{.}

\newcommand{\cflplaceholder}[1]{«#1»}
\newcommand{\lessonid}{\cflplaceholder{plan id}}

\newcommand{\header}{

    \fancyhead[C]{
      \colorbox{cflblack}{
        \begin{minipage}[c][19mm]{\textwidth}
            \hspace{5mm}
            \includegraphics[width=.4\textwidth]{\cflroot/res/CFL_Logo_Horizontal.png}
            \hfill
            {\color{white}\fontsize{20pt}{24pt}\selectfont\textbf{\lessonid}}
            \hspace{5mm}
       \end{minipage}
    }}
}

\newcommand{\footertext}[1]{{\sourcesansreg\fontsize{8pt}{10pt}\selectfont #1}}
\newcommand{\footer}{
    \fancyfoot[L]{\footertext{Lesson plans — \lessonid}}
    \fancyfoot[R]{\footertext{www.codeforlife.education | \thepage}}
    \renewcommand{\headrulewidth}{0pt}
    \renewcommand{\footrulewidth}{1pt}
}

\newcommand{\lessonplantitle}[3]{
    %%%%%%%%%% #1: lesson plan id
    \renewcommand{\lessonid}{#1}


    % \colorbox{cflblack}{
    %     \begin{minipage}[c][19mm]{\textwidth}
    %         \hspace{5mm}
    %         \includegraphics[width=.4\textwidth]{\cflroot/res/CFL_Logo_Horizontal.png}
    %         \hfill
    %         {\color{white}\fontsize{20pt}{24pt}\selectfont\textbf{\lessonid}}
    %         \hspace{5mm}
    %    \end{minipage}
    % }
    \colorbox{cflgreen}{
        \begin{minipage}[c]{\linewidth}
        \begin{tikzpicture}
            \draw (0, 0) node[inner sep=0] {
              \includegraphics[width=\textwidth,trim={80in 0 0in 0},clip]{\cflroot/res/RapidRouter_logoHEADER.jpg}
              };
            \draw (-3, 0) node {\parbox[l]{.65\linewidth}{
              \baloo\color{white}\fontsize{20pt}{24pt}\selectfont
              \raggedright
              #2 \newline
              #3
              }};
        \end{tikzpicture}


        % \parbox[l]{.65\linewidth}{
        %     \baloo\color{white}\fontsize{20pt}{24pt}\selectfont
        %     \vspace{-35mm}
        %     \raggedright
        %     %%%%%%%%%% #2: lesson plan name
        %     #2 \newline
        %     %%%%%%%%%% #3: lesson plan summary (could include new line?)
        %     #3
        % }
        %\hfill
        %\makebox[.2\linewidth][r]{\includegraphics[width=.2\linewidth,trim={119in 0 1in 0},clip]{\cflroot/res/RapidRouter_logoHEADER.jpg}}
        \end{minipage}
    }
}

\newcommand{\preamble}[3]{
    \begin{itemize}[noitemsep]
    %%%%%%%%%% #1: learning objective items
    #1
    \end{itemize}
    \begin{multicols}{2}
    \colheading{Resources}
    \begin{itemize}[noitemsep]
    %%%%%%%%%% #2: resource items
    #2
    \end{itemize}
    \vfill
    \columnbreak
    \colheading{Vocabulary}
    \begin{center}
    \colorbox{cflpurple!20}{
        \parbox{.9\linewidth}{
            \vspace{1em}
            \begin{itemize}[noitemsep]
            %%%%%%%%%% #3: vocabulary items
            #3
            \end{itemize}
            \vspace{1em}
        }
    }
    \end{center}
    \vfill
    \end{multicols}
    \vspace{-1em}
}

\newenvironment{lessonplan}
    {\vspace{1ex}
     \wideheading{Let's get started}
     \begin{paracol}{2}
    }
    {\end{paracol}}

\newcommand{\firstparagraph}[1]{\textbf{#1}}

\newcommand{\keyword}[1]{{\color{cflblue}\textbf{#1}}}

\newcommand{\keyquestion}[1]{{\color{cflred}\textbf{#1}}}

\newcommand{\colheading}[1]{
\begin{tikzpicture}
    \draw (0, 0) node[inner sep=0] {\includegraphics[width=\columnwidth]{\cflroot/res/1-col-heading-bar-purple.png}};
    \draw (.6, 0) node {\parbox{\linewidth}{\fontsize{14pt}{16pt}\color{white} \selectfont \textbf{#1}}};
\end{tikzpicture}
}

\newcommand{\wideheading}[1]{
\begin{tikzpicture}
    \draw (0, 0) node[inner sep=0] {\includegraphics[width=\columnwidth]{\cflroot/res/2-col-heading-bar-green.png}};
    \draw (.6, 0) node {\parbox{\linewidth}{\fontsize{14pt}{16pt}\color{white} \selectfont \textbf{#1}}};
\end{tikzpicture}
}


\newcommand{\fig}[3]{

    \switchcolumn

    \includegraphics[width=#3\linewidth]{#2}
    \begin{flushright}
    \textit{#1}
    \end{flushright}

    \switchcolumn

}
