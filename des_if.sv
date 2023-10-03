interface des_if(input bit clk);
    logic in,rst;
    logic out;

    clocking cb @(posedge clk);
        default input #1step output #3ns;
        input out;
        output in;
    endclocking
endinterface //des_if