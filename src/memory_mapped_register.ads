with System;
generic
   type Element_Type is private;
   Register_Address : System.Address;
   Register_Size    : Positive;
package Memory_Mapped_Register is
   Register : Element_Type;
   for Register'Address use Register_Address;
   pragma Volatile (Register);
   pragma Assert (Register'Size = Register_Size,
                  "The size of Element_Type should match the register size.");
end Memory_Mapped_Register;
