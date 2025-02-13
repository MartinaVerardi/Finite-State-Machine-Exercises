/*

Mealy Machine

Write a SystemVerilog module for the FSM defined in the following state transitioning diagram.
The input ordering is i and j. The output ordering is x and y. Use an enumeration to define the 
state names. Write an explicit FSM. Write a testbench to test your FSM using an implicit FSM.
The module header is:

module FSMprob (
    input logic clk, rstN, i, j,
    output logic x,y
);

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

    // Output logic
    always_comb begin
        x = 1'b1;
        y = 1'b0;

        case (state)
            D: if ((~j && ~i) || (i)) x = 1'b0;
            B: if (j) x = 1'b0;
            C: if (i) x = 1'b0;

            A: if (i) y = 1'b1;
            B: if (j) y = 1'b1;
            C: if (~i && ~j) y = 1'b1;
        endcase
    end

endmodule