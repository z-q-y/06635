

Sets
  c    set of customers   / c1, c2, c3, c4, c5, c6, c7, c8, c9, c10 /
  i    set of products    /  A,  B,  C,  D,  E,  F,  G,  H,  I,   J /
  w    set of weeks       / w1, w2, w3, w4, w5, w6, w7, w8 /

Alias  (i, j);

Scalar
  M         'Big M'  / 100000 /
  ThetaL    'lower bound for processing time in a week [h]'  / 5.0 /
  ThetaU    'upper bound for processing time in a week [h]' / 168.0 /

Parameters
  PS(i)     'unit selling price of product i [$/ton]'
    / A    10
      B    12
      C    13
      D    12
      E    15
      F    10
      G     8
      H    14
      I     7
      J    15 /
  r(i)      'processing rate of product i [ton/week]'
    / set.i  110 /
  CB(i, c)  'unit backlog penalty cost of product i to customer c [$]'
    / set.c  CB
  CC(i, j)  changeover cost from project i to project j
    / * /
  CI(i)     unit inventory cost of product i
    / * /
  Vmax(i)   maximum storage space for product i
    / * /
  Vmin(i)   minimum storage requirement for product i
    / * /
  ;

Binary Variables
  E(i, w)  1 if product i is processed during week w - 0 otherwise
  F(i, w)  1 if product i is the first one in week w - 0 otherwise
  L(i, w)  1 if product i is the last one in week w - 0 otherwise
  Z(i, j, w)  1 if product i immediately precedes product j in week w
  ZF(i, j, w)  1 if changeover between weeks w - 1 and w is from i to j
  ;

Variables
  O(i, w)  order index of product i during week w
  P(i, w)  amount of product i produced during week w
  S(c, i, w)  sales volume of product i to customer c during week w
  T(i, w)  processing time of product i during week w
  V(i, w)  inventory volume of product i at the end of week w
  Delta(c, i, w)  backlog of product i to customer c at the end of week w
  Pi  total profit
  ;

Table D(c, i, w)  'demand of product i to customer c during week w'
        w1  w2  w3  w4  w5  w6  w7  w8
  c1.A   5   0   0   0   5   0   0   0
  c1.B
  c1.C   2   2   2   2   3   3   3   3
  c1.D
  c1.E
  c1.F
  c1.G
  c1.H
  c1.I
  c1.J
  c2.A
  c2.B
  c2.C
  c2.D   3   0   3   0   3   0   3   0
  c2.E   5   0   5   0   5   0   5   0
  c2.F
  c2.G
  c2.H   0  12   0   0   0  12   0  12
  c2.I
  c2.J
  c3.A
  c3.B   4   0   0   0   4   0   0   0
  c3.C
  c3.D
  c3.E
  c3.F
  c3.G   0   0   5   0   0   0   0   0
  c3.H
  c3.I
  c3.J   0   6   0   6   0   6   0   6
  c4.A   7   0   0   0   7   0   0   0
  c4.B   0   5   0   5   0   0   5   0
  c4.C   5   0   0   5   0   0   5   0
  c4.D  10   0   0   0   0  10   0   0
  c4.E  11   0  11   0  11   0  11   0
  c4.F   8   0   0   8   0   0   8   0
  c4.G   4   0   4   0   4   0   4   0
  c4.H   1   1   1   3   3   3   1   1
  c4.I   5   5   5   5   5   5   5   5
  c4.J   0   3   0   3   3   0   3   0
  c5.A   5   0   0   0   5   0   0   0
  c5.B
  c5.C   2   2   2   2   3   3   3   3
  c5.D
  c5.E
  c5.F
  c5.G
  c5.H
  c5.I
  c5.J
  c6.A
  c6.B
  c6.C
  c6.D   3   0   3   0   3   0   3   0
  c6.E   5   0   5   0   5   0   5   0
  c6.F
  c6.G
  c6.H   0  12   0   0   0  12   0  12
  c6.I
  c6.J
  c7.A
  c7.B   4   0   0   0   4   0   0   0
  c7.C
  c7.D
  c7.E
  c7.F
  c7.G   0   0   5   0   0   0   0   0
  c7.H
  c7.I
  c7.J   0   6   0   6   0   6   0   6
  c8.A   7   0   0   0   7   0   0   0
  c8.B   0   5   0   5   0   0   5   0
  c8.C   5   0   0   5   0   0   5   0
  c8.D  10   0   0   0   0  10   0   0
  c8.E  11   0  11   0  11   0  11   0
  c8.F   8   0   0   8   0   0   8   0
  c8.G   4   0   4   0   4   0   4   0
  c8.H   1   1   1   3   3   3   1   1
  c8.I   5   5   5   5   5   5   5   5
  c8.J   0   3   0   3   3   0   3   0
  c9.A
  c9.B   4   0   0   0   4   0   0   0
  c9.C
  c9.D
  c9.E
  c9.F
  c9.G   0   0   5   0   0   0   0   0
  c9.H
  c9.I
  c9.J   0   6   0   6   0   6   0   6
  c10.A  7   0   0   0   7   0   0   0
  c10.B  0   5   0   5   0   0   5   0
  c10.C  5   0   0   5   0   0   5   0
  c10.D 10   0   0   0   0  10   0   0
  c10.E 11   0  11   0  11   0  11   0
  c10.F  8   0   0   8   0   0   8   0
  c10.G  4   0   4   0   4   0   4   0
  c10.H  1   1   1   3   3   3   1   1
  c10.I  5   5   5   5   5   5   5   5
  c10.J  0   3   0   3   3   0   3   0

Table  Tau(i, j)  'changeover time from product i to product j'
       A    B    C    D    E    F    G    H    I    J
  A        45   45   45   60   80   30   25   70   55
  B   55        55   40   60   80   80   30   30   55
  C   60  100       100   75   60   80   80   75   75
  D   60  100   30        45   45   45   60   80  100
  E   60   60   55   30        35   30   35   60   90
  F   75   75   60  100   75       100   75  100   60
  G   80  100   30   60  100   85        60  100   65
  H   60   60   60   60   60   60   60        60   60
  I   80   80   30   30   60   70   55   85       100
  J  100  100   60   80   80   30   45  100  100


Equations
  profit      define objective function
  ;

profit .. Pi =e= 1;

model transport /all/;

option MIP = CPLEX ;

solve transport using MIP max Pi;
