module Teste(A,B,C,D,S0,S1,Co);
input A, B, C, D;
output S0, S1, Co;
wire w1;

MeioSomador(A, C, w1, S0);
  SomadorCompleto(B, D, w1, Co, S1);



endmodule

module MeioSomador(A,B, Co, S);
input A,B;
output Co,S;

xor (S, A, B);
and (Co, A, B);
endmodule 

module SomadorCompleto(A,B, Ci,Co, S);

input A, B, Ci;
output Co, S;
wire AoB, Cio,AeB, CieA;

xor (AoB, A, B);
xor (S, AoB, Ci);

and (AeB, A, B);
and (CieA, A, Ci);
or (Co, AeB, CieA);

endmodule 

