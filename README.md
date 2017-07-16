## Open Data Structures 日本語訳プロジェクト

[Open Data Structures](http://opendatastructures.org/)というプロジェクトをご存知だろうか。
これは[Pat Morin](http://cglab.ca/~morin/)氏が立ち上げたプロジェクトで、
大学のコンピュータサイエンス系の学部ならほぼ皆が最初に学ぶデータ構造に関する教科書をフリーで公開するものである。

### なぜ翻訳をするのか
まず、本を英語から日本語に翻訳する意味はあるのだろうか？

個人的には英語よりも日本語を読む方がかなり早い。
しかし、専門書を読むときはついつい翻訳は避けてしまう。
品質のばらつきが大きく、読みにくいものも多いと感じるのが自分の場合は主な原因だ。

しかし、この教科書は入門書である。
前提知識は中学高校レベルの数学をほんの少しだけである。
（簡単なプログラミング経験があった方が、実感が持てて、有り難みがわかり、楽しく読めるとは思うが。）
日本語で読める無料の教科書は、分野の裾野を広げ、楽しくプログラムを書ける・効率的なプログラムが書ける人を増やしてくれるだろう。

母国語で大学レベルの教科書が読める国は多くない。
より専門的な内容はもっぱら英語で読むことになるのだから、さっさと崖から突き落とせという意見ももちろんあるだろう。
自分自身も大学に入った頃は「英語で読む」のに抵抗があった。（「英語を読む」ところまでは幸い受験で慣れた。）
この抵抗を可及的速やかに取り除くのが、アクセス可能な知識を押し拡げるためには極めて重要だろう。
大学生になっても日本語で教科書が読める恵まれた環境が、日本人の英語アレルギーを支えている可能性はある。

しかし、この教科書は専門への橋渡しの、その初っ端に位置している。
この教科書の前提とする知識は多くない。これに英語を加えるのは、対象読者を制限することになるだろう。
母国語でこのような入門書が読める、少なくともその選択肢があるのは望ましいことだと思う。

この教科書は、300ページ程度ながら、丁寧にゆっくりと、それでいて実用的な題材を納めている。
より本格的な教科書も出版されており、その中には翻訳されているものもある。
内容は素晴らしく、僕自身今でも度々読み返す。
少なくとも自分の持っている二冊は翻訳の質も良かった。（[Algorithm Design](http://www.cs.princeton.edu/~wayne/kleinberg-tardos/)と[Introduction to Algorithms](https://mitpress.mit.edu/books/introduction-algorithms)）
ただし、文量は大判1000ページ程度、価格は10000円程度と、気軽なものではない。
こういった専門家向けの入門書や、あるいはより専門的な書籍への橋渡しであるこの教科書を、日本語で・フリーでアクセスできるようにするのがこの翻訳の目的である。
## README in the original repository

latex/ contains the latex sources
java/ods contains the java sources
cpp contains the C++ sources (still under development)

To make the books (ods-java.pdf and ods-cpp.pdf and ods-python.pdf):
  mkdir ~/texmf/tex/latex/ods/
  cp ods-colors.sty ~/texmf/tex/latex/ods/
  cd latex ; make
This will require a decent installation of pdflatex, perl, ipe, inkscape,
gnuplot, and pdftk.  

If you have problems with tikz figures, consult the solution here: 
http://goo.gl/hCvlyp

If ipetoipe generates errors about ods-colors.sty, then try this:

  mkdir -p ~textmf/tex/latex/ods/
  ln -s $PWD/latex/ods-colors.sty ~textmf/tex/latex/ods/
  texhash


To make the Java archive ods.jar:
  cd java ; make

To make both:
  make

What's in here:
  java/test    - Test code from Sun/Oracle and Apache
  java/junk    - Small sample code snippets used in the text
  java/ods     - The Java data structures sources
  cpp          - The C++ data structures sources and sample code
  python       - The Python code used to generate the pseudocode version
  python/tests - Unit tests for the Python code
  latex        - The book's latex source code and scripts
  latex/figs   - The book's ipe figures
  latex/images - Images used in the book


How it works:
The Makefile and Perl script in ./latex do the following:
  1. Convert ipe figures in ./latex/figs into pdf
  2. Convert svg figures in ./latex/images into pdf
  3. Scan the latex sources and generate -java.tex and -cpp.tex files
     that include source code from ./java and ./cpp directories
  4. Run pdflatex and bibtex to generate the file ods-java.pdf and
     ods-cpp.pdf

