with MyTasks; use MyTasks;
with MicroBit.Console; use MicroBit.Console;
with Ada.Real_Time; use Ada.Real_Time;

procedure Main with Priority => 0 is
   type MyFloat is digits 3;
   type RangeOfComps is range 0 .. 10;
   type ComputationsArray is array(RangeOfComps) of Time_Span;

   Task1Computations : ComputationsArray;
   Task2Computations : ComputationsArray;

   AvgTask1CompTime : Time_Span := Time_Span_Zero;
   AvgTask2CompTime : Time_Span := Time_Span_Zero;

   AvgTask1Seconds : MyFloat := 0.0;
   AvgTask2Seconds : MyFloat := 0.0;

   -- AvgTask1SecondsFloat : Float := 0.0;
   -- AvgTask2SecondsFloat : Float := 0.0;
begin
   Put_Line("Collecting samples...");
   for i in RangeOfComps loop
      delay(1.0); -- waiting for different samples
      Task1Computations(i) := Task1Comp;
      Task2Computations(i) := Task2Comp;
   end loop;

   Put_Line("Collected Computations are:");
   for i in RangeOfComps loop
      Put_Line(Task1Computations(i)'Image);
      Put_Line(Task2Computations(i)'Image);
      delay(0.001); -- slowing down the serial put
   end loop;

   for i in RangeOfComps loop
      AvgTask1CompTime := AvgTask1CompTime + Task1Computations(i);
      AvgTask2CompTime := AvgTask2CompTime + Task2Computations(i);
   end loop;


   AvgTask1CompTime := AvgTask1CompTime / 10;
   AvgTask2CompTime := AvgTask2CompTime / 10;

   -- Converting from Time_Span to Float, and from microseconds to milliseconds
   AvgTask1Seconds := MyFloat(AvgTask1CompTime / Milliseconds(1));
   AvgTask2Seconds := MyFloat(AvgTask2CompTime / Milliseconds(1));

   -- Converting from milliseconds to Seconds with precision 10^3
   AvgTask1Seconds := AvgTask1Seconds / 1000.0;
   AvgTask2Seconds := AvgTask2Seconds / 1000.0;

   Put_Line("Average Computation times in seconds are:");
   Put_Line("Task 1: " & AvgTask1Seconds'Image);
   Put_Line("Task 2: " & AvgTask2Seconds'Image);



   -- Empty loop to keep the program from rebooting
   loop
      --Put_Line("Task 1 Comp:" & MyTasks.Task1Comp'Image);
      --Put_Line("Task 2 Comp:" & MyTasks.Task2Comp'Image);
      --delay(0.1);
      null;
   end loop;
end Main;


-- type mytype is mod 10;
