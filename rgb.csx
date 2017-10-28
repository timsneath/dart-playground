using System;
using System.Debug;

public string Rgb(int r, int g, int b) 
{
    if (r > 255) r = 255;
    if (g > 255) g = 255;
    if (b > 255) b = 255;
    if (r < 0) r = 0;
    if (g < 0) g = 0;
    if (b < 0) b = 0;
    
    return string.Format("{0:X2}{1:X2}{2:X2}", r, g, b);
}

Debug.Assert(rgb(255, 255, 255) == "FFFFFF"));
Debug.Assert(rgb(255, 255, 300) == "FFFFFF"));
Debug.Assert(rgb(0, 0, 0) == "000000"));
Debug.Assert(rgb(148, 0, 211) == "9400D3"));
Debug.Assert(rgb(148, -20, 211) == "9400D3"));
Debug.Assert(rgb(144, 195, 212) == "90C3D4"));
Debug.Assert(rgb(212, 53, 12) == "D4350C"));