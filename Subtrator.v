module Subtrator(S, Cout, A, B, Cin);
	input A, B, Cin;
	output S, Cout;
	wire T1, T2, T3;
	
	meioSubtrator sub1(T1,T2, A, B);
	meioSubtrator sub2(S,T3, T1, Cin);
	or Ou0(Cout, T2, T3);
endmodule
	
module meioSubtrator(D, Bout, C, E);
	input C, E;
   output D, Bout;
	wire T1;
	
	xor Xor0(D, C, E);
	not(T1,C);
	and(Bout, T1, E);
	
endmodule
module Somador( S, Cout, A, B, Cin);
   input A, B, Cin;
   output S, Cout;
   wire T1, T2, T3;

   xor Xor0(T1, A, B);
   and And0(T2, A, B);
   and And1(T3, T1, Cin);
   or Or0(Cout, T2, T3);
   xor Xor1 (S, T1, Cin);
endmodule
module meioSomador(S, Cout, A, B);

	input A, B;
	output S, Cout;
	
	xor (S, A, B);
	and (Cout, A, B);
endmodule