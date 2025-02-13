/*  
    Moore Machine  
*/  
module FSMprob (  
    input logic clk, rstN, i, j,  
    output logic x, y  
);  

    typedef enum logic [1:0] {  
        A = 2'b00,  
        B = 2'b01,  
        C = 2'b10,  
        D = 2'b11  
    } state_t;  

    state_t state, nextState;  

    // Sequential block for state transitions  
    always_ff @(posedge clk or negedge rstN) begin  
        if (~rstN)  
            state <= A;  
        else  
            state <= nextState;  
    end  

    // Combinational block for next state logic  
    always_comb begin  
        case (state)  
            A: nextState = (i) ? B : A;  
            B: nextState = (j) ? C : D;  
            C: nextState = (i) ? B : (j ? C : D);  
            D: nextState = (i) ? D : (j ? C : A);  
            default: nextState = A;  
        endcase  
    end  

    // Moore Machine Output Logic (Outputs depend only on `state`)  
    always_comb begin  
        case (state)  
            A: begin x = 1; y = 1; end  
            B: begin x = 0; y = 1; end  
            C, D: begin x = 1; y = 0; end  
            default: begin x = 0; y = 0; end  
        endcase  
    end  

endmodule  
