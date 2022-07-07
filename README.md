# abctofpc
Multiple utilities to automate the conversion of fpc libraries to PascalABC(.NET)

For now, the utility can only detect stdcall and cdecl and partially generate dynamic libraries and (in the future) wrapper PascalABC files.
In the future, this utility will be able to:
-unwrap(at least some cases of) variant records  //<-initial purpose of the project actually
-work with NativeInt and PChar
-convert the entire fpc RTL(if it doesn't include assembler)
-more?(miscelaneous stuff like single-element enum bug, no virtual destructors, overloads, statics(unless the conpiler flag is turned on) and so on)

This is a really long-term project that actually should have been a parser, but I hope that reading strings will suffice 

abctofpc anyone?
