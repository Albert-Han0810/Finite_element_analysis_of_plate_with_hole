%%
E=21000;
nu=0.3;
p=2000;
smodel1=createpde("structural",'static-solid');
importGeometry(smodel1,'r=5mm.stl');
alf1=calculate(smodel1,E,nu,p);

smodel2=createpde("structural",'static-solid');
importGeometry(smodel2,"r=3mm.stl");
alf2=calculate(smodel2,E,nu,p);

smodel3=createpde("structural",'static-solid');
importGeometry(smodel3,"r=1mm.stl");
alf3=calculate(smodel3,E,nu,p);%alf is the Stress concentration factor
disp(alf1)
disp(alf2)
disp(alf3)
% pdegplot(smodel1,'Facelabels','on','FaceAlpha',0.5);
% msh= generateMesh(smodel);
% pdeplot3D(smodel);
% E=0.00784*10^9;%pa
% nu=0.47;
% p=1000;%pa
% structuralProperties(smodel,'YoungsModulus',E,'PoissonsRatio',nu);
% structuralBC(smodel,'Face',2,'Constraint','fixed');
% structuralBC(smodel,'Face',3,'Constraint','fixed');
% structuralBoundaryLoad(smodel,'Face',4,'Pressure',-p);
% structuralBoundaryLoad(smodel,'Face',6,'Pressure',-p);
% Rs=solve(smodel);
% figure
% pdeplot3D(smodel, 'ColorMapData',Rs.VonMisesStress, 'Deformation',Rs.Displacement,'DeformationScaleFactor',1000)
% a=max(Rs.Stress.hoop)/mean(Rs.Stress.hoop)