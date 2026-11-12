// 2D Mesh rectangle with hole in the middle

mesh_size = 2; // Normal size without refinement
mesh_refinement_size = 0.1; 
r = 3; // Circunference radius

Point(1) = {0, 0, 0, mesh_size};
Point(2) = {40, 0, 0, mesh_size};
Point(3) = {40, 20, 0, mesh_size};
Point(4) = {0, 20, 0, mesh_size};

Point(5) = {20, 10, 0}; // Circunference center
// Half circunference points
Point(6) = {20 + r, 10, 0, mesh_refinement_size};
Point(7) = {20 - r, 10, 0, mesh_refinement_size};

Line(1) = {1, 2};
Line(2) = {2, 3};
Line(3) = {3, 4};
Line(4) = {4, 1};

Circle(5) = {6, 5, 7};
Circle(6) = {7, 5, 6};

Curve Loop(1) = {1, 2, 3, 4}; // External rectangle
Curve Loop(2) = {5, 6}; // Circular hole

Plane Surface(1) = {1, 2};

Physical Surface("Domain", 1) = {1};
Physical Curve("OuterBoundary", 2) = {1, 2, 3, 4};
Physical Curve("IceBoundary", 3) = {5, 6};

//Physical Line("Borde inferior") = {1};
//Physical Line("Carga") = {3};
//Physical Surface("Mi superficie") = {1};

Mesh 2; // Generate mesh 2D

Mesh.SurfaceFaces = 1;
Mesh.Points = 1;

Save "mesh_2D.msh";