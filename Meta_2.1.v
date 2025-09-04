module Subtrator4bits( S, Cout, A, B, Cin);

input [3:0]A;
input [3:0]B;
input Cin;

output [3:0]S;
output Cout;

wire [3:0]F;

Subtrator soma1(S[0], F[0], A[0], B[0], Cin);
Subtrator soma2(S[1], F[1], A[1], B[1], F[0]);
Subtrator soma3(S[2], F[2], A[2], B[2], F[1]);
Subtrator soma4(S[3], Cout, A[3], B[3], F[2]);

endmodule
module Somador4bits( S, Cout, A, B, Cin);

input [3:0]A;
input [3:0]B;
input Cin;

output [3:0]S;
output Cout;

wire [3:0]F;

Somador soma1(S[0], F[0], A[0], B[0], Cin);
Somador soma2(S[1], F[1], A[1], B[1], F[0]);
Somador soma3(S[2], F[2], A[2], B[2], F[1]);
Somador soma4(S[3], Cout, A[3], B[3], F[2]);

endmodule
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

module Ou4bits(S, A,B);

	input [3:0]A;
	input [3:0]B;
	output [3:0]S;
	
	or(S[0],A[0],B[0]);
	or(S[1],A[1],B[1]);
	or(S[2],A[2],B[2]);
	or(S[3],A[3],B[3]);

endmodule

module e4bits(S, A,B);

	input [3:0]A;
	input [3:0]B;
	output [3:0]S;
	
	and(S[0],A[0],B[0]);
	and(S[1],A[1],B[1]);
	and(S[2],A[2],B[2]);
	and(S[3],A[3],B[3]);

endmodule

module Ouex4bits(S, A,B);

	input [3:0]A;
	input [3:0]B;
	output [3:0]S;
	
	xor(S[0],A[0],B[0]);
	xor(S[1],A[1],B[1]);
	xor(S[2],A[2],B[2]);
	xor(S[3],A[3],B[3]);

endmodule