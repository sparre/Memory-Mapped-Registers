--  <jacob@jacob-sparre.dk> wrote this. As long as you retain this
--  notice you can do whatever you want with this stuff. If we meet
--  some day, and you think this stuff is worth it, you can buy me a
--  beer in return.
--
--  Jacob Sparre Andersen

with Memory_Mapped_Register;
procedure Packaged_Register is
   Some_Memory : String := "Hello world!";

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
                                 Register_Address => Some_Memory'Address,
                                 Register_Size    => 8);
   Counter_Register : Counter renames Memory_Mapped_Counter.Register;
begin
   Counter_Register.Value := 4;
end Packaged_Register;
