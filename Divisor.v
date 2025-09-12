module mux1(Z, A, B, S);

	input A, B, S;
	output Z;
	
	wire Ns, T1, T2;
	
	not (Ns, S);
	
	and (T1, A, Ns);
	and (T2, B, S);
	
	or (Z, T1, T2);
	
endmodule

module meioSubtratorSemSaida(Bout, A, B);
	
	input A, B;
	output Bout;
	wire T;
	
	not (T, A);
	and (Bout, T, B);
endmodule

module SubtratorSemSaida (Bout, A, B, C);

	input A, B, C;
	output Bout;
	
	wire [3:0]T;
	
	not (T[0], A);
	
	and (T[1], T[0], B);
	and (T[2], T[0], C);
	and (T[3], B, C);
	
	or (Bout, T[1], T[2], T[3]);
	
endmodule

module subtratorDiv1(S,Bout, A, B);

    input A;
    input [3:0]B;
    
    output Bout;
    output [3:0]S;
    wire T;

    meioSubtrator(S[0], T, A, B[0]);
    or(Bout, T, B[1], B[2], B[3]);

endmodule

module subtratorDiv2(S,Bout, B, A, C);

    input A, B;
    input [3:0]C;
    
    output Bout;
    output [3:0]S;
    wire T[1:0];

    meioSubtrator(S[0], T[0], A, C[0]);
    Subtrator(S[1], T[1], B, C[1], T[0]);
    or (Bout, T[1], C[2], C[3]);
	 
endmodule

module subtratorDiv3(S,Bout, C, B, A, D);

    input A, B, C;
    input [3:0]D;
    
    output Bout;
    output [2:0]S;
    wire T[2:0];

    meioSubtrator(S[0], T[0], A, D[0]);
    Subtrator(S[1], T[1], B, D[1], T[0]);
    Subtrator(S[2], T[2], C, D[2], T[1]);
    or (Bout, T[2], D[3]);
	 
endmodule

module subtratorDiv4(Bout, D, C, B, A, E);

    input A, B, C, D;
    input [3:0]E;
	 
	 wire [2:0]N
    
    output Bout;
	 
	 meioSubtratorSemSaida(N[0], A, E[0]);
	 SubtratorSemSaida (N[1], B, E[1], N[0]);
	 SubtratorSemSaida (N[2], C, E[2], N[1]);
	 SubtratorSemSaida (Bout, D, E[3], N[2]);
	 
	 
    
endmodule

module Divisor(S, A, B);

	input [3:0]A;
	input [3:0]B;
	
	output [3:0]S;
	
	wire [5:0]M; 
	wire [1:0]T2;
	wire [2:0]T3;
	wire [3:0]Ns;
	
	not (S[3], Ns[0]);
	not (S[2], Ns[1]);
	not (S[1], Ns[2]);
	not (S[0], Ns[3]);
	
	subtratorDiv1(T1, Ns[0], A[3], B);
	
	
	mux1 (M[0], T1, A[3], Ns[0]);
	
	subtratorDiv2(T2, Ns[1], M[0], A[2], B);

	mux1 (M[1], T2[1], M[0], Ns[1]);
	mux1 (M[2], T2[0], A[2], Ns[1]);
	
	subtratorDiv3(T3, Ns[2], M[1], M[2], A[1], B);
	
	mux1 (M[3], T3[2], M[1], Ns[2]);
	mux1 (M[4], T3[1], M[2], Ns[2]);
	mux1 (M[5], T3[0], A[1], Ns[2]);
	
	subtratorDiv4(Ns[3], M[3], M[4], M[5], A[0], B);

endmodule
	
	
	
