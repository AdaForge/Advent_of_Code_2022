pragma Style_Checks ("M120");
--  -------------------------------------------------------------
--  SPDX-License-Identifier: CC-BY-SA-4.0
--  SPDX-FileCopyrightText: Copyright 2022 William J. FRANCK (william@sterna.io)
--  SPDX-Creator: William J. FRANCK (william@sterna.io)
--  Ref: https://creativecommons.org/licenses/by-sa/4.0/legalcode
--  -------------------------------------------------------------
--  Initial creation date : 2022-12-09
--  -------------------------------------------------------------
pragma Ada_2022;

with Grids; use Grids;

with Ada.Streams;
use Ada.Streams;

package Moves is

   type Direction is (Down, Left, Right, Up);
   for Direction use (
      Down  => Character'Pos ('D'),
      Left  => Character'Pos ('L'),
      Right => Character'Pos ('R'),
      Up    => Character'Pos ('U'));

   subtype Distance is Natural;

   type Displacement is record
      Dir  : Direction;
      Dist : Distance;
   end record;

  procedure Read_Record (
      Stream : not null access Root_Stream_Type'Class;
      Item   : out Displacement);
   for Displacement'Read use Read_Record;

   procedure Write_Record (   -- for the purpose of tracing
      Stream : not null access Root_Stream_Type'Class;
      Item   : Displacement);
   for Displacement'Write use Write_Record;

   procedure Displacement_Write (   -- for the purpose of tracing
      Item   : Displacement);

   function New_Head_Position (
         Head_From : Grid_Position;
         Move : Displacement)
         return Grid_Position;

   function New_Tail_Position (
         Tail_Pos, Head_From : Grid_Position;  
         Move : Displacement;
         History : in out Tail_History)
         return Grid_Position;

private

end Moves;
