module tb;
    parameter DW_IN = 512;
    reg clk = 0;
    reg [DW_IN - 1:0] data = 'h753;

    initial
    begin
        #1000 $finish;
    end

    initial
    begin
        forever #25 clk = ~clk;
    end

    initial
    begin
        while(1)
        begin
            data = 'h123;
            #50;
            data = 'h456;
            #50;
            data = 'h789;
            #50;
        end
    end

    initial
    begin
        $dumpfile("dump.vcd");
        $dumpvars(0, tb);
    end

    receiver #( .DW_IN(DW_IN) ) 
    rec0 (
        .clk(clk),
        .data(data)
    );

endmodule    