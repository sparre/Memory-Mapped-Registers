with System;
with Memory_Mapped_Register;
procedure Packaged_Register is
   type Counts is range 0 .. 7;
   type Counter is
      record
         Value : Counts;
      end record;
   for Counter'Size use 8;
   for Counter use
      record
         Value at 0 range 3 .. 5;
      end record;
   package Memory_Mapped_Counter is
     new Memory_Mapped_Register (Element_Type     => Counter,
                                 Register_Address => System.Null_Address,
                                 Register_Size    => 8);
   Counter_Register : Counter renames Memory_Mapped_Counter.Register;
begin
   Counter_Register.Value := 4;
end Packaged_Register;
