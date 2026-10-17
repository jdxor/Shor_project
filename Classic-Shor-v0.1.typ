#align(right)[
  #block(
    width: auto,
    inset: 5pt,
    [
      *Author:* Jaden Jiménez Díaz \
      *GitHub:* \@jdxor \
      *Date:* October 2026 \
      *Context:* Research Proposal Portfolio for Polygence
    ]
  )
]
#line(length: 100%, stroke: 0.5pt + luma(150))
#v(12pt)
#align(center)[
  = Classic Shor Algorithm
  #v(-4pt)
  #text(size: 10pt, fill: luma(120))[Version 0.1 Under Correction]
]
#v(12pt)

#show math.cases: math.display

#v(12pt) 

$N,p,q,k in NN$

$r in (NN\\{0,1})$

$N = p dot q "where" "gcd"(p,q) = 1$
#v(12pt) 
$"gcd"(N, a) := cases(
  d > 1 => N = d dot k => a^r equiv.not 1 (mod d dot k) & quad text("[Success]"),
  d = 1 => N = d dot N => a^r equiv 1 (mod N) & quad text("[Proceed]")
)$
#v(12pt) 
#align(center)[
  #block(
    stroke: 0.5pt + luma(100),
    fill: luma(245),         
    inset: 7pt,                             
    width: auto,               
  
    $a^r equiv 1 (mod N)$
  )
]
#v(12pt) 
$r equiv x (mod 2) &=> r = 2q + x "where" q=floor(r/2) in ZZ "and" x in {0,1} \
&=> x = r - 2q \
&=> x := cases(
  x=1 && "[Case 1: r is Odd]", 
  x=0 && "[Case 2: r is Even]"
)$

$"[Case 1: "x = 1"]" &=> r/2 in.not NN \
&=> text("[Failure]")$

$"[Case 2: "x = 0"]" &=>a^r=(a^(r/2))^2 equiv 1 (mod N) \
&=>(a^(r/2))^2 -1=(a^(r/2) + 1)(a^(r/2) - 1) equiv 0 (mod N) \
&=>(a^(r/2) + 1)(a^(r/2) - 1) = k dot N "where" k in NN \ &=> text("[Proceed]")$
#v(12pt) 
#align(center)[
  #block(
    stroke: 0.5pt + luma(100),
    fill: luma(245),         
    inset: 7pt,                            
    width: auto,               
  
    $ (a^(r/2) + 1)(a^(r/2) - 1) = k dot N $
  )
]
#v(12pt) 

$"gcd"(a^(r/2) + 1, N) := cases(
  p = 1 && "[Case 2.1:" q = N "]",
  p > 1 && "[Case 2.2:" 1 < p < N "]"
)$

$"[Case 2.1:" q = N "]" &=> a^(r/2) - 1 = k dot N  "where" k in NN \
&=>N =cases(
  "gcd"(a^(r/2)-1, N) &=> "gcd"(a^(r/2)+1, N) = 1,
  "gcd"(a^(r/2)+1, N) &=> "gcd"(a^(r/2)-1, N) = 1
)\ 
&=>text("[Failure]")$

$"[Case 2.2:" 1 < p < N "]" &=> "gcd"(a^(r/2) + 1, N) = p "where" p > 1 \
&=> "gcd"(a^(r/2) - 1, N) = q "where" q > 1 \ 
&=> a^(r/2) equiv.not plus.minus 1\
&=> "gcd"(a^(r/2) + 1, N) dot "gcd"(a^(r/2) - 1, N) = N \ 
&=>text("[Succcess]")$
#v(12pt) 
#align(center)[
  #block(
    stroke: 0.5pt + luma(100),
    fill: luma(245),         
    inset: 7pt,                            
    width: auto,               
  
    $N = p dot q = "gcd"(a^(r/2)+1,N) dot "gcd"(a^(r/2)-1,N)$
  )
]
#v(12pt) 
