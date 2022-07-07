uses system.runtime.interopservices;

begin
  var fpcpath:=readstring('fpcpath(you can use the one included with lazarus): ');
  var t,o:text;
  var inpname:=readstring('Enter filename: ');
  var inpnamefuncs:=inpname+'funcs';
  assign(t,inpname+'.pas');
  assign(o,inpnamefuncs+'.pas');
  t.reset;
  o.Rewrite;
  o.Writeln(
  'library '+inpnamefuncs+';'+NewLine+
  '                 '+NewLine+
  '{$mode objfpc}{$H+}'+NewLine+
  '                   '+NewLine);
  var funcnames:array of string:=new string[1];
  var funcnamesindex:integer:=0;
  while not t.Eof do 
  begin
    var s:=t.ReadString;
    if s.Contains('cdecl') or s.Contains('stdcall') then
    begin
      if funcnamesindex >= funcnames.Length then
      begin
        setlength(funcnames,funcnames.Length+1);
      end;
      var strarr:=s.Split(' ');
      strarr:=strarr[1].Split('(');
      funcnames[funcnamesindex]:=strarr[0];
      funcnamesindex+=1;
      o.Writeln(s);
      s:=t.ReadString;
      while not s.Contains('begin') do
      begin
        o.Writeln(s);
        s:=t.ReadString;
      end;
      var begins:integer:=1;
      var ends:integer:=0;
      while not (begins=ends) do
      begin
        if s.Contains('end;') then 
        begin 
          ends+=1;
          o.Writeln('end;');
          if begins=ends then break;
        end
        else
          o.Writeln(s);
          s:=t.ReadString;
      end;
    end;
  end;
  o.Writeln('exports');
  for var i:integer :=0 to funcnames.Length-1 do
  begin
    o.write('  '+funcnames[i]);
    if i<funcnames.Length-1 then
    begin
      o.writeln(', ');
    end
    else o.writeln(';');
  end;
  o.Writeln;
  o.Writeln('end.');
  o.Flush;
  exec(fpcpath,'-Sd '+inpnamefuncs+'.pas');
  if not(system.Runtime.InteropServices.RuntimeInformation.IsOSPlatform(system.Runtime.InteropServices.OSPlatform.Windows)) then
  begin
    if fileexists('lib'+inpnamefuncs+'.dylib') then
    begin
      renamefile('lib'+inpnamefuncs+'.dylib',inpnamefuncs+'.dll');      
    end else if fileexists(inpnamefuncs+'.so') then
    begin
      renamefile(inpnamefuncs+'.so',inpnamefuncs+'.dll');    
    end;
  end;
end.