%  Please refer to the main paper:
% A novel and effective optimization algorithm for global optimization and its engineering applications:
% Turbulent Flow of Water-based Optimization (TFWO)
% Mojtaba Ghasemi, Iraj Faraji Davoudkhani, Ebrahim Akbari, Abolfazl Rahimnejad,Sahand Ghavidel, Li Li
% Future Generation Computer Systems, DOI: https://doi.org/10.1016/j.engappai.2020.103666

function [BestSol,BestCost] = TFWO (nVar,VarMin,VarMax,CostFunction,MaxDecades)
disp('Turbulent Flow of Waterbased Optimization (TFWO)');

 %% TFWO Settings

nWh=3; % Number of Whirlpools
 
nObW=30; % Number of Particles(Objects) for each Whirlpool   
nPop=nWh+nWh*nObW;  % Toatl Number of population
nOb=nPop-nWh; % Toatl Number of Particles(Objects)
VarMin(1,1:nVar)=VarMin;   
VarMax(1,1:nVar)= VarMax;

global ProblemSettings;
ProblemSettings.CostFunction=CostFunction;
ProblemSettings.nVar=nVar;
ProblemSettings.VarMin=VarMin;
ProblemSettings.VarMax=VarMax;

%% TFWO Settings
global TFWOSettings;
TFWOSettings.nPop=nPop;
TFWOSettings.nWh=nWh;
TFWOSettings.nOb=nOb;
TFWOSettings.nObW=nObW;
TFWOSettings.MaxDecades=MaxDecades;


%% Initialization :
% 1-Generate the initial random population
% 2-Evaluate the fitness the initial population
% 3-The divide the algorithm痴 population into NWh groups or whirlpool sets


Whirlpool=Initialize();

BestSol.Position=[];
BestSol.Cost=[];

BestCost=zeros(TFWOSettings.MaxDecades,1);
MeanCost=zeros(TFWOSettings.MaxDecades,1);

%% TFWO
    for Decade=1:MaxDecades
        Whirlpool=Effectsofwhirlpools(Whirlpool, Decade);%Pseudocodes From 1 To 5    
        Whirlpool=Pseudocode6(Whirlpool, Decade); %Pseudocode 6th   
        WhirlpoolCost=[Whirlpool.Cost];
        [BestWhirlpoolCost BestWhirlpoolIndex]=min(WhirlpoolCost);
        BestWhirlpool=Whirlpool(BestWhirlpoolIndex);

        BestSol.Position=BestWhirlpool.Position;
        BestSol.Cost=BestWhirlpool.Cost;

        S(Decade,:)=BestSol.Position;
        BestCost(Decade)=BestWhirlpoolCost;
        MeanCost(Decade)=mean(WhirlpoolCost);

        disp(['Decade ' num2str(Decade) ...
              ': Best Cost = ' num2str(BestCost(Decade))]);

    end
end


