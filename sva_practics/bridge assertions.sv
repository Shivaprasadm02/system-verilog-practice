AHB ASSERTIONS:

1.NONSEQ (BURST = 0) should not follow BUSY
        property p1;
                @(posedge HCLK) disable iff(!HRESETn)
                        (HBURST == 0) |=> (HTRANS != 1);
        endproperty
		A:assert property (p1);
		
2.Busy followed by Idle

	property p2;
	@(posedge HCLK) disable iff(!HRESETn)
	(HTRANS==2'b01) ##1 (HTRANS==2'b0) |-> ($past(HBURST,1)==4'b0001);
	endproperty
	A:assert property(p2);
	
3. Okay Resp for Idle Trans

	property p3;
	@(posedge HCLK) disable iff(!HRESETn)
	(HTRANS==2'b0) |=> (HRESP == 2'b0);
	endproperty
	A:assert property(p3);
	
4.1KB boundary condition

	property p4;
	@(posedge HCLK) disable iff(!HRESETn)
	(HTRANS==2'b11) |-> (HADDR[10:0]!=11'b1_00000_00000);
	endproperty
	
	A:assert property(p4);
	
5.Address Check for INCR/INCRx

	property p5;
        @(posedge Hclk) disable iff(!Hresetn)
        (Hwrite==1) && (Htrans==3) && (Hburst==3) && (Hsize==0)
         |-> (Haddr == ($past(Haddr,1) +1'b1 ));
        endproperty

        A55555:assert property(p5);
// hsize =1
property p15;
        @(posedge Hclk) disable iff(!Hresetn)
        (Hwrite==1) && (Htrans==3) && (Hburst==3) && (Hsize==1)
         |-> (Haddr == ($past(Haddr,1) +2'b10 ));
        endproperty

        A555:assert property(p5);
//hsize =2
property p16;
        @(posedge Hclk) disable iff(!Hresetn)
        (Hwrite==1) && (Htrans==3) && (Hburst==3) && (Hsize==2)
         |-> (Haddr == ($past(Haddr,1) +3'b100 ));
        endproperty

        A55:assert property(p5);
//incr 8 hsize = 0
property p25;
        @(posedge Hclk) disable iff(!Hresetn)
        (Hwrite==1) && (Htrans==3) && (Hburst==5) && (Hsize==0)
         |-> (Haddr == ($past(Haddr,1) +1'b1 ));
        endproperty

        A25:assert property(p25);
//hsize = 1
property p35;
        @(posedge Hclk) disable iff(!Hresetn)
        (Hwrite==1) && (Htrans==3) && (Hburst==5) && (Hsize==1)
         |-> (Haddr == ($past(Haddr,1) +2'b10 ));
        endproperty

        A35:assert property(p35);
//hsize = 2
property p45;
        @(posedge Hclk) disable iff(!Hresetn)
        (Hwrite==1) && (Htrans==3) && (Hburst==5) && (Hsize==2)
         |-> (Haddr == ($past(Haddr,1) +3'b100 ));
        endproperty
 A45:assert property(p45);

//incr =16 hsize=0

property p55;
        @(posedge Hclk) disable iff(!Hresetn)
        (Hwrite==1) && (Htrans==3) && (Hburst==7) && (Hsize==0)
         |-> (Haddr == ($past(Haddr,1) +1'b1 ));
        endproperty

        m55:assert property(p55);
//hsize == 1
property p65;
        @(posedge Hclk) disable iff(!Hresetn)
        (Hwrite==1) && (Htrans==3) && (Hburst==7) && (Hsize==1)
         |-> (Haddr == ($past(Haddr,1) +2'b10 ));
        endproperty

        A65:assert property(p65);
//hsize == 2
property p75;
        @(posedge Hclk) disable iff(!Hresetn)
        (Hwrite==1) && (Htrans==3) && (Hburst==5) && (Hsize==2)
         |-> (Haddr == ($past(Haddr,1) +3'b100 ));
        endproperty

        A75:assert property(p75);

	
6.Address Check for WRAP4 Byte

	property p6;
	@(posedge HCLK) disable iff(!HRESETn)
	(HWRITE==1)&& (HTRANS==3) && (HBURST==2) && (HSIZE == 0) 
	|-> ((HADDR[1:0] == ($past(HADDR[1:0],1)+1)) && (HADDR[31:2] == $past(HADDR[31:2],1)));
	endproperty
	
	A:assert property(p6);
	
7.Address Check for WRAP4 Halfword(16)

	property p7;
	@(posedge HCLK) disable iff(!HRESETn)
	(HWRITE==1)&&(HTRANS==3) && (HBURST==2) && (HSIZE == 1) 
	|-> ((HADDR[2:1] == ($past(HADDR[2:1],1)+1)) && (HADDR[31:3] == $past(HADDR[31:3],1) && HADDR[0] == $past(HADDR[0],1)));
	endproperty
	
	A:assert property(p7);
	
8.Address Check for WRAP4 Word  

	property p8;
	@(posedge HCLK) disable iff(!HRESETn)
	(HWRITE==1) && (HTRANS==3) && (HBURST==2) && (HSIZE == 2) 
	|-> ((HADDR[3:2] == ($past(HADDR[3:2],1)+1)) && (HADDR[31:4] == $past(HADDR[31:4],1) && (HADDR[1:0] == $past(HADDR[1:0],1)));
	endproperty
	
	A:assert property(p8);

9.Address Check for WRAP8 Byte 

	property p9;
	@(posedge HCLK) disable iff(!HRESETn)
	(HWRITE==1)&& (HTRANS==3) && (HBURST==4) && (HSIZE==0) 
	|-> ((HADDR[31:3]==$past(HADDR[31:3],1)) && (HADDR[2:0]==$past(HADDR[2:0],1)+1)));
	endproperty
	
	A:assert property(p9);
	
10.Address Check for WRAP8 Halfword 

	property p10;
	@(posedge HCLK) disable iff(!HRESETn)
	(HWRITE==1)&&(HTRANS==3) && (HBURST==4) && (HSIZE==1) 
	|-> ((HADDR[31:4]==$past(HADDR[31:4],1)) && (HADDR[3:1]==$past(HADDR[3:1],1)+1) && (HADDR[0]==$past(HADDR[0],1)));
	endproperty
	
	A:assert property(p10);
	
11.Address Check for WRAP8 Word  

	property p11;
	@(posedge HCLK) disable iff(!HRESETn)
	(HWRITE==1) && (HTRANS==3) && (HBURST==4) && (HSIZE==2) 
	|-> ((HADDR[31:5]==$past(HADDR[31:5],1)) && (HADDR[4:2]==$past(HADDR[4:2],1)+1) && (HADDR[1:0]==$past(HADDR[1:0],1)));
	endproperty
	
	A:assert property(p11);
	
12.Address Check for WRAP16 Byte

	property p12;
	@(posedge HCLK) disable iff(!HRESETn)
	(HWRITE==1) && (HTRANS==3) && (HBURST==6) && (HSIZE==0) 
	|-> ((HADDR[31:4]==$past(HADDR[31:4],1)) && (HADDR[3:0]==$past(HADDR[3:0],1)+1'b1)));
	endproperty
	
	A:assert property(p12);
	
13.Address Check for WRAP16 halfword

	property p12;
	@(posedge HCLK) disable iff(!HRESETn)
	(HWRITE==1) && (HTRANS==3) && (HBURST==6) && (HSIZE==1) 
	|-> ((HADDR[31:5]==$past(HADDR[31:5],1)) && (HADDR[4:1]==$past(HADDR[4:1],1)+1'b1) && (HADDR[0]==$past(HADDR[0],1)));
	endproperty
	
	A:assert property(p12);
	
14.Address Check for WRAP16 word

	property p13;
	@(posedge HCLK) disable iff(!HRESETn)
	(HWRITE==1) && (HTRANS==3) && (HBURST==6) && (HSIZE==2) 
	|-> ((HADDR[31:6]==$past(HADDR[31:6],1)) && (HADDR[5:2]==$past(HADDR[5:2],1)+1'b1) && (HADDR[1:0]==$past(HADDR[1:0],1)));
	endproperty
	
	A:assert property(p13);
	
15.Busy on Address and Write Data

	property p14;
	@(posedge HCLK) disable iff(!HRESETn)
	(HTRANS==1) && (HWRITE==1) && (HTRANS!=0) |=> (($past(HWDATA,1) == ($past(HWDATA,2)) && (($past(HADDR,1) == ($past(HADDR,2));
	endproperty
	
	A:assert property(p14);
	
16.Busy on Address and Read Data
	
	property p15;
	@(posedge HCLK) disable iff(!HRESETn)
	(HTRANS==1) && (HWRITE==1) && (HTRANS!=0) |=> (($past(HRDATA,1) == ($past(HRDATA,2)) && (($past(HADDR,1) == ($past(HADDR,2));
	endproperty
	
	A:assert property(p15);
	
	

	
	
  


