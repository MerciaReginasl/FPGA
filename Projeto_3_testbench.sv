// IFPB - CG/PB
// CAMPINA GRANDE, 23.08.2022
// DISCIPLINA: PSD 2022.1
// DOCENTE: GEORGE SOBRAL SILVEIRA 
// DISCENTE: MÉRCIA REGINA DA SILVA - MATRICULA: 201811250047
// Desenvolvimento de um circuito em SystemVerilog com base no datasheet do circuito integrado 74189.


module tb;
  
  //CS Chip Select Input (Active LOW) 
  //WE Write Enable Input (Active LOW) 
  
  bit CS, WE;
  logic [3:0] data_in_display, addr;
  logic [3:0] data_out_display;
  logic reset;
  logic [3:0] account_bin;
  logic [6:0] account_out_display1,account_out_display2, 						  account_out_display3;
  
  Memory memory (.data_in_display1(data_in_display1), .data_out_display2(data_out_display2), .addr(addr), .CS(CS), .WE(WE));
  
  conversor display1(addr,account_out_display1, reset);
  conversor display2(data_in_display,account_out_display2, reset);
  conversor display3(~data_out_display,account_out_display3, reset);
  
  initial begin
    $dumpfile("memoryTest.vcd");  
    $monitor("data_in_display = %b | data_out_display = %b | addr = %b | cs = %b | we = %b | display1 = %b | display2 = %b | display3 = %b", addr, CS, WE, account_out_display1,account_out_display2, account_out_display3);
    
    //Realizando a gravação na memória: 
    //Aplicação da Tabela Verdade, onde: L = 0 e H = 1;
    
    #1 CS = 0; WE = 0;
    #1 data_in_display = 0000; addr = 0000;
    #1 data_in_display = 0001; addr = 0001;
    #1 data_in_display = 0010; addr = 0010;
    #1 data_in_display = 0011; addr = 0011;
    
    //Obtendo os dados gravados:
    
    #1 CS = 0; WE = 1;
    #1 data_in_display = 0000; addr = 0000;
    #1 data_in_display = 0001; addr = 0001;
    #1 data_in_display = 0010; addr = 0010;
    #1 data_in_display = 0011; addr = 0011;
    #
    $finish;
    
  end
  
endmodule: tb;
