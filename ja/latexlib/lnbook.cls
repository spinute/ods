\NeedsTeXFormat{pLaTeX2e}
\ProvidesClass{lnbook}[2016/06/18 Typesetting books for Lambda Note Ltd.]
\newif\if@paper
\@paperfalse
\DeclareOption{paper}{\@papertrue}
\newif\if@ams
\@amsfalse
\DeclareOption{ams}{\@amstrue}
\newcommand{\my@ptsize}{0}
\DeclareOption{12.5Q}{\renewcommand{\my@ptsize}{1250}}
\newcommand{\d@psize}{0}
\DeclareOption{a5}{\renewcommand{\d@psize}{1}}
\DeclareOption{b5}{\renewcommand{\d@psize}{2}}
\DeclareOption{b5v}{\renewcommand{\d@psize}{3}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{jsbook}}
\ProcessOptions\relax
\ifnum\my@ptsize=1250
  \mag 969
  \setlength\paperwidth{1.04469395\paperwidth}%
  \setlength\paperheight{1.04469395\paperheight}%
\fi
\LoadClass{jsbook}

\def\@setfontsize#1#2#3{%
  \ifx\protect\@typeset@protect
    \let\@currsize#1%
  \fi
  \fontsize{#2}{#3}\selectfont
  \ifdim\parindent>\z@
    \parindent=1zw
  \fi
  \kanjiskip=0zw plus .1zw minus .01zw
  \ifdim\xkanjiskip>\z@
    \if@slide \xkanjiskip=0.1em \else
      \xkanjiskip=0.15em plus 0.05em minus 0.03em
    \fi
  \fi}

\xspcode`#=3
\xspcode`>=3
\xspcode`<=3
\xspcode`.=3
\xspcode`+=3
\xspcode`-=3
\xspcode`*=3
\xspcode`==3
\xspcode`$=3
\xspcode`!=3
\xspcode`?=3
\xspcode`^=3
\xspcode`&=3
\xspcode`(=3
\xspcode`)=3
\xspcode`[=3
\xspcode`]=3
\xspcode`_=3
\xspcode`|=3
\xspcode`{=3
\xspcode`}=3
\xspcode`"=3
\xspcode`'=3
\xspcode`0=3
\xspcode`1=3
\xspcode`2=3
\xspcode`3=3
\xspcode`4=3
\xspcode`5=3
\xspcode`6=3
\xspcode`7=3
\xspcode`8=3
\xspcode`9=3

\renewcommand{\baselinestretch}{1.1}

\setlength{\hoffset}{0truemm}
\setlength{\voffset}{0truemm}

\setbox0\hbox{\char\ucs"3000}%
\setlength{\Cht}{\ht0}
\setlength{\Cdp}{\dp0}
\setlength{\Cwd}{\wd0}
\setlength{\Cvs}{\baselineskip}
\setlength{\Chs}{\wd0}

\ifnum\d@psize=1 % A5

  % 1.09529 (jsclass 9pt mag)
  
  \paperwidth=148 truemm
  \textwidth=38 \Cwd%
  \oddsidemargin\paperwidth
  \advance\oddsidemargin by -\textwidth
  \oddsidemargin.5\oddsidemargin
  \evensidemargin\oddsidemargin
  \advance\evensidemargin by -2 truemm
  \advance\oddsidemargin by 2 truemm
  \marginparwidth=10 truemm
  \marginparsep=2 truemm

  \paperheight=210 truemm
  \topskip\baselineskip
  \headsep=8 truemm
  \headheight=8 truemm
  \footskip=12 truemm
  \advance\headsep by-\topskip
  \advance\headsep by \Cht
  \textheight=36 \baselineskip
  \advance\textheight by \topskip

  \topmargin\paperheight
  \advance\topmargin by -\textheight
  \topmargin.5\topmargin
  \advance\topmargin by -\headheight
  \advance\topmargin by -\headsep

\fi
\ifnum\d@psize=2 % B5

  \paperwidth=182 truemm
  \textwidth=42 \Cwd%
  \oddsidemargin\paperwidth
  \advance\oddsidemargin by -\textwidth
  \oddsidemargin.5\oddsidemargin
  \evensidemargin\oddsidemargin
  \marginparwidth=15 truemm
  \marginparsep=2 truemm

  \paperheight=257 truemm
  \topskip\baselineskip
  \headsep=10 truemm
  \headheight=10 truemm
  \footskip=15 truemm
  \advance\headsep by-\topskip
  \advance\headsep by \Cht
  \textheight=39 \baselineskip
  \advance\textheight by \topskip

  \topmargin\paperheight
  \advance\topmargin by -\textheight
  \topmargin.5\topmargin
  \advance\topmargin by -\headheight
  \advance\topmargin by -\headsep

\fi
\ifnum\d@psize=3 % B5変

  \paperwidth=182 truemm
  \textwidth=42 \Cwd%
  \oddsidemargin\paperwidth
  \advance\oddsidemargin by -\textwidth
  \oddsidemargin.5\oddsidemargin
  \evensidemargin\oddsidemargin
  \marginparwidth=15 truemm
  \marginparsep=2 truemm

  \paperheight=235 truemm
  \topskip\baselineskip
  \headsep=10 truemm
  \headheight=10 truemm
  \footskip=15 truemm
  \advance\headsep by-\topskip
  \advance\headsep by \Cht
  \textheight=40 \baselineskip
  \advance\textheight by \topskip

  \topmargin\paperheight
  \advance\topmargin by -\textheight
  \topmargin.5\topmargin
  \advance\topmargin by -\headheight
  \advance\topmargin by -\headsep

\fi

\setlength{\doublerulesep}{0pt}
\raggedbottom

\newlength{\nombleexpand}
\setlength{\nombleexpand}{0mm}      % ノンブルが本文版面からはみ出す長さ
\newlength{\headerwidth}
\setlength{\headerwidth}{\textwidth}
\addtolength{\headerwidth}{\nombleexpand}
\def\ps@bookheadings{%
  \let\@oddfoot\@empty%
  \let\@evenfoot\@empty%
  \def\@evenhead{%
    \hbox to \headerwidth{%\autoxspacing%
      \kern-\nombleexpand{%
      \hbox to5mm{\small{\usefont{T1}{pzc}{m}{it}\thepage}\hfill} \hbox to2mm{\hss}%
      \hbox {\footnotesize\sffamily\leftmark}%
      \hfill}}}%
  \def\@oddhead{%
    \hbox to \headerwidth{%\autoxspacing%
      \hfil%
      \hbox {\footnotesize\sffamily\rightmark} \hbox to2mm{\hss}%
      \hbox to5mm{\hfill\small{\usefont{T1}{pzc}{m}{it}\thepage}}}}}
\def\ps@titleheadings{%
  \let\@oddhead\@empty%
  \let\@evenhead\@empty%
  \def\@evenfoot{%
     \parbox{\textwidth}{%
       \hss\\[.5\baselineskip]%
       %\hbox to\textwidth{\hfill\footnotesize\sffamily\thepage\hfill}
       }}
  \def\@oddfoot{%
     \parbox{\textwidth}{%
       \hss\\[.5\baselineskip]%
       %\hbox to\textwidth{\hfill\footnotesize\sffamily\thepage\hfill}
       }}}

\usepackage{xpatch}
\xpatchcmd{\plainifnotempty}{plainhead}{titleheadings}{}{}
\xpatchcmd{\@startsection}{\vspace*{-\baselineskip}}{\vskip-\baselineskip}{}{}
\xpatchcmd{\@sect}{\addcontentsline}{\phantomsection\addcontentsline}{}{}

\def\thefootnote{\ifnum\c@footnote>\z@\leavevmode\raise.2ex\hbox{\scriptsize$\dagger$}\@arabic\c@footnote\fi}

\newcommand{\signamesize}{\fontsize{11pt}{11pt}\selectfont}
\newlength{\signamelen}
\newcommand{\signature}[5][!]{%
  % #1 optional title (above the name)
  % #2 name
  % #3 date
  % #4 left headed text
  % #5 title or something (leftside of the name)
  \settowidth{\signamelen}{#2}%
  \vskip1zh%
  {\leavevmode\hbox to2zw{\hss}#4 \mbox{}\relax}\par
  \ifx!#1\else\hfill \hbox{#1}\hbox to1zw{\hss}\par\fi
  \hfill%
    \hbox to4zw{#5}\,\,\,%
    \ifthenelse{\lengthtest{\signamelen < 4zw}}{\hbox to4zw{#2}}{\hbox{#2}}%
    \hbox to1zw{\hss}\par
  \hfill \hbox{#3}\hbox to1zw{\hss}}


