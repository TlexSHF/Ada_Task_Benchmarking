with Ada.Real_Time; use Ada.Real_Time;
with MicroBit.Console; use MicroBit.Console;

package body MyTasks is

   task body Task_1 is 
      myClock : Time;
   begin
      loop
         -- Execution time C is to be calculated here:
         myClock := Clock;
         Put_Line("Hello from task 1");
         delay(1.0);
         
         -- The period T that the task must execute within
         delay until myClock + Milliseconds(100);
      end loop;
   end Task_1;   

   task body Task_2 is 
      myClock : Time;
   begin
      loop
         -- Execution time C:
         myClock := Clock;
         Put_Line("Hello from task 2");
         delay(1.0);
         
         -- Period T:
         delay until myClock + Milliseconds(100);
      end loop;
   end Task_2;  
end MyTasks;
