with Ada.Real_Time; use Ada.Real_Time;

package MyTasks is

   Task1Comp : Time_Span := Time_Span_Zero;
   Task2Comp : Time_Span := Time_Span_Zero;

   -- This task set has 2 tasks, with different priorities

   task Task_1 with Priority => 1;
   task Task_2 with Priority => 2;

end MyTasks;
