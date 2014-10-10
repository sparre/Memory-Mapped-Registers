--  <jacob@jacob-sparre.dk> wrote this. As long as you retain this
--  notice you can do whatever you want with this stuff. If we meet
--  some day, and you think this stuff is worth it, you can buy me a
--  beer in return.
--
--  Jacob Sparre Andersen

with System;
generic
   type Element_Type is private;
   Register_Address : System.Address;
   Register_Size    : Positive;
package Memory_Mapped_Register is
   Register : Element_Type;
   for Register'Address use Register_Address;
   pragma Volatile (Register);
private
   pragma Assert (Register'Size = Register_Size,
                  "The size of Element_Type should match the register size.");
   pragma Assert (Register_Size mod System.Storage_Unit = 0,
                  "Element_Type should fill a whole number of storage " &
                  "elements.");
end Memory_Mapped_Register;
