//BEHAVIORAL DESCRIPTION OF THE TRAFFIC LIGHT CONTROLLER AT A (T-JUNCTION)
module traffic_light_controller(
	input clk,reset;
	output reg [2:0]light_M1, reg[2:0]light_S, reg[2:0]ligth_MT, reg[2:0]ligth_M2);
	
	
	parameter S1=1,S2=2,S3=3,S4=4,S5=5,S6=6;   //parameters here define the states of the traffic_ligth_controller
	parameter sec1=7,sec2=5,sec3=2,sec4=3;     //these are the time delays to switch from state to state 
	reg[3:0] count;
	reg[2:0] ps;                               //ps here defines the present state


	always @(posedge clk or posedge reset)
	 begin
	  if(reset==1)                             //This block makes the controller to enter the first state when ever the reset is 1
	   begin
	   ps<=S1;
	   count<=1;
	   end
	  else
           case(ps)
 	      S1:if(count<sec1)
		  begin
		  ps<=S1;
		  count<=count+1;
		  end
	         else
		  begin
		  ps<=S2;
		  count<=1;
		  end
	      S2:if(count<sec3)
		  begin
		  ps<=S2;
		  count<=count+1;
		  end
	         else
		  begin
		  ps<=S3;
		  count<=1;
		  end
	      S3:if(count<sec2)
		  begin
		  ps<=S3;
		  count<=count+1;
		  end
	         else
		  begin
		  ps<=S4;
		  count<=1;
		  end
	     S4:if(count<sec4)
		  begin
		  ps<=S4;
		  count<=count+1;
		  end
	         else
		  begin
		  ps<=S5;
		  count<=1;
		  end
	     S5:if(count<sec4)
		  begin
		  ps<=S5;
		  count<=count+1;
		  end
	         else
		  begin
		  ps<=S6;
		  count<=1;
		  end
	     S6:if(count<sec3)
		  begin
		  ps<=S6;
		  count<=count+1;
		  end
	         else
		  begin
		  ps<=S1;
		  count<=1;
		  end
	    default: ps<=S1;
	 endcase
	end

	always @(ps)
	 begin
	  case(ps)
	    S1:
	    begin
	    ligth_M1<=3'b001
	    ligth_M2<=3'b001
	    ligth_MT<=3'b100
	    ligth_S <=3'b100
	    end
	    S2:
	    begin
	    ligth_M1<=3'b001
	    ligth_M2<=3'b010
	    ligth_MT<=3'b100
	    ligth_S <=3'b100
	    end
	    S3:
	    begin
	    ligth_M1<=3'b001
	    ligth_M2<=3'b100
	    ligth_MT<=3'b001
	    ligth_S <=3'b100
	    end
	    S4:
	    begin
	    ligth_M1<=3'b010
	    ligth_M2<=3'b100
	    ligth_MT<=3'b010
	    ligth_S <=3'b100
	    end
	    S5:
	    begin
	    ligth_M1<=3'b100
	    ligth_M2<=3'b100
	    ligth_MT<=3'b100
	    ligth_S <=3'b001
	    end
	    S6:
	    begin
	    ligth_M1<=3'b100
	    ligth_M2<=3'b100
	    ligth_MT<=3'b100
	    ligth_S <=3'b010
	    end
	   endcase
	 end
endmodule
	

		 

	
	


