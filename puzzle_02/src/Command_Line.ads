--  Ada Common Libraries
with Ada.Strings.Bounded;

package Command_Line is

   package OS_File_Name is
      new Ada.Strings.Bounded.Generic_Bounded_Length (1_024);
   use OS_File_Name;

   type Program_args is record
      Trace          : Boolean := True;
      Data_File_Name : Bounded_String;
   end record;

   BAD_ARGUMENTS : exception;

   procedure Get_Args (Args : in out Program_args);

end Command_Line;
