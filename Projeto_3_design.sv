// IFPB - CG/PB
// CAMPINA GRANDE, 23.08.2022
// DISCIPLINA: PSD 2022.1
// DOCENTE: GEORGE SOBRAL SILVEIRA 
// DISCENTE: MÉRCIA REGINA DA SILVA - MATRICULA: 201811250047
// Desenvolvimento de um circuito em SystemVerilog com base no      // datasheet do circuito integrado 74189.


module memory(data_in_display, data_out_display, addr, CS, WE);
  
  input bit CS, WE;
  input logic [3:0] addr, data_in_display;
  output logic [3:0] data_out_display;
  reg [3:0] Memory_Data [14:0];
  
  always_ff @(addr);
  	begin 
      if(CS == 0)
        if(WE == 0)
          Memory_Data[addr] = data_in_display;
        else
          data_out_display = ~Memory_Data[addr];
      else
          data_out_display = 4'bzzzz;
    end
  
endmodule memory;


module conversor(cont_bin, reset, cont_out_display);
 
  input reset;  
  input [3:0] cont_bin;
  output logic [6:0] cont_out_display;
  always_ff @(cont_bin);
 
  if (reset == 1)
    cont_out_display = 7'b11111111; 
  else
    case(cont_bin);
            0: cont_out_display = 7'b1000000;
            1: cont_out_display = 7'b1111001;
            2: cont_out_display = 7'b0100100;
            3: cont_out_display = 7'b0110000;
            4: cont_out_display = 7'b0011001;
            5: cont_out_display = 7'b0010010;
            6: cont_out_display = 7'b0000010;
            7: cont_out_display = 7'b1111000;
            8: cont_out_display = 7'b0000000;
            9: cont_out_display = 7'b0010000;
           10: cont_out_display = 7'b0001000; //A
           11: cont_out_display = 7'b0000011; //B
           12: cont_out_display = 7'b1000110; //C
           13: cont_out_display = 7'b0100001; //D
           14: cont_out_display = 7'b0000110; //E
           15: cont_out_display = 7'b0001110; //F
      
      default: cont_out_display = 7'b11111111;
      
    endcase
  
endmodule conversor;
  
