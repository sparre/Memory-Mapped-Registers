procedure Plain is
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
   Counter_Register : Counter;
   for Counter_Register'Address use Some_Memory'Address;
   pragma Volatile (Counter_Register);
begin
   Counter_Register.Value := 4;
end Plain;
