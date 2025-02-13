/*

Write and simulate a model of an 8-bit register with the following module header:

module regWithBenefits
    #(parameter W = 8)
    (
    input logic [W-1:0] d,
    input logic   rstN, ck, clr, ld, shl, shIn,
    output logic [W-1:0] q
    );

rstN: asyncronous clear,
clr: syncronous clear,
ck: clock, The active edge of the clock is the positive edge.
ld: loads the register from the d input
shl: shift the register left one, shifiting shIn into the low order bit.

If more than one control inputs are asserted, the order of procedure is clr, ld, shl.

*/

module regWithBenefits
    #(parameter W = 8)
    (
    input logic [W-1:0] d,  // Data input
    input logic   rstN,     // Asynchronous reset (active low)
    input logic   ck,       // Clock (positive edge triggered)
    input logic   clr,      // Synchronous clear
    input logic   ld,       // Load enable
    input logic   shl,      // Shift left enable
    input logic   shIn,     // Shift-in bit for left shift
    output logic [W-1:0] q  // Output register
    );

    always_ff @(posedge ck or negedge rstN) begin
        if (!rstN) 
            q <= 0;  // Asynchronous reset: Clear register when rstN is low
        else begin
            if (clr) 
                q <= 0; // Synchronous clear: Clear register when clr is high
            else if (ld) 
                q <= d; // Load operation: Store input value into register
            else if (shl) 
                q <= {q[W-2:0], shIn}; // Shift left, inserting shIn at LSB
        end
    end // Close always_ff block

endmodule // Close module definition

