module Somador4( S, Cout, A, B, Cin);

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

module Subtrator4( S, Cout, A, B, Cin);

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

module Ou4(S, A,B);

	input [3:0]A;
	input [3:0]B;
	output [3:0]S;
	
	or(S[0],A[0],B[0]);
	or(S[1],A[1],B[1]);
	or(S[2],A[2],B[2]);
	or(S[3],A[3],B[3]);

endmodule

module e4(S, A,B);

	input [3:0]A;
	input [3:0]B;
	output [3:0]S;
	
	and(S[0],A[0],B[0]);
	and(S[1],A[1],B[1]);
	and(S[2],A[2],B[2]);
	and(S[3],A[3],B[3]);

endmodule

module Ouex4(S, A,B);

	input [3:0]A;
	input [3:0]B;
	output [3:0]S;
	
	xor(S[0],A[0],B[0]);
	xor(S[1],A[1],B[1]);
	xor(S[2],A[2],B[2]);
	xor(S[3],A[3],B[3]);

endmodule

module primeiroSomador4mult( S, S1, Cout, A, B);

input [3:0]A;
input [3:0]B;

output [2:0]S;
output Cout, S1;

wire [3:0]F;

meioSomador soma1(S1, F[0], A[0], B[0]);
Somador soma2(S[0], F[1], A[1], B[1], F[0]);
Somador soma3(S[1], F[2], A[2], B[2], F[1]);
meioSomador soma4(S[2], Cout, A[3], F[2]);

endmodule
module Somador4mult( S, S1, Cout, A, B, Cin);

input [3:0]A;
input [3:0]B;
input Cin;

output [2:0]S;
output Cout, S1;

wire [3:0]F;

meioSomador soma1(S1, F[0], A[0], B[0]);
Somador soma2(S[0], F[1], A[1], B[1], F[0]);
Somador soma3(S[1], F[2], A[2], B[2], F[1]);
Somador soma4(S[2], Cout, A[3], Cin, F[2]);

endmodule

module primeiroParteMult(S, S1, Cout, A, B, C, D);
	
	input [3:0]A;
	input [2:0]C;
	input B, D;
	output [2:0]S;
	output Cout, S1;
	
	wire [3:0]T;
	
	
	and (T[0], A[0], B);
	and (T[1], A[1], B);
	and (T[2], A[2], B);
	and (T[3], A[3], B);
	
	primeiroSomador4mult (S, S1, Cout, T, C);
	
endmodule
module parteMult(S, S1, Cout, A, B, C, D);
	
	input [3:0]A;
	input [2:0]C;
	input B, D;
	output [2:0]S;
	output Cout, S1;
	
	wire [3:0]T;
	
	
	and (T[0], A[0], B);
	and (T[1], A[1], B);
	and (T[2], A[2], B);
	and (T[3], A[3], B);
	
	Somador4mult (S, S1, Cout, T, C, D);
	
endmodule

module Mult(S, A, B);
	
	input [3:0]A;
	input [3:0]B;
	output [7:0]S;
	
	
	wire [2:0]T1;
	wire [2:0]T2;
	wire [2:0]T3;
	wire [2:0]T4;
	wire [2:0]T5;
	
	wire [8:0]C ;
	
	
	and (S[0], A[0], B[0]);
	and (T1[0], A[1], B[0]);
	and (T1[1], A[2], B[0]);
	and (T1[2], A[3], B[0]);
	
	primeiroParteMult (T2, S[1],C[0] , A, B[1], T1);
	parteMult (T3, S[2],C[1] , A, B[2], T2, C[0]);
	parteMult (S[6:4], S[3],S[7] , A, B[3], T3, C[1]);
endmodule
