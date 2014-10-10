with System;
generic
   type Element_Type is private;
   Register_Address : System.Address;
package Memory_Mapped_Register is
   Register : Element_Type;
   for Register'Address use Register_Address;
   pragma Volatile (Register);
end Memory_Mapped_Register;
