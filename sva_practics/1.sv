/////ASSERTIONS////////////////
2. Write an assertion for the following conditions.
Case :1
     A 4-bit grant signal has one bit set at any time? (i.e only one req granted at a time) 
Case :2
     To check that once a valid request is asserted by the master, 
	 the arbiter provides a grant within 1 to 5 clock cycles. 
soln:- case:1
		property ppt;
		@(posedge clk) $countones(grant[3:0]==1);
		endproperty
		val: assert property (ppt);	
		case:2
		property ppt;
		@(posedge clk) $rose(req) |-> ##[1:5] $rose(gnt);
		endproperty
		val: assert property (ppt);
		
////------------------////////////////	------	

3.For a synchronous FIFO of depth=64, write an assertion for the following scenarios.
 
Assume there will be a clock signal, write and read enable signals, full flag and a word counter signal.
1) If the word count is >63, FIFO full flag is set.
2) If the word count is 63 and a new write operation happens without a
simultaneous read, then the FIFO full flag gets set.

soln:- 
1.assert property @(posedge clk) disable iff(rst) ((wordcnt>63)|-> fifo_full));
2. assert property @(posedge clk) disable iff(rst) ((wordcnt==63 && wr_en==1 && !read_en) |=> fifo_full));
	
///////////////////-------------////////////////////////////////
4.Write an assertion check to make sure that a signal is high for a minimum of 1 cycles 
and a maximum of 5 cycles.

soln:- property ppt;
		@(posedge clk) $rose(signal) |-> signal([*1:5]) ##1 ~signal;
		endproperty
		
		assert property (ppt);
	
///////////////------------------//////////////////////
	
5.Write an assertion to verify the following scenario on sig_a & sig_b.

sig_a & sig_b must be asserted together only for one cycle & 
then atleast one of the signal must be deasserted.

soln: property ppt;
		@(posedge clk) (sig_a && sig_b) |=> !sig_a or !sig_b;
	endproperty
	
	assert property (p);
	
////////////------------//////////////////////////////

6.Write the assertion to verify the read pointer & write pointer functionality of FIFO (16X8 FIFO).
The write & read enable signals are active high.

soln:
	property p1;
	@(posedge clk) disable iff(rst)
	(wr)&&(!full) && (wr_pt!=15) |=> wr_pt == ($past(wr_pt,1)+1);
	endproperty
	
	property p2;
	@(posedge clk) disable iff(rst)
	(wr) && (!full) && (wr_pt==15) |=> wr_pt == 0;
	endproperty;
	
	property p3;
	@(posedge clk) disable iff(rst)
	(rd)&&(!empty)&&(rd_pt!=15) |=> rd_pt==($past(rd_pt,1)+1);
	endproperty
	
	property p4;
	@(posedge clk) disable iff(rst)
	(rd)&&(!empty)&&(rd_pt==15)|=> rd_pt==0;
	endproperty
	
	property p5;
	@(posedge clk) rst |=> (wr_pt==0)&&(rd_pt==0);
	endproperty
	
/////////////----------------//////////////////

7.Write an assertion to check the following condition.
Once there is a rising edge of signal START in the next cycle signal A &  B should be low.  
Before the signal A & B goes high signal C should go high thrice . 
Throughout the entire expression the START signal should be high.

soln: property ppt;
		@(posedge clk) $rose(start) |-> (start) throughout ##1(!a && !b) ##1(c[=3]) ##1 (a&&b);
		endproperty

/////////////----------------/////////////////////
	
8.Consider an arbiter with 2 request signals (REQ1 & REQ2) as i/ps  & 2 grant sig (GNT1 & GNT2)as o/p.
 The Arbiter should assert only one grant at a time. The priority is as per the table shown below. 
 Write an assertion to check the above scenario.
	REQ1  REQ2 GNT1 GNT2
	0		0	0	0
	0		1	0	1
	1		0	1	0
	1		1	1	0

soln:
	property p1;
	@(posedge clk) REQ2 && !REQ1 |=> GNT2;
	endproperty
	
	property  p2;
	@(posedge clk) REQ1 |=> GNT1;
	endproperty

/////////////////-------------//////////////////////	
9.Write  system verilog sssertion to check the following condition on three signals "A", "B" & "C"

1. At any posedge of clock  if A is asserted , in the next cycle B should be asserted and 
it should be high continuously till C is asserted.
2. Once C is high it should be high for 4 to 5 clock cycles. 
The entire sequence should complete with in 10 to 15 clock cycles.

soln:-
	property p1;
	@(posedge clk) $rose(A) |=> B([*1:$]) ##1 C ([*4:5]) intersect (1[*9:14]);
	endproperty

///////////////////////////////-----------------/////////////////////

10.Write an assertion to check following scenario.
Write signal cannot go high immediately  after read, write can follow read 
only after read latency of 2 cycles.

soln:- property p1;
		@(posedge clk) read |-> !write([*2:$]) ##0 write;
		endproperty

/////////////////--------------------/////////////
	
11.Write assertion to check following condition.
Once Signal B" goes high "Signal "A" must not be asserted until Signal "C" 

soln:- property p1;
		@(posedge clk) $rose(B) |-> !A throughout C[->1];
		endproperty

///////////////////-------------/////////////

12.Write the assertion to verify the following scenario.
Once the signal valid goes high it should be high till ready. 
Once ready is high both valid & ready should go low in next cycle & 
ready should be asserted in three to four cycles after valid. 
soln:- property p1;
		@(posedge clk) $rose(valid) |=> ($stable(valid) throughout (ready)) |=> (!valid && !ready);
	   endproperty
	   property p2;
		@(posedge clk) $rose(valid) |=> ##([1:3]) ready;
	   endproperty

//////////-----------/////////////////////////////////
	
13.Write the assertion to check following scenario on two signals A & B.
Once the signal A goes high, from there signal B should be stable till A becomes low & 
once signal A becomes low next cycle signal B should change.
soln:- property p1;
		@(posedge clk) $rose(A)|=> ($stable(B) throughout ~A[->1] ) |=> (B!=($past(B,1));
		endproperty

//////////////////////////------------------------/////////////////
	
14.Write an assertion to check that a single bit signal "a" is toggling on every posedge of the clock.
soln:- property p1;
		@(posedge clk) a!= $past(a,1);
		endproperty
		
		A: assert property(p1)
		else
		  $display(" assertion failed a= %d", a);

////////////////////////////-----------------------------////////////////////

15.Write an assertion to verify the following scenario.
Once the signal "a" goes high , then there should be three "b's" 
within 10 clock cycles.(a & b are two single bit signals)
Note :- a is a 2 bit so no need to use $rose function
soln:- property p1;
		@(posedge clk) a |-> (b([=3]) intersect (1[*10]));
		endproperty
		 A:assert property (p1);

///////////////////--------------------//////////////////////
		 
16.Write an assertion to verify the following scenario.
There are two single bit signals 'A' & 'B' . Once 'A' goes high it must be high 
for 5 consecutive cycles & 'B' must be high in last cycle of  'A' high.
soln:- property p1;
		@(posedge clk) $rose(A) |=> A([*3]) ##1 (A && B);
		endproperty
		 A:assert property (p1);

///////////////////////-------------------//////////////////////
17.Write an assertion to verify the following condition
If signal "A" is asserted with signal "B" inactive ,and signal "C" was  
inactive in the previous cycle and remains inactive in the next cycle, 
then signal "A" must be deasserted in next cycle.
soln:- property p1;
		@(posedge clk)
			!C ##1 A&&!B ##1 !C |=> !A;
		endproperty
		 A:assert property (p1);

//////////////////////-----------------//////////////////

18.Write an assertion to verify the clock period.

soln:- 
module freq; 
  bit clk; 
  time clk_period = 10ns; 
  initial forever #5 clk=!clk;
  property p_period ( int clk_period);
    time current_time; 
        ('1, current_time = $time) |=> (clk_period == ($time - current_time) );
   endproperty : p_period
  ap_period: assert property(@ (posedge clk) p_period(clk_period)) 
  	  $display("pass at time %t", $time); else 
  	  $display("fail at time %t", $time);
      
endmodule 

//////////////////--------------------////////////

19.In which region the assertions are evaluated

soln:-The signals are sampled in postponed region,evaluated in observed region & 
action blocks are executed in reactive region


	
