// IFPB - CG/PB
//DOCENTE: GEORGE SOBRAL SILVEIRA
//DISCIPLINA: PSD
//DISCENTE: MERCIA REGINA DA SILVA - MATRICULA: 201811250047
//CURSO: ENGENHARIA DE COMPUTAÇÃO - 2022.1

//PROJETO_2: Módulo 02 - Conversor Binário para display de 7 
//			  segmentos.

module conversor( cont_bin, reset, cont_out_display);
 
output a, b, c, d, e, f, g;
input D, C, B, A;
input cont_bin;
output cont_out_display;
reg  [6:0] SeteSegmentos;
 
always @(*)
 
  if (cont_bin == 0)
    
begin
  
    SeteSegmentos = 8'b11111111; 
  
end
  
else 
  
begin
  
  if ( cont_bin == 0 )
    begin
      
        SeteSegmentos = 8'b00000000;   
      
    end
  
  else if(( cont_out_display == 1 ) && ( cont_bin == 1 ) && ( reset == 0))
      
    begin
      
      case({D, C, B, A})
            4'b0000: SeteSegmentos = 7'b1111110;
            4'b0001: SeteSegmentos = 7'b0110000;
            4'b0010: SeteSegmentos = 7'b1101101;
            4'b0011: SeteSegmentos = 7'b1111001;
            4'b0100: SeteSegmentos = 7'b0110011;
            4'b0101: SeteSegmentos = 7'b1011011;
            4'b0110: SeteSegmentos = 7'b0011111;
            4'b0111: SeteSegmentos = 7'b1110000;
            4'b1000: SeteSegmentos = 7'b1111111;
            4'b1001: SeteSegmentos = 7'b1110011;
            default: SeteSegmentos = 7'b0000000;
          
        endcase
    end
end
 
assign {a, b, c, d, e, f, g} = SeteSegmentos;
 
endmodule
