module cont(ck,reset,out,updown,data,count);
  
  //definir portas de entrada e dupla
  input ck,reset,updown,out;
  input [3:0] data;
  output reg [3:0] count;
  
  //itere o bloco sempre em cada borda positiva do relógio
  always@(posedge ck) 
  begin
    if(reset)	//Definir contador para zero
      count <= 0;
    else if(updown)	//carregar o contador com valor de dados
      count <= data;
    else if(out)		//contar
      count <= count + 1;
    else			//contagem regressiva
      count <= count - 1;
    
  end
endmodule 
