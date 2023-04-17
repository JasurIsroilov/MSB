module receiver 
#(
    parameter size = 6,
    parameter DW_IN = 2**size
) 
(
    input clk,
    input [DW_IN - 1:0] data,
    output reg [size - 1:0] pos = 0
);

reg unsigned [size - 1:0] i = 0;
generate    
    if (size == 3)
    begin
        always @(posedge clk)
        begin        
            for(i=0;i<=DW_IN - 1;i=i+1)
            begin
                if(data[i] == 1)
                begin
                    pos <= i;
                end
            end
        end
    end
    else if (size > 3)
    begin
        receiver #(.size(3))
        rec1 (
            .clk(clk),
            .data(data[DW_IN-1:DW_IN/2])
        );
        receiver #(.size(3))
        rec2 (
            .clk(clk),
            .data(data[DW_IN/2-1:0])
        );
    end   
endgenerate

endmodule
