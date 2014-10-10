--  <jacob@jacob-sparre.dk> wrote this. As long as you retain this
--  notice you can do whatever you want with this stuff. If we meet
--  some day, and you think this stuff is worth it, you can buy me a
--  beer in return.
--
--  Jacob Sparre Andersen

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
