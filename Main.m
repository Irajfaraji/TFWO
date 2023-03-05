% Developed in MATLAB R2010b
% Source code of Turbulent Flow of Water-based Optimization (TFWO)  demo version 1.0
% _____________________________________________________

%  Authors, inventor and programmer:  Mojtaba Ghasemi (a), Iraj Faraji Davoudkhani (b),
% (a) Shiraz University of Technology, Shiraz, Iran
% (b) Department of Electrical Engineering, Islamic Azad university, Khalkhal, Iran

%  Google scholar: https://scholar.google.com/citations?user=Y0YQKUIAAAAJ&hl=en
%  e-Mail: mojtaba.ghasemi1365@yahoo.com
%  e-Mail: faraji.iraj@gmail.com
% _____________________________________________________
%  Co-responde and Advisor:  Ebrahim Akbari 
%
%        e-Mail: ebrahimakbary@gmail.com
%
%       Google scholar: https://scholar.google.com/citations?user=BoqiUdQAAAAJ&hl=en
% _____________________________________________________
%  Co-authors:  Abolfazl Rahimnejad,Sahand Ghavidel, Li Li

% _____________________________________________________

%  Please refer to the main paper:
% A novel and effective optimization algorithm for global optimization and its engineering applications:
% Turbulent Flow of Water-based Optimization (TFWO)
% Mojtaba Ghasemi, Iraj Faraji Davoudkhani, Ebrahim Akbari, Abolfazl Rahimnejad,Sahand Ghavidel, Li Li
% Future Generation Computer Systems, DOI: https://doi.org/10.1016/j.engappai.2020.103666
% _____________________________________________________
%% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all %#ok<CLALL>
close all
clc

Function_name='F5'; % Name of the test function 

MaxDecades=3000; % Maximum number of iterations

% Load details of the selected benchmark function
[VarMin,VarMax,nVar,CostFunction]=Get_Functions_details(Function_name);

[BestSol,BestCost] = TFWO (nVar,VarMin,VarMax,CostFunction,MaxDecades);


%Draw objective space
figure(1),
hold on
semilogy(BestCost,'Color','b','LineWidth',4);
title('Convergence curve')
xlabel('Iteration');
ylabel('Best fitness obtained so far');
axis tight
grid off
box on
legend('TFWO')

display(['The best location of TFWO is: ', num2str(BestSol.Position)]);
display(['The best fitness of TFWO is: ', num2str(BestSol.Cost)]);

        


