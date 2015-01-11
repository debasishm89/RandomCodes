// Found this script somewhere in the wild. Dont know who the author is. However it's pretty clean simple and usefull :)
// Name: VTableWalk.idc
// Desc: Attempts to determine vtable function count and encourages IDA to create functions at those function locations


#include <idc.idc>

static GetNumMethods(vtbl)
{
auto a, x;
a = 0;
x = Dword(vtbl + a);

while ((x) && (x != BADADDR) && (Dword(x) != BADADDR)) 
{
a = a + 4;
x = Dword(vtbl + a);
}
return (a-4) / 4;
}

static ParseVtbl()
{
auto a, b, c;
a = ScreenEA();
b = GetNumMethods(a);
Message("%d Vfuncs found\n", b);
for (c = a; c < a + (b*4); c = c + 4)
{
if (c != BADADDR)
{
Message("Trying to make Function at: %X\n", c);
MakeData(c, FF_DWRD, 4, 0);
}
}

}

static main()
{
AddHotkey("Alt-F7","ParseVtbl");
Message("Use Alt-F7 to parse vtable\n");
}
