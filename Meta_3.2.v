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
