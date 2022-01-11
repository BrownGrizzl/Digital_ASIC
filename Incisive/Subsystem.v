`timescale 1 ns / 1 ps

module Subsystem
          (clk,
           reset,
           clk_enable,
           In1,
           Out1
         );
  input   clk;
  input   reset;
  input   clk_enable;
  input   signed [16:0] In1;  // sfix17_En16
  output reg signed [16:0] Out1;  // sfix17_En16

reg   signed [16:0] In11; 

  wire enb;
  wire signed [8:0] Constant1_out1=9'b011010001 ;
  wire signed [11:0] Constant2_out1=12'sb100010010101;
  wire signed [11:0] Constant3_out1= 11'b010110101001;
  wire signed [14:0] Constant4_out1=  15'sb101011110001011;
  wire signed [17:0] Constant5_out1= 17'b011001100100100101;
  wire signed [19:0] Constant6_out1=20'sb10011001101101101011;
  wire signed [16:0] Constant7_out1=16'b01010000111010101;
  wire signed [11:0] Constant8_out1=12'sb101001010111;
  wire signed [11:0] Constant9_out1 = 11'b11101101011;
  wire signed [8:0] Constant10_out1=9'sb100101111;
  
  reg signed [16:0] In1_1;  // sfix17_En16
   
  reg signed [24:0] Product1_out1_1;  // sfix25_En34
  wire signed [28:0] Product2_out1_1;  // sfix29_En35
  wire signed [27:0] Product3_out1_1;  // sfix28_En33
  wire signed [31:0] Product4_out1_1;  // sfix32_En34
  wire signed [33:0] Product5_out1_1;  // sfix34_En34
  wire signed [36:0] Product6_out1_1;  // sfix37_En36
  wire signed [32:0] Product7_out1_1;  // sfix33_En36
  wire signed [28:0] Product8_out1_1;  // sfix29_En33
  wire signed [27:0] Product9_out1_1;  // sfix28_En35
  wire signed [25:0] Product10_out1_1;  // sfix26_En34 
  
  reg signed [11:0] Product1_out1_2;  // sfix12_En21
  reg signed [13:0] Product2_out1_2;  // sfix14_En21
  reg signed [16:0] Product3_out1_2;  // sfix17_En22
  reg signed [18:0] Product4_out1_2;  // sfix19_En22
  reg signed [21:0] Product5_out1_2;  // sfix22_En22
  reg signed [21:0] Product6_out1_2;  // sfix22_En22
  reg signed [17:0] Product7_out1_2;  // sfix18_En21
  reg signed [16:0] Product8_out1_2;  // sfix17_En22
  reg signed [12:0] Product9_out1_2;  // sfix13_En20  
  reg signed [12:0] Product10_out1_2;  // sfix13_En22 
  
  
  
   reg signed [11:0] Product1_out1_22;  // sfix12_En21
  reg signed [13:0] Product2_out1_22;  // sfix14_En21
  reg signed [16:0] Product3_out1_22;  // sfix17_En22
  reg signed [18:0] Product4_out1_22;  // sfix19_En22
  reg signed [21:0] Product5_out1_22;  // sfix22_En22
  reg signed [21:0] Product6_out1_22;  // sfix22_En22
  reg signed [17:0] Product7_out1_22;  // sfix18_En21
  reg signed [16:0] Product8_out1_22;  // sfix17_En22
  reg signed [12:0] Product9_out1_22;  // sfix13_En20  
  reg signed [12:0] Product10_out1_22;  // sfix13_En22 
  
  wire signed [17:0] Sum3_add_cast;  // sfix18_En22
  wire signed [22:0] Sum5_add_cast;  // sfix23_En22
  
  wire signed [23:0] Sum7_add_cast_1;  // sfix24_En22
  wire signed [23:0] Sum9_add_cast_1;  // sfix24_En22
  
  reg signed [14:0] Sum2_out1;  // sfix15_En21
  reg signed [16:0] Sum3_out1;  // sfix17_En22
  reg signed [17:0] Sum4_out1;  // sfix18_En21
  reg signed [21:0] Sum5_out1;  // sfix22_En22
  reg signed [22:0] Sum6_out1;  // sfix23_En22
  reg signed [22:0] Sum7_out1;  // sfix23_En22
  reg signed [22:0] Sum8_out1;  // sfix23_En22
  reg signed [22:0] Sum9_out1;  // sfix23_En22
  reg signed [23:0] Sum10_out1; 
  reg signed [16:0] Sum10_out2; 
  reg signed [16:0] Sum10_out3; 

  wire signed [19:0] Sum4_add_temp;  // sfix20_En22
 
  assign enb = 1;
   
  assign Product2_out1_1 = Constant2_out1 * In11;// Product2_out1;
  assign Product3_out1_1 = Constant3_out1 * In11;//Product3_out1;
  assign Product4_out1_1 = Constant4_out1 * In11;//Product4_out1;
  assign Product5_out1_1 = Constant5_out1 * In11;//Product5_out1;
  assign Product6_out1_1 = Constant6_out1 * In11;//Product6_out1;
  assign Product7_out1_1 = Constant7_out1 *In11;// Product7_out1;
  assign Product8_out1_1 = Constant8_out1 * In11;//; Product8_out1;
  assign Product9_out1_1 = Constant9_out1 * In11;//;Product9_out1;
  assign Product10_out1_1 = Constant10_out1 * In11;// Product10_out1;

  assign Sum3_add_cast = {{2{Sum2_out1[14]}}, {Sum2_out1, 1'b0}};
  assign Sum4_add_temp = Sum3_out1 + Product4_out1_2;
  assign Sum5_add_cast = {{4{Sum4_out1[17]}}, {Sum4_out1, 1'b0}};
  assign Sum7_add_cast_1 = {{5{Product7_out1_2[17]}}, {Product7_out1_2, 1'b0}};
  assign Sum9_add_cast_1 = {{9{Product9_out1_2[12]}}, {Product9_out1_2, 2'b00}};
  

always @(posedge clk)
begin
if (reset == 1'b1) begin
      In11<=0;
        Product1_out1_2 <= 0;
        Sum2_out1 <= 0;
        Sum3_out1 <= 0;
        Sum4_out1 <= 0;
        Sum5_out1 <= 0;
        Sum6_out1 <= 0;
        Sum7_out1 <= 0;
        Sum8_out1 <= 0;
        Sum9_out1 <= 0;
        Out1  <= 0;
end
else
  begin
        In11<=In1;
        Product1_out1_2 <= Product1_out1_1[24:13]+ $signed({1'b0, Product1_out1_1[24] & (|Product1_out1_1[12:0])});
        Sum2_out1 <= Product1_out1_2 + Product2_out1_2;
        Sum3_out1 <= Sum3_add_cast+ Product3_out1_2;
        Sum4_out1 <= Sum4_add_temp[18:1] + $signed({1'b0, Sum4_add_temp[19] & Sum4_add_temp[0]});
        Sum5_out1 <= Sum5_add_cast + Product5_out1_2;
        Sum6_out1 <= Sum5_out1 + Product6_out1_2; 
        Sum7_out1 <= Sum6_out1 + Sum7_add_cast_1;
        Sum8_out1 <= Sum7_out1 + Product8_out1_2;
        Sum9_out1 <=  Sum8_out1 + Sum9_add_cast_1;
        Sum10_out1 = Sum9_out1 + Product10_out1_2;
        Sum10_out2=(Sum10_out1[22:6] + $signed({1'b0, Sum10_out1[23] & (|Sum10_out1[5:0])}));
        Sum10_out3<=Sum10_out2;
        Out1  <= -Sum10_out3;
  end
end
always @(posedge clk)
    begin 
    if (reset == 1'b1) begin
   Product1_out1_1 <=0;
   Product2_out1_2 <=0;
   Product3_out1_2 <= 0;
   Product4_out1_2 <= 0;
   Product5_out1_2 <= 0;
   Product6_out1_2 <= 0;
   Product7_out1_2 <= 0;
   Product8_out1_2 <= 0;
   Product9_out1_2 <= 0;
  Product10_out1_2 <=0;
    end
     else
begin
   Product1_out1_1 <= Constant1_out1 * In11;//; Product1_out1;
   Product2_out1_2 <= Product2_out1_1[27:14] + $signed({1'b0, Product2_out1_1[28] & (|Product2_out1_1[13:0])});
   Product3_out1_2 <= Product3_out1_1[27:11] + $signed({1'b0, Product3_out1_1[27] & (|Product3_out1_1[10:0])});
   Product4_out1_2 <= Product4_out1_1[30:12]+ $signed({1'b0, Product4_out1_1[31] & (|Product4_out1_1[11:0])});
   Product5_out1_2 <= Product5_out1_1[33:12] + $signed({1'b0, Product5_out1_1[33] & (|Product5_out1_1[11:0])});
   Product6_out1_2 <= Product6_out1_1[35:14] + $signed({1'b0, Product6_out1_1[36] & (|Product6_out1_1[13:0])});
   Product7_out1_2 <= Product7_out1_1[32:15] + $signed({1'b0, Product7_out1_1[32] & (|Product7_out1_1[14:0])});
   Product8_out1_2 <= Product8_out1_1[27:11] + $signed({1'b0, Product8_out1_1[28] & (|Product8_out1_1[10:0])});
   Product9_out1_2 <= Product9_out1_1[27:15] + $signed({1'b0, Product9_out1_1[27] & (|Product9_out1_1[14:0])});
   Product10_out1_2 <= Product10_out1_1[24:12] + $signed({1'b0, Product10_out1_1[25] & (|Product10_out1_1[11:0])});
         
        
      end
    end

endmodule  
