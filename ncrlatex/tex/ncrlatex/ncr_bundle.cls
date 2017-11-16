%% Netherlands Centre for River Studies (NCR) Conference proceedings LaTeX class
%% 
%% This LaTeX class is used to make a Book of Abstract / Bundle / Conference
%% Proceedings for the Netherlands Centre of River Studies. It inherits the
%% 'book' class and provides the following special definitions:
%% 
%% \OrganisingPartner{int} : {1=Deltares, 2=Wageningen, 3=IHE Delft, 4=Twente.
%%                            5=Utrecht, 6=rijkswaterstaat, 7=radboud, 8=TUD}
%% \ConferenceVenue{str} : as input, give the address of the conference venue
%% \ConferenceContact{str} : as input, give the contact information of the conference 
%% \ncrtitle : redefinition of the \maketitle
%% \insertmydocument{section}{title}{authors}{path to file}: inserts a single abstract,
%%                                                           file must be pdf 
%%
%%
%% See accompanying template on how to use this class
%%
%% Original author: Koen Berends (koen.berends@deltares.nl)
%% Contact: secretary@ncr-web.org
%% Copyright (c) 2017 Netherlands Cente for River Studies
%% 
%% Permission is hereby granted, free of charge, to any person obtaining a copy
%% of this software and associated documentation files (the "Software"), to deal
%% in the Software without restriction, including without limitation the rights
%% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
%% copies of the Software, and to permit persons to whom the Software is
%% furnished to do so, subject to the following conditions:
%% 
%% The above copyright notice and this permission notice shall be included in all
%% copies or substantial portions of the Software.
%% 
%% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
%% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
%% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
%% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
%% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
%% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
%% SOFTWARE.

% =============================================================================
% 0) Meta
% =============================================================================

\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{ncr_bundle}
              [2017/02/17]
\makeatletter

\LoadClass[12pt, a4paper,titlepage]{book}

% =============================================================================
% 1) Packages & variables
% =============================================================================

\usepackage[utf8]{inputenc}
\usepackage{graphicx}
\usepackage{blindtext, color}
\usepackage{subcaption}
\usepackage{pgffor, ifthen}

\newcommand{\ConferenceVenueAddress}[1]{\def\@ConferenceVenueAddress{#1}}
\newcommand{\ConferenceVenueContact}[1]{\def\@ConferenceVenueContact{#1}}
\newcommand{\OrganisingPartner}[1]{\def\@OrganisingPartner{#1}}
\newcommand{\PartnerLogo}[1]{\def\@PartnerLogo{#1}}
\newcommand{\HeaderText}[1]{\def\@HeaderText{#1}}
\newcommand{\edition}[1]{\def\@edition{#1}}
\newcommand{\PublicationNumber}[1]{\def\@PublicationNumber{#1}}
\newcommand{\AuthorCitation}[1]{\def\@AuthorCitation{#1}}
\definecolor{gray75}{gray}{0.75}
\definecolor{gray65}{gray}{0.65}

% =============================================================================
% 2) Fonts & style
% =============================================================================

% The NCR uses computer modern sans serif
\renewcommand{\sfdefault}{cmss}
\renewcommand{\familydefault}{\sfdefault}

% enable the selected main text font
\normalfont\selectfont

% Set font sizes
\renewcommand\Large{\@setfontsize\Large{16pt}{18}}
\renewcommand\normalsize{\@setfontsize\normalsize{10pt}{12}}
\renewcommand\small{\@setfontsize\normalsize{9pt}{11}}

% Header styles
\usepackage{fancyhdr}
\renewcommand{\headrulewidth}{0pt}
\fancypagestyle{plain}{
    \fancyhf{}% Clear header/footer
    \fancyhead[RE]{\includegraphics[width=2cm]{figures/ncrlogo_notext.png}}
    \fancyhead[LE]{\@HeaderText}
    \fancyhead[LO]{\includegraphics[width=2cm]{figures/ncrlogo_notext.png}}
    \fancyhead[RO]{\@HeaderText}
    \fancyfoot[C]{\ifnum\value{page}<2\relax\else\thepage\fi}
}
\pagestyle{plain}% Set page style to plain.

% Heading styles
\usepackage{titlesec} 
\titleformat{\part}[block]{\normalfont\huge}{}{1em}{\Huge}
\titleformat{\chapter}[block]{\normalfont\huge}{}{0pt}{\Huge}
\titlespacing*{\chapter}{0pt}{-10pt}{10pt}
\titleformat{\section}[block]{\normalfont\large}{\textcolor{gray75}{}}{0pt}{}
\titlespacing*{\section}{0pt}{0pt}{10pt}
\setcounter{secnumdepth}{-2} 

% =============================================================================
% 3) Page margins
% =============================================================================

\setlength{\voffset}{-2cm}
\setlength{\topmargin}{1cm}
\setlength{\textheight}{650pt}
\setlength{\marginparwidth}{0cm}
\setlength{\headheight}{0.5cm}
\setlength{\headsep}{1cm}
\setlength{\footskip}{3cm}
\linespread{1.2}

% =============================================================================
% 4) Tables tweak
% =============================================================================
% Courtesy of Deltares report style by Jan Mooiman

\usepackage{etoolbox}
\setcounter{tocdepth}{3} % i.e. chapter, section, subsection and subsubsection

\renewcommand*\l@section{\@dottedtocline{1}{1.5em}{2.7em}}
\renewcommand*\l@subsection{\@dottedtocline{2}{4.2em}{3.6em}}
\renewcommand*\l@subsubsection{\@dottedtocline{3}{7.8em}{4.5em}}
\renewcommand*\l@paragraph{\@dottedtocline{4}{12.3em}{5.4em}}
\renewcommand*\l@subparagraph{\@dottedtocline{5}{17.7em}{6.3em}}
\renewcommand*\l@figure{\l@section}
\renewcommand*\l@table{\l@figure}

\AtEndEnvironment{figure}{\gdef\there@is@a@figure{}\label{fig:was:used:in:doc}}%
\AtEndDocument{\ifdefined\there@is@a@figure\label{fig:was:used:in:doc}\fi}%
\newcommand{\conditionalLoF}{\@ifundefined{r@fig:was:used:in:doc}{}{\listofFigures}}%

\AtBeginEnvironment{longtable}{\gdef\there@is@a@table{}\label{table:was:used:in:doc}}%
\AtEndEnvironment{table}{\gdef\there@is@a@table{}\label{table:was:used:in:doc}}%
\AtEndDocument{\ifdefined\there@is@a@table\label{table:was:used:in:doc}\fi}%
\newcommand{\conditionalLoT}{\@ifundefined{r@table:was:used:in:doc}{}{\listofTables}}%

\renewcommand\tableofcontents{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \begingroup
        \chapter*{\contentsname
            \@mkboth{%
               \contentsname}{\contentsname}}%
               \parskip\z@%
        \@starttoc{toc}%
        \if@restonecol\twocolumn\fi
    \endgroup
    }
\newcommand\listofFigures{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \begingroup
        \nonumchapter{\listfigurename}%
          \@mkboth{\listfigurename}%
                  {\listfigurename}%
          \parskip\z@%
        \@starttoc{lof}%
        \if@restonecol\twocolumn\fi
    \endgroup
    }
\newcommand\listofTables{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \begingroup
        \nonumchapter{\listtablename}%
          \@mkboth{%
              \listtablename}%
             {\listtablename}%
          \parskip\z@%
        \@starttoc{lot}%
        \if@restonecol\twocolumn\fi
    \endgroup
    }
\newcommand\listofPhotos{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \begingroup
        \nonumchapter{\listtablename}%
          \@mkboth{%
              \listtablename}%
             {\listtablename}%
          \parskip\z@%
        \@starttoc{lot}%
        \if@restonecol\twocolumn\fi
    \endgroup
    }

% =============================================================================
% 5) Custom title page
% =============================================================================
%

\def\maketitle{%
\thispagestyle{empty}
\vspace*{2cm}%
\begin{center}
    %\includegraphics[height=5cm]{figures/ncrdayslogo.png}
    \par\LARGE{NCR DAYS \@edition}
    \par\Large{\emph{\@title}}%
    \vspace{2cm}%
    \par\large{\emph{\@author}}%

\end{center}
\cleardoublepage
\newpage}

\newcommand{\contactncrsecretary}{
        \begin{tabular}{@{}p{0.50\textwidth}p{0.50\textwidth}}
        \begin{tabbing}
            \textbf{Contact NCR} \\
            ir. K.D. Berends (Programme Secretary)\\
            Netherlands Centre for River Studies \\
            c/o University of Twente\\
            P.O. box 217\\
            7500 AE Enschede\\
            The Netherlands
        \end{tabbing}
        &
        \begin{tabbing}
            \\
            telephone: \=  +31\,6\,21\,28\,74\,61\\
            e-mail:    \>  secretary@ncr-web.org\\
            www:       \>  \url{http://www.ncr-web.org}
        \end{tabbing}
    \end{tabular}
    }
  

\newcommand{\conferencevenue}{
\begin{tabular}{@{}p{0.50\textwidth}p{0.50\textwidth}}
        \begin{tabbing}
        \textbf{Conference venue}\\
            \@ConferenceVenueAddress
        \end{tabbing}
        &
        \begin{tabbing}
            \\
            \@ConferenceVenueContact
        \end{tabbing}
    \end{tabular}
}

\newcommand{\copyrightncr}{
    \vfill Copyright {\copyright} \number\year~ Netherlands Centre for River studies\\
    All rights reserved. No part of this document may be reproduced in any form by print,
    photo print, photo copy, microfilm or any other means, without written permission from the
    publisher: Netherlands Centre for River studies.
}


\newcommand{\ncrtitle}{%
    % -- Title page
    \frontmatter
    \maketitle

    % -- Colofon page
    \begin{figure}[t]
        \centering
        \caption*{Organising partner:}
        \ifdefstring{\@OrganisingPartner}{1}{\PartnerLogo{figures/deltareslogo.jpg}}{}
        \ifdefstring{\@OrganisingPartner}{2}{\PartnerLogo{figures/wageningenlogo.png}}{}
        \ifdefstring{\@OrganisingPartner}{3}{\PartnerLogo{figures/ihedelftlogo.png}}{}
        \ifdefstring{\@OrganisingPartner}{4}{\PartnerLogo{figures/Twentelogo.jpg}}{}
        \ifdefstring{\@OrganisingPartner}{5}{\PartnerLogo{figures/utrechtlogo.png}}{}
        \ifdefstring{\@OrganisingPartner}{6}{\PartnerLogo{figures/rijkswaterstaatlogo.jpg}}{}
        \ifdefstring{\@OrganisingPartner}{7}{\PartnerLogo{figures/radboudlogo.png}}{}
        \ifdefstring{\@OrganisingPartner}{8}{\PartnerLogo{figures/tudlogo.jpg}}{}        
        \includegraphics[width=2.5in]{\@PartnerLogo}
    \end{figure}
    \begin{figure}[t]
        \centering
        \caption*{Co-sponsored by:}  
        \includegraphics[width=2.5in]{figures/nwologo.jpg}
    \end{figure}
    % -------------
    % Venue information
    % -------------
    \vfill
    
    \noindent\ignorespaces\conferencevenue
    \contactncrsecretary

    \vfill
    \noindent\ignorespaces \textbf{Cite as}: {\@AuthorCitation\xspace(\@edition), \emph{\@title\xspace: NCR DAYS\xspace\@edition\xspace Proceedings}. Netherland Centre for River Studies publication \@PublicationNumber}

    \copyrightncr

    \mainmatter

}%


% =============================================================================
% 6) Special commands
% =============================================================================
%

% command to insert abstracts
\usepackage{pdfpages}
\usepackage[titles]{tocloft}
\newcommand{\insertmydocument}[4]%
{ % Syntax: \insertmydocument{Toc level}{Title}{Subtitle}{File}
    % Requires: tocloft hyperref pdfpages
    \newpage
    \phantomsection
    \cftaddtitleline{toc}{#1}{#2}{\thepage}
    \cftchapterprecistoc{#3}
    \includepdf[pages=-, offset=0.0cm -2.5cm]{#4}
}

% command to insert notespage
\newcommand{\notes}[3][\empty]{%
    \newpage
    \chapter{Notes}
    \foreach \n in {1,...,#2}{%
        \ifthenelse{\equal{#1}{\empty}}
            {\textcolor{gray65}{\rule{#3}{0.5pt}}\\}
            {\textcolor{gray65}{\rule{#3}{0.5pt}\vspace{#1}}\\}
        }
}
\newcommand{\notespages}{\notes[5pt]{128}{\textwidth}} % 33 lines per page

% =============================================================================
% 7) Hyperref
% =============================================================================
%

\usepackage{hyperref}
\hypersetup{
    unicode=false,          % non-Latin characters in Acrobat’s bookmarks
    pdftoolbar=true,        % show Acrobat’s toolbar?
    pdfmenubar=true,        % show Acrobat’s menu?
    pdffitwindow=false,     % window fit to page when opened
    pdfstartview={FitH},    % fits the width of the page to the window
    pdftitle={\@title},    % title
    pdfauthor={\@author},     % author
    pdfsubject={Subject},   % subject of the document
    pdfcreator={Netherlands Centre for River Studies},   % creator of the document
    pdfproducer={Netherlands Centre for River Studies}, % producer of the document
    pdfkeywords={rivers,science,netherlands,
                 hydrodynamics,morphodynamics,ecohydraulics,biology,sociology,
                 serious gaming}, % list of keywords
    pdfnewwindow=true,      % links in new PDF window
    colorlinks=true,       % false: boxed links; true: colored links
    linkcolor=blue,          % color of internal links (change box color with linkbordercolor)
    citecolor=green,        % color of links to bibliography
    filecolor=magenta,      % color of file links
    urlcolor=cyan           % color of external links
}

\endinput