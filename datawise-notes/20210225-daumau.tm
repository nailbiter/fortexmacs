<TeXmacs|1.99.13>

<style|generic>

<\body>
  Horikoshi-san's constant

  <\equation*>
    <stack|<tformat|<table|<row|<cell|H<around*|(|day|)>\<assign\>CDU<around*|(|day-60\<ldots\>day|)>/CDU<around*|(|day|)>>>|<row|<cell|H<around*|(|day|)><rsup|-1>=<frac|<big|sum><rsub|uuid\<in\>gps<rsub|<around*|[|day-60,day|]>>>1<rsub|uuid\<in\>gps<rsub|day>>|<big|sum><rsub|uuid>1<rsub|uuid\<in\>gps<rsub|<around*|[|day-60,day|]>>>>=<frac|<big|sum><rsub|uuid>1<rsub|uuid\<in\>gps<rsub|day>>|<big|sum><rsub|uuid>max<rsub|i\<in\><around*|[|0,60|]>>1<rsub|uuid\<in\>gps<rsub|day-i>>>>>>>>
  </equation*>

  our constant:

  <\equation*>
    O<rsub|60><around*|(|uuid,day|)>\<assign\>60/#<around*|{|i=0\<ldots\>60-1\<mid\>uuid\<in\>gps<rsub|day-i>|}>
  </equation*>

  <\equation*>
    <stack|<tformat|<table|<row|<cell|O<rsub|N><rsup|-1><around*|(|uuid,day|)>\<assign\><frac|<big|sum><rsub|i=0><rsup|60-1>1<rsub|uuid\<in\>gps<rsub|day-i>>|60>>>>>>
  </equation*>

  <\equation*>
    <stack|<tformat|<table|<row|<cell|harm<rsub|S><around*|(|f|)>\<assign\><frac|<around*|\||S|\|>|<big|sum><rsub|i\<in\>S>f<around*|(|i|)><rsup|-1>>>>|<row|<cell|harm<around*|(|<around*|{|x<rsub|1>,x<rsub|2>,\<ldots\>,x<rsub|n>,\<infty\>|}>|)>=<frac|n+1|n>harm<around*|(|<around*|{|x<rsub|1>,\<ldots\>,x<rsub|n>|}>|)>>>|<row|<cell|harm<around*|(|<around*|{|x<rsub|1>,\<ldots\>,x<rsub|2>,0|}>|)>=0,harm<around*|(|\<emptyset\>|)>=\<infty\>>>>>>
  </equation*>

  <\equation*>
    <stack|<tformat|<table|<row|<cell|H<around*|(|day|)>\<assign\><frac|<big|sum><rsub|uuid>max<rsub|i=0><rsup|59>f<around*|(|uuid,day-i|)>|<big|sum><rsub|uuid>f<around*|(|uuid,day|)>>>>|<row|<cell|>>|<row|<cell|<frac|<big|sum><rsub|uuid>f*<around*|(|uuid,day|)>O<around*|(|uuid,day|)>|<big|sum><rsub|uuid>f<around*|(|uuid,day|)>>\<assign\><frac|<big|sum><rsub|uuid>f*<around*|(|uuid,day|)><frac|60|<big|sum><rsub|i=0><rsup|59>f<around*|(|uuid,day-i|)>>|<big|sum><rsub|uuid>f<around*|(|uuid,day|)>>=<frac|<big|sum><rsub|uuid>harm<rsub|d=day-59><rsup|day><frac|f*<around*|(|uuid,day|)>|f<around*|(|uuid,d|)>>|<big|sum><rsub|uuid>f<around*|(|uuid,day|)>>>>>>>
  </equation*>
</body>

<\initial>
  <\collection>
    <associate|page-medium|paper>
  </collection>
</initial>