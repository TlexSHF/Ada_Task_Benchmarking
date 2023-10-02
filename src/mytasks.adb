with Ada.Real_Time; use Ada.Real_Time;
with MicroBit.Console; use MicroBit.Console;

package body MyTasks is
   
   task body Task_1 is 
      myClock : Time;
      -- computationTime : Time_Span;
   begin
      loop
         -- Execution time C is to be calculated here:
         myClock := Clock;
         delay(0.1); -- adding content
         task1Comp := Clock - myClock;
         -- Put_Line("Task 1: " & i'Image &  " Computation time: " & Task1C'Image);
         -- Put_Line("Task 1: Computation time: " & Task1C'Image);
         -- The period T that the task must execute within
         delay until myClock + Milliseconds(500);
      end loop;
   end Task_1;   

   task body Task_2 is 
      myClock : Time;
   begin
      loop
         -- Execution time C:
         myClock := Clock;
         delay(2.0);
         task2Comp := Clock - myClock;
         -- Put_Line("Task 2: " & i'Image &  " Computation time: " & Task2C'Image);
         -- Put_Line("Task 2: Computation time: " & Task2C'Image);
         -- Period T:
         delay until myClock + Milliseconds(1000);
      end loop;
   end Task_2;  
end MyTasks;
