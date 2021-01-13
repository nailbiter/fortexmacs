<TeXmacs|1.99.13>

<style|generic>

<\body>
  <doc-data|<doc-title|Pattern Recognition and Machine Learning>>

  Christopher M. Bishop\ 

  <section*|4. Linear Models for Classification>

  three approaches to classification:

  <\enumerate>
    <item>directly build a discriminant function

    <item>model conditional probability distribution
    <math|p<around*|(|\<cal-C\><rsub|k>\<mid\>\<b-x\>|)>> and then do the
    decision

    <item>model class-conditional densities
    <math|p<around*|(|\<b-x\>\<mid\>\<cal-C\><rsub|k>|)>> and prior
    probabilities <math|p<around*|(|\<cal-C\><rsub|k>|)>> and then use Bayes
  </enumerate>

  For multi-classification between classes
  <math|\<cal-C\><rsub|k>,k=1\<ldots\>n>, we use <math|n> linear functions
  <math|f<rsub|k><around*|(|\<b-x\>|)>\<assign\>\<b-w\><rsub|k><rsup|T>\<b-x\>+w<rsub|k<rsub|0>>>
  and assign <math|\<b-x\>> to class <math|\<cal-C\><rsub|k>> if
  <math|f<rsub|k><around*|(|\<b-x\>|)>\<gtr\>f<rsub|i><around*|(|\<b-x\>|)>,\<forall\>i\<neq\>k>.
  In this case all decision regions are convex (and path-connected).

  Two algorithms for learning:

  <\enumerate>
    <item>least squares

    <item>Fisher's linear determinant;

    <item>perceptron algorithm;
  </enumerate>

  <paragraph|least squares for learning:>

  We pack <math|<wide|\<b-w\><rsub|i>|~>\<assign\><around*|(|\<b-w\><rsub|i>,w<rsub|i<rsub|0>>|)>>
  as columns into matrix <math|<wide|\<b-W\>|~>>, so that
  <math|<around*|(|f<rsub|i><around*|(|\<b-x\>|)>|)><rsub|i>=<wide|\<b-W\>|~><rsup|T><wide|\<b-x\>|~>,>
  where <math|<wide|\<b-x\>|~>\<assign\><around*|(|\<b-x\><rsup|T>,1|)><rsup|T>>.
  Then, we pick <math|<wide|\<b-W\>|~>>, so that\ 

  <\equation*>
    <wide|\<b-W\>|~>=argmin<rsub|<wide|\<b-W\>|~>><big|sum><rsub|i=1><rsup|m><around*|\<\|\|\>|<wide|\<b-W\>|~><rsup|T>\<b-x\><rsub|j>-\<b-t\><rsub|j>|\<\|\|\>><rsup|2>=argmin<rsub|<wide|\<b-W\>|~>><frac|1|2>Tr<around*|{|<around*|(|<wide|\<b-X\>|~><wide|\<b-W\>|~>-<wide|\<b-T\>|~>|)><rsup|T><around*|(|<wide|\<b-X\>|~><wide|\<b-W\>|~>-<wide|\<b-T\>|~>|)>|}>.
  </equation*>

  Where <math|<around*|{|<around*|(|<wide|\<b-x\>|~><rsub|j>,<wide|\<b-t\>|~><rsub|j>|)>|}><rsub|j>>
  is the training set and <math|<wide|\<b-X\>|~>,<wide|\<b-T\>|~>> are
  matrices whose rows are <math|<wide|\<b-x\>|~><rsub|j>,<wide|\<b-t\>|~><rsub|j>>.
  Setting the derivative of <math|Tr<around*|{|\<ldots\>|}>> above to zero
  and rearranging, we get

  <\equation*>
    <wide|\<b-W\>|~>=<wide*|<around*|(|<wide|\<b-X\>|~><rsup|T><wide|\<b-X\>|~>|)><rsup|-1><wide|\<b-X\>|~>|\<wide-underbrace\>><rsub|\<backassign\><wide|\<b-X\>|~><rsup|\<dag\>>>\<cdot\>\<b-T\>
  </equation*>

  Note that if <math|\<exists\>\<b-a\>,b\<forall\>j,\<b-a\><rsup|T>\<b-x\><rsub|j>+b=0>,
  then <math|\<forall\>\<b-x\>,\<b-a\><rsup|T><wide|\<b-W\>|~><rsup|T>\<b-x\>+b=0>.
  Hence, <math|<wide|\<b-W\>|~>> will automaticall map
  <math|<wide|\<b-x\>|~>> to vectors whose coordinates sum up to one.
  However, the coordinates will not necessarily be constrained to
  <math|<around*|[|0,1|]>>. In general, least squares is not a good method
  due to

  <\enumerate>
    <item>lack of robustness

    <item>other problems
  </enumerate>

  <paragraph|Fisher's linear discriminant>

  <with|font-series|bold|Idea>: two separate two classes
  <math|\<cal-C\><rsub|1>,\<cal-C\><rsub|2>\<subset\>\<bbb-R\><rsup|n>>, find
  <math|w:\<bbb-R\><rsup|n>\<rightarrow\>\<bbb-R\>> linear projection, which
  maps images of <math|\<cal-C\><rsub|i>> into subsets of <math|\<bbb-R\>>
  which are easy to separate. For this, one needs to maximize the distance\ 

  <\equation*>
    m<rsub|2>-m<rsub|1>\<assign\>\<b-w\><rsup|T><around*|(|\<b-m\><rsub|2>-\<b-m\><rsub|1>|)>
  </equation*>

  between the projection images of mean vectors
  <math|\<b-m\><rsub|i>\<assign\><frac|1|<around*|\||\<cal-C\><rsub|i>|\|>><big|sum><rsub|\<b-x\>\<in\>\<cal-C\><rsub|i>>\<b-x\>>
  and to minimize within class variances <math|s<rsub|1>,s<rsub|2>> defined
  as

  <\equation*>
    s<rsub|i><rsup|2>\<assign\><big|sum><rsub|\<b-x\>\<in\>\<cal-C\><rsub|i>><around*|(|\<b-w\><rsup|T>\<b-x\>-\<b-w\><rsup|T>\<b-m\><rsub|i>|)><rsup|2>.
  </equation*>

  More precisely, the idea is to maximize:

  <\equation*>
    <stack|<tformat|<table|<row|<cell|J<around*|(|*\<b-w\>|)>\<assign\><frac|<around*|(|m<rsub|2>-m<rsub|1>|)><rsup|2>|s<rsub|1><rsup|2>+s<rsub|2><rsup|2>>=<frac|\<b-w\><rsup|T>\<b-S\><rsub|B>\<b-w\>|\<b-w\><rsup|T>\<b-S\><rsub|W>\<b-w\>>,<text|where>>>|<row|<cell|\<b-S\><rsub|B>\<assign\><around*|(|\<b-m\><rsub|2>-\<b-m\><rsub|1>|)><around*|(|\<b-m\><rsub|2>-\<b-m\><rsub|1>|)><rsup|T>,>>|<row|<cell|\<b-S\><rsub|W>\<assign\><big|sum><rsub|i=1><rsup|2><big|sum><rsub|\<b-x\>\<in\>\<cal-C\><rsub|i>><around*|(|\<b-x\>-\<b-m\><rsub|i>|)><around*|(|\<b-x\>-\<b-m\><rsub|i>|)><rsup|T>,>>>>>
  </equation*>

  subject to the constraing <math|<around*|\<\|\|\>|\<b-w\>|\<\|\|\>>=1>
  (since by enlarging the magnitude of <math|\<b-w\>>,
  <math|J<around*|(|\<b-w\>|)>> can be made arbitrarily large).

  Differentiating <math|J<around*|(|\<b-w\>|)>> with respect to
  <math|\<b-w\>> and equating this to zero, we get

  <\equation*>
    <around*|(|\<b-w\><rsup|T>\<b-S\><rsub|B>\<b-w\>|)>\<b-S\><rsub|W>\<b-w\>=<around*|(|\<b-w\><rsup|T>\<b-S\><rsub|W>\<b-w\>|)>\<b-S\><rsub|B>\<b-w\>.
  </equation*>

  Now, since we only need the direction of <math|\<b-w\>>, we can ignore the
  constants <math|\<b-w\><rsup|T>\<b-S\><rsub|B>\<b-w\>> and
  <math|\<b-w\><rsup|T>\<b-S\><rsub|W>\<b-w\>> to get

  <\equation*>
    \<b-S\><rsub|W>\<b-w\>\<simeq\>\<b-S\><rsub|B>\<b-w\>.
  </equation*>

  Finally, since <math|\<b-S\><rsub|B>\<b-w\>=<around*|(|\<b-m\><rsub|2>-\<b-m\><rsub|1>|)><around*|(|\<b-m\><rsub|2>-\<b-m\><rsub|1>|)><rsup|T>\<b-w\>\<simeq\><around*|(|\<b-m\><rsub|2>-\<b-m\><rsub|1>|)>>,
  we get

  <\equation*>
    \<b-w\>\<simeq\>\<b-S\><rsub|B><rsup|-1><around*|(|\<b-m\><rsub|2>-\<b-m\><rsub|1>|)>.
  </equation*>

  <paragraph|relation of Fisher's discriminant to linear least squares>

  Fisher's discriminant can be related to least squares in the following way:
  suppose that two classes <math|\<cal-C\><rsub|1>,\<cal-C\><rsub|2>> are
  coded with values <math|N/N<rsub|1>,-N/N<rsub|2>> respectively, where\ 

  <\equation*>
    N<rsub|i>\<assign\><around*|\||\<cal-C\><rsub|i>|\|>,N\<assign\>N<rsub|1>+N<rsub|2>.
  </equation*>

  Then, sum-of-squares error function can be written as

  <\equation*>
    E<around*|(|\<b-w\>,w<rsub|0>|)>=<frac|1|2><big|sum><rsub|n=1><rsup|N><around*|(|\<b-w\><rsup|T>\<b-x\><rsub|n>+w<rsub|0>-t<rsub|n>|)><rsup|2>.
  </equation*>

  To find the minimum, we set up the derivatives w.r.t.
  <math|<around*|(|\<b-w\>,w<rsub|0>|)>> to zero to get

  <\equation*>
    <choice|<tformat|<table|<row|<cell|\<partial\>E/\<partial\>\<b-w\>=<big|sum><rsub|n=1><rsup|N><around*|(|\<b-w\><rsup|T>\<b-x\><rsub|n>+w<rsub|0>-t<rsub|n>|)>=0>>|<row|<cell|\<partial\>E/\<partial\>w<rsub|0>=<big|sum><rsub|n=1><rsup|N><around*|(|\<b-w\><rsup|T>\<b-x\><rsub|n>+w<rsub|0>-t<rsub|n>|)>\<b-x\><rsub|n>=\<b-0\>>>>>>
  </equation*>

  Now, since <math|<big|sum><rsub|n=1><rsup|n>t<rsub|n>=0,<big|sum><rsub|n=1><rsup|N><around*|(|\<b-w\><rsup|T>\<b-x\><rsub|n>+w<rsub|0>-t<rsub|n>|)>=0\<Rightarrow\>w<rsub|0>=-\<b-w\><rsup|T>\<b-m\>>,
  where

  <\equation*>
    \<b-m\>\<assign\><frac|1|N><big|sum><rsub|n=1><rsup|N>\<b-x\><rsub|n>.
  </equation*>

  Similarly,

  <\equation*>
    <stack|<tformat|<table|<row|<cell|\<b-0\>=<big|sum><rsub|n=1><rsup|N><around*|(|\<b-w\><rsup|T>\<b-x\><rsub|n>+w<rsub|0>-t<rsub|n>|)>\<b-x\><rsub|n>=<big|sum><rsub|n=1><rsup|N><around*|(|\<b-w\><rsup|T><around*|(|\<b-x\><rsub|n>-\<b-m\>|)>-t<rsub|n>|)>\<b-x\><rsub|n>\<Leftrightarrow\>>>|<row|<cell|\<Leftrightarrow\><big|sum><rsub|n=1><rsup|N>\<b-w\><rsup|T><around*|(|\<b-x\><rsub|n>-\<b-m\>|)>\<b-x\><rsub|n>=<big|sum><rsub|n>t<rsub|n>\<b-x\><rsub|n>=N<around*|(|\<b-m\><rsub|1>-\<b-m\><rsub|2>|)>.>>>>>
  </equation*>

  Now,\ 

  <\equation*>
    <big|sum><rsub|n=1><rsup|N>\<b-w\><rsup|T><around*|(|\<b-x\><rsub|n>-\<b-m\>|)>\<b-x\><rsub|n>=<around*|(|<big|sum><rsub|n>\<b-x\><rsub|n><around*|(|\<b-x\><rsub|n>-\<b-m\>|)><rsup|T>|)>\<b-w\>=<around*|(|\<b-S\><rsub|W>+<frac|N<rsub|1>N<rsub|2>|N>\<b-S\><rsub|B>|)>\<b-w\>,
  </equation*>

  hence\ 

  <\equation*>
    \<b-w\>\<simeq\>\<b-S\><rsub|W><rsup|-1><around*|(|\<b-m\><rsub|2>-\<b-m\><rsub|1>|)>
  </equation*>

  as before. Moreover, we found <math|w<rsub|0>>, so we see that
  <math|x\<in\>\<cal-C\><rsub|1>\<Leftrightarrow\>\<b-w\><rsup|T><around*|(|\<b-x\>-\<b-m\>|)>\<gtr\>0>.

  <paragraph|Fisher's discriminant for multiple classes>

  Suppose we have <math|K> classes <math|<around*|{|\<cal-C\><rsub|i>|}><rsub|i=1><rsup|K>>
  in <math|\<bbb-R\><rsup|D\<gtr\>K>>. Then, we introduce
  <math|D<rprime|'>\<gtr\>1> linear features which are altogether given by
  matrix <math|\<b-W\>>, so that\ 

  <\equation*>
    \<b-W\>\<b-x\>=\<b-y\>\<in\>\<bbb-R\><rsup|D<rprime|'>>.
  </equation*>

  We define the following matrices:

  <\equation*>
    <stack|<tformat|<table|<row|<cell|\<b-S\><rsub|W>\<assign\><big|sum><rsub|k=1><rsup|K>\<b-S\><rsub|k>,<space|1em>\<b-S\><rsub|k>\<assign\><big|sum><rsub|\<b-x\>\<in\>\<cal-C\><rsub|k>><around*|(|\<b-x\>-\<b-m\><rsub|k>|)><around*|(|\<b-x\>-\<b-m\><rsub|k>|)><rsup|T>,<space|1em>\<b-m\><rsub|k>=<frac|1|<around*|\||\<cal-C\><rsub|k>|\|>><big|sum><rsub|\<b-x\>\<in\>\<cal-C\><rsub|k>>\<b-x\>,>>|<row|<cell|\<b-S\><rsub|T>\<assign\><big|sum><rsub|\<b-x\>\<in\><big|cup><rsub|k=1><rsup|K>\<cal-C\><rsub|k>><around*|(|\<b-x\>-\<b-m\>|)><around*|(|\<b-x\>-\<b-m\>|)><rsup|T>,>>|<row|<cell|\<b-m\>\<assign\><frac|1|<big|sum><rsub|k=1><rsup|K><around*|\||\<cal-C\><rsub|k>|\|>><big|sum><rsub|\<b-x\>\<in\><big|cup><rsub|k=1><rsup|K>\<cal-C\><rsub|k>>\<b-x\>=<frac|<big|sum><rsub|k=1><rsup|K><around*|\||\<cal-C\><rsub|k>|\|>\<b-m\><rsub|k>|<big|sum><rsub|k=1><rsup|K><around*|\||\<cal-C\><rsub|k>|\|>>>>>>>
  </equation*>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>

<\references>
  <\collection>
    <associate|auto-1|<tuple|?|1>>
    <associate|auto-2|<tuple|1|1>>
    <associate|auto-3|<tuple|2|1>>
    <associate|auto-4|<tuple|3|2>>
    <associate|auto-5|<tuple|4|3>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|4.
      Linear Models for Classification> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>

      <with|par-left|<quote|4tab>|least squares for learning:
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-2><vspace|0.15fn>>

      <with|par-left|<quote|4tab>|Fisher's linear discriminant
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-3><vspace|0.15fn>>

      <with|par-left|<quote|4tab>|relation of Fisher's discriminant to linear
      least squares <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-4><vspace|0.15fn>>

      <with|par-left|<quote|4tab>|Fisher's discriminant for multiple classes
      <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-5><vspace|0.15fn>>
    </associate>
  </collection>
</auxiliary>