// IFPB - CAMPUS CG/PB
// PROJETO II

module cont_tb;
  
  reg ck,reset,updown,out;
  reg [3:0] data;
  wire [3:0] count;
  // projeto de contador de instâncias
  count ct_1(.*);
  
  //gerador de relógio
  initial begin ck = 1'b0; repeat(30) #3 ck= ~ck;end
  
  //insira todo o sinal de entrada
  initial begin reset=1'b1;#7 reset=1'b0; #35 reset=1'b1;end
  initial begin #12 updown=1'b1; #5 updown=1'b0;end
  initial begin #5 out=1'b1;#24 out=1'b0;end
  initial begin data=4'b1000;#14 data=4'b1101;#2 data=4'b1111;end
  
  initial begin
    
    $monitor("time=%0d,reset=%b,updown=%b,out=%b,data=%d,count=%d",$time,reset,updown,out,data,count);
  end
endmodule
