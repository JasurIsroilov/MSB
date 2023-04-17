module receiver #(
    parameter DW_IN = 512
) 
(
    input clk,
    input [DW_IN - 1:0] data,
    output reg [7:0] pos = 0
);

reg unsigned [7:0] i = 0;
reg unsigned [7:0] buff[63:0];

wire [7:0] b0 = buff[0];
wire [7:0] b1 = buff[1];
wire [7:0] b2 = buff[2];
wire [7:0] b3 = buff[3];
wire [7:0] b4 = buff[4];
wire [7:0] b5 = buff[5];
wire [7:0] b6 = buff[6];
wire [7:0] b7 = buff[7];


always @(posedge clk) 
begin
    for (i=0; i<8; i=i+1)
    begin
        if (data[8*i + 7])
            buff[i] <= 8;
        else if (data[8*i + 6])
            buff[i] <= 7;
        else if (data[8*i + 5])
            buff[i] <= 6;
        else if (data[8*i + 4])
            buff[i] <= 5;
        else if (data[8*i + 3])
            buff[i] <= 4;
        else if (data[8*i + 2])
            buff[i] <= 3;
        else if (data[8*i + 1])
            buff[i] <= 2;
        else if (data[8*i + 0])
            buff[i] <= 1;
        else
            buff[i] <= 0;
    end

    pos <= 0;
    if(buff[7])
        pos <= buff[7] + 56;
    else if (buff[6])
        pos <= buff[6] + 48;
    else if (buff[5])
        pos <= buff[5] + 40;
    else if (buff[4])
        pos <= buff[4] + 32;
    else if (buff[3])
        pos <= buff[3] + 24;
    else if (buff[2])
        pos <= buff[2] + 16;
    else if (buff[1])
        pos <= buff[1] + 8;
    else if (buff[0])
        pos <= buff[0];
    else
        pos <= 0;

end


endmodule
