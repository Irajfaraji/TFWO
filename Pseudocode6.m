%%  Please refer to the main paper:
% A novel and effective optimization algorithm for global optimization and its engineering applications:
% Turbulent Flow of Water-based Optimization (TFWO)
% Mojtaba Ghasemi, Iraj Faraji Davoudkhani, Ebrahim Akbari, Abolfazl Rahimnejad,Sahand Ghavidel, Li Li
% Future Generation Computer Systems, DOI: https://doi.org/10.1016/j.engappai.2020.103666


function Whirlpool=Pseudocode6(Whirlpool, Decade)
global ProblemSettings;
    global TFWOSettings;
   
    CostFunction=ProblemSettings.CostFunction;
    nVar=ProblemSettings.nVar;
    VarMin=ProblemSettings.VarMin;
    VarMax=ProblemSettings.VarMax;
    
    nPop=TFWOSettings.nPop;
    nWh=TFWOSettings.nWh;
    nOb=TFWOSettings.nOb;
    for i=1:numel(Whirlpool)
        
        cc=[Whirlpool(i).Objects.Cost];
        [min_cc min_cc_index]=min(cc);
        
        if min_cc<=Whirlpool(i).Cost
            
            BestObject=Whirlpool(i).Objects(min_cc_index);
            
            Whirlpool(i).Objects(min_cc_index).Position=Whirlpool(i).Position;
            Whirlpool(i).Objects(min_cc_index).Cost=Whirlpool(i).Cost;
            
            Whirlpool(i).Position=BestObject.Position;
            Whirlpool(i).Cost=BestObject.Cost;
            
        end
        
    end
 
end