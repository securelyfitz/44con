`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    11:11:08 08/25/2014 
// Design Name: 
// Module Name:    conled 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module conled(
    input clk,
    output led0,
    output led1,
    output led2,
    output led3,
    output led4,
    output led5
    );
reg [25:0] counter;
reg [5:0] ledout;

//assign {led0,led1,led2,led3,led4,led5}=ledout;
assign {led0,led1,led2,led3,led4,led5}=6'b111111;

//generate 0,25,50,75, and 100% duty cycle signals
assign duty0=0;
assign duty1=counter[15]&counter[16]&counter[17];
assign duty2=counter[15]&counter[16];
assign duty3=counter[15];
assign duty4=1;

always @(posedge clk)
begin
	//increment counter
	counter<=counter+1;
	//use high 3 bits as state, translate duty cycle accordingly
	case (counter[25:23])
    3'b000:ledout={duty0,duty4,duty3,duty2,duty1,duty0};
    3'b001:ledout={duty4,duty3,duty2,duty1,duty0,duty0};
    3'b010:ledout={duty3,duty2,duty1,duty0,duty0,duty0};
    3'b011:ledout={duty2,duty1,duty0,duty0,duty0,duty0};
    3'b100:ledout={duty1,duty0,duty0,duty0,duty0,duty4};
    3'b101:ledout={duty0,duty0,duty0,duty0,duty4,duty3};
    3'b110:ledout={duty0,duty0,duty0,duty4,duty3,duty2};
    default:ledout={duty0,duty0,duty4,duty3,duty2,duty1};
//    3'b000:ledout={duty0,duty1,duty2,duty3,duty4,duty3};
//    3'b001:ledout={duty1,duty2,duty3,duty4,duty3,duty2};
//    3'b010:ledout={duty2,duty3,duty4,duty3,duty2,duty1};
//    3'b011:ledout={duty3,duty4,duty3,duty2,duty1,duty0};
//    3'b100:ledout={duty4,duty3,duty2,duty1,duty0,duty1};
//    3'b101:ledout={duty3,duty2,duty1,duty0,duty1,duty2};
//    3'b110:ledout={duty2,duty1,duty0,duty1,duty2,duty3};
//    default:ledout={duty1,duty0,duty1,duty2,duty3,duty4};
  endcase
end

endmodule
