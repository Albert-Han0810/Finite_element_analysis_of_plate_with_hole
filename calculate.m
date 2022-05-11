function [streee_max_stress_ave] = calculate(smodel,E,nu,p)
%UNTITLED2 此处提供此函数的摘要
%   此处提供详细说明
msh= generateMesh(smodel);
% figure 
% pdeplot3D(smodel);
structuralProperties(smodel,'YoungsModulus',E,'PoissonsRatio',nu);
structuralBC(smodel,'Face',2,'Constraint','fixed');
structuralBC(smodel,'Face',3,'Constraint','fixed');
structuralBoundaryLoad(smodel,'Face',4,'Pressure',-p);
structuralBoundaryLoad(smodel,'Face',6,'Pressure',-p);
Rs=solve(smodel);
figure
img=pdeplot3D(smodel, 'ColorMapData',Rs.VonMisesStress, 'Deformation',Rs.Displacement,'DeformationScaleFactor',1000)
streee_max_stress_ave=max(Rs.Stress.hoop)/mean(Rs.Stress.hoop);
end