﻿namespace Elements.RTL;

{$IF COOPER}
extension method java.lang.Object.«ToString»: java.lang.String;
begin
  result := «toString»();
end;

extension method java.lang.Object.«Equals»(aOther: Object): Boolean;
begin
  result := self.equals(aOther)
end;

extension method java.lang.Object.GetHashCode: Integer;
begin
  result := hashCode;
end;
{$ELSEIF TOFFEE}
extension method Foundation.NSObject.ToString: Foundation.NSString;
begin
  result := description;
end;

extension method Foundation.NSObject.Equals(Obj: Object): Boolean;
begin
  result := isEqual(Obj);
end;

extension method Foundation.NSObject.GetHashCode: Integer;
begin
  result := hash;
end;
{$ENDIF}

end.
