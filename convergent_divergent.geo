// this is a 2d convergent divergent 
// structured or unstructured mesh 
// Author : D. Chibouti

// parameters
yy = 0.3;
lc = 1.0;
Nx = 80;
Ny = 40;

// bottom profile
Point(1) = {1.0000, 0.0013, 0, lc};
Point(2) = {1.0000, 0.0013, 0, lc};
Point(3) = {0.9500, 0.0147, 0, lc};
Point(4) = {0.9000, 0.0271, 0, lc};
Point(5) = {0.8000, 0.0489, 0, lc};
Point(6) = {0.7000, 0.0669, 0, lc};
Point(7) = {0.6000, 0.0814, 0, lc};
Point(8) = {0.5000, 0.0919, 0, lc};
Point(9) = {0.4000, 0.0980, 0, lc};
Point(10) = {0.3000, 0.0976, 0, lc};
Point(11) = {0.2500, 0.0941, 0, lc};
Point(12) = {0.2000, 0.0880, 0, lc};
Point(13) = {0.1500, 0.0789, 0, lc};
Point(14) = {0.1000, 0.0659, 0, lc};
Point(15) = {0.0750, 0.0576, 0, lc};
Point(16) = {0.0500, 0.0473, 0, lc};
Point(17) = {0.0250, 0.0339, 0, lc};
Point(18) = {0.0125, 0.0244, 0, lc};

// top profile
Point(101) = {1.1000, yy+ 0.13, 0, lc};
Point(102) = {1.1000, yy+ 0.13, 0, lc};
Point(103) = {1.0500, yy+ 0.107, 0, lc};
Point(104) = {1.0000, yy+0.0871, 0, lc};
Point(105) = {0.9000, yy+0.061, 0, lc};
Point(106) = {0.8000, yy+0.0469, 0, lc};
Point(107) = {0.7000, yy+0.0414, 0, lc};
Point(108) = {0.5000, yy+0.0369, 0, lc};
Point(109) = {0.4000, yy+0.0380, 0, lc};
Point(110) = {0.3000, yy+0.045976, 0, lc};
Point(111) = {0.2500, yy+0.04941, 0, lc};
Point(112) = {0.2000, yy+0.055880, 0, lc};
Point(113) = {0.1500, yy+0.063789, 0, lc};
Point(114) = {0.1000, yy+0.070659, 0, lc};
Point(115) = {0.0750, yy+0.07576, 0, lc};
Point(116) = {0.0500, yy+0.080473, 0, lc};
Point(117) = {0.0250, yy+0.089, 0, lc};
Point(118) = {0.0125, yy+0.09544, 0, lc};

// B-Spline pour raccorder les points
BSpline(10) = {18, 17, 16, 15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 1};
BSpline(11) = {101, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118};

// lines 
Line(5) = {118, 18};
Line(7) = {101, 1};

// //+
Curve Loop(2) = {5, 10, -7, 11};
Plane Surface(2) = {2};

// unstructured mesh 
Transfinite Curve {5, 7, 2} = Nx Using Progression 1;
//+
Transfinite Curve {1, 5, 7, 10, 11} = Ny Using Progression 1;


// add this to get structured mesh 
Transfinite Surface {5};
Transfinite Surface {2};
//
Recombine Surface {5, 2};

