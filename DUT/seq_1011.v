module seq_1011 (
    input in,clk,rst,
    output wire out
);

reg [2:0] current_state,next_state;

parameter idle  = 'b000;
parameter s1    = 'b001;
parameter s10   = 'b010;
parameter s101  = 'b011;
parameter s1011 = 'b100;

always @(posedge clk or negedge rst)begin
    if(!rst)
    current_state <= idle;
    else
    current_state <= next_state;
end

assign out = (current_state == s1011)? 1:0;

always @(*) begin
    case(current_state)
    idle    :   if(in) 
                next_state = s1; 
                else 
                next_state = idle;
    s1      :   if(!in) 
                next_state = s10; 
                else 
                next_state = s1;
    s10     :   if(in) 
                next_state = s101; 
                else 
                next_state = idle;
    s101    :   if(in) 
                next_state = s1011; 
                else 
                next_state = s10;
    s1011   :   if(in) 
                next_state = s1; 
                else 
                next_state = s10;
    default :   next_state = idle;
    endcase
end


endmodule