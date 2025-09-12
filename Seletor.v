module multiplexador8(S, Sel, A, B, C, D, E, F, G);

	input A, B, C, D, E, F, G;
	
	input [2:0]Sel;
	
	output S;
	wire [7:0]T;
	wire [2:0]Nsel;
	
	not(Nsel[0], Sel[0]);
	not(Nsel[1], Sel[1]);
	not(Nsel[2], Sel[2]);
	
	
	
	and (T[0], A, Nsel[2], Nsel[1], Sel[0]);
	and (T[1],B, Nsel[2], Sel[1], Nsel[0]);
	and (T[2], C, Nsel[2], Sel[1], Sel[0]);
	and (T[3], D, Sel[2], Nsel[1], Nsel[0]);
	and (T[4], E, Sel[2], Nsel[1], Sel[0]);
	and (T[5], F, Sel[2], Sel[1], Nsel[0]);
	and (T[6], G, Sel[2], Sel[1], Sel[0]);
	or (S, T[0],T[1],T[2],T[3], T[4], T[5],T[6], T[7]);
	
	
endmodule

module multiplexador2(S, Sel, A, B);

	input A, B;
	
	input [2:0]Sel;
	
	output S;
	wire [1:0]T;
	wire [2:0]Nsel;
	
	not(Nsel[0], Sel[0]);
	not(Nsel[1], Sel[1]);
	not(Nsel[2], Sel[2]);
	
	and (T[0], A, Nsel[2], Nsel[1], Sel[0]);
	and (T[1],B, Nsel[2], Sel[1], Nsel[0]);
	
	or (S, T[0],T[1]);
endmodule

module multiplexador1(S, Sel, A);

	input A, B;
	
	input [2:0]Sel;
	
	output S;
	wire [2:0]Nsel;
	
	not(Nsel[0], Sel[0]);
	not(Nsel[1], Sel[1]);
	not(Nsel[2], Sel[2]);
	
	and (S, A, Sel[2], Sel[1], Nsel[0]);
endmodule
	

module mux8(S, Cout, Sel, A, B, C, D, E,F,G, Cin1,Cin2);

	input [3:0]A;
	input [3:0]B;
	input [3:0]C;
	input [3:0]D;
	input [3:0]E;
	input [7:0]F;
	input [3:0]G;
	

	
	input [2:0]Sel; 
	input Cin2, Cin1;
	output [7:0]S;
	output Cout;
	
	multiplexador8 (S[0], Sel, A[0], B[0], C[0], D[0], E[0],F[0] , G[0]);
	multiplexador8 (S[1], Sel, A[1], B[1], C[1], D[1], E[1],F[1] , G[1]);
	multiplexador8 (S[2], Sel, A[2], B[2], C[2], D[2], E[2],F[2] , G[2]);
	multiplexador8 (S[3], Sel, A[3], B[3], C[3], D[3], E[3],F[3] , G[3]);
	multiplexador8 (S[4], Sel, F[4]);
	multiplexador8 (S[5], Sel, F[5]);
	multiplexador8 (S[6], Sel, F[6]);
	multiplexador8 (S[7], Sel, F[7]);
	multiplexador8 (Cout, Sel, Cin1, Cin2);
endmodule

module Seletor(
	input [3:0]A,
	input [3:0]B,
	output [7:0]S,
	input [2:0]Sel, 
	input Cin,
	output Cout);
	
	wire [3:0]T1;
	wire [3:0]T2;
	wire [3:0]T5;
	wire [3:0]T6;
	wire [3:0]T7;
	wire [7:0]T8;
	wire [3:0]T9;
	wire T3, T4;

	Subtrator4 subtrator(T1, T3, A, B, Cin);
	Somador4 soma(T2, T4, A, B, Cin);
	Ou4 ou(T5, A, B);
	Ouex4(T6, A,B);
	e4(T7, A,B);
	Mult(T8, A, B);
	Divisor(T9, A, B);
	
	mux8(S, Cout, Sel, T1, T2,T5, T6,T7,T8 ,T9 , T3,T4);

endmodule
	