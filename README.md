# fpc2abc
Multiple utilities to automate the conversion of fpc libraries to PascalABC(.NET), written in PascalABC

# Features <br>
For now, the utility can only detect stdcall and cdecl functions and partially generate dynamic libraries and (in the future) wrapper PascalABC files for them. <br>
In the future, this utility will be able to:<br>
- unwrap(at least some cases of) variant records  //<-initial purpose of the project actually
- work with NativeInt and PChar
- convert the entire fpc RTL(if it doesn't include assembler)
- more?(miscelaneous stuff like single-element enum bug, no virtual destructors, overloads, statics(unless the conpiler flag is turned on) and so on)

This is a really long-term project that actually should have been a parser, but I hope that reading strings will suffice 

# Compiling
Only PascalABC is supported. To convert cdecl and stdcall functions to dlls, you will need the fpc compiler(for example the one which comes with Lazarus). There will be an option to just cut the calling convention out however. 

# Using
Generated exe's should work on non-windows OSes wit mono, however, that was not tested yet.
<br>
<br>
abc2fpc anyone?
