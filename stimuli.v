`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.06.2025 21:13:48
// Design Name: 
// Module Name: stimuli
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module stimuli;
   reg clk;
   reg we_a,we_b;
   reg[7:0] addr_a,addr_b;
   reg[7:0] din_a,din_b;
   wire [7:0]dout_a,dout_b;
   
   dual_port_ram dut(
   .clk(clk),
   .we_a(we_a),
   .we_b(we_b),
   .din_a(din_a),
   .din_b(din_b),
   .dout_a(dout_a),
   .dout_b(dout_b),
   .addr_a(addr_a),
   .addr_b(addr_b)
   );
    always #5 clk = ~clk;
    
    initial begin
     clk = 0;
     we_a=0; we_b=0;
     addr_a=0; addr_b=0;
     din_a=0; din_b=0;
     $display("Doing Dual port ram testing");
     //Test 1 (to check only port A)
     we_a=1; addr_a=8'h15; din_a= 8'hA1;
     we_b=0;
     #10;
     // Test 2 (to check only port b)
     we_b=1; addr_b=8'h25; din_b= 8'hB2;
     we_a=0;
     #10;
     // test 3 (to read the data from both the ports)
     we_a=0; addr_a=8'h15;
     we_b=0; addr_b=8'h25;
     #10;
     
     $display("Port A(addr 0x15):%h ",dout_a);// expected output is A1
     $display("Port B(addr 0x25):%h",dout_b);// expected output is B2
    
     
     //test 4( to write both simultaneously and at the same address)
     we_a=1;addr_a=8'h30;din_a=8'hC2;
     we_b=1;addr_b=8'h30;din_b=8'h2C;
     #10;
     
     we_a=0;addr_a=8'h30;
     we_b=0;addr_b=8'h30;
     #10;
     
     $display("Conflict write to address(0x30):Port A read= %h , Port B read=%h",dout_a,dout_b);
    
     $display("Test ran succesfully");
     #20;
     $finish;
     end
     
     endmodule
