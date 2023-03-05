%  Please refer to the main paper:
% A novel and effective optimization algorithm for global optimization and its engineering applications:
% Turbulent Flow of Water-based Optimization (TFWO)
% Mojtaba Ghasemi, Iraj Faraji Davoudkhani, Ebrahim Akbari, Abolfazl Rahimnejad,Sahand Ghavidel, Li Li
% Future Generation Computer Systems, DOI: https://doi.org/10.1016/j.engappai.2020.103666

function Whirlpool=Initialize()

    global ProblemSettings;
    global TFWOSettings;
    
    CostFunction=ProblemSettings.CostFunction;
    nVar=ProblemSettings.nVar;
    VarMin=ProblemSettings.VarMin;
    VarMax=ProblemSettings.VarMax;
    
    nPop=TFWOSettings.nPop;
    nWh=TFWOSettings.nWh;
    nOb=TFWOSettings.nOb;
    nObW=TFWOSettings.nObW;


    EmptyObject.Position=[];
    EmptyObject.Cost=[];
     EmptyObject.delta=[];
    Objects=repmat(EmptyObject,nPop,1);
    for k=1:nPop
        Objects(k).Position=unifrnd(VarMin,VarMax,[1 nVar]);
        Objects(k).Cost=CostFunction(Objects(k).Position);
        Objects(k).delta=0;
    end


    [SortedCosts CostsSortOrder]=sort([Objects.Cost]);
    Objects=Objects(CostsSortOrder);
    
    EmptyWhirlpool.Position=[];
    EmptyWhirlpool.Cost=[];
    EmptyWhirlpool.TotalCost=[];
    EmptyWhirlpool.nObW=[];
    EmptyWhirlpool.delta=[];
    EmptyWhirlpool.Objects=[];
    
    Whirlpool=repmat(EmptyWhirlpool,nWh,1);
    for i=1:nWh
        Whirlpool(i).Position=Objects(i).Position;
        Whirlpool(i).Cost=Objects(i).Cost;
         Whirlpool(i).delta=Objects(i).delta;
    end
    
    Objects=Objects(nWh+1:end);
    if isempty(Objects)
        return;
    end
    
    WhirlpoolCosts=[Whirlpool.Cost];


    
    Objects=Objects(randperm(nOb));
    
    for i=1:nWh
        

          Whirlpool(i).nObW=nObW;
         Whirlpool(i).Objects=Objects(1:nObW);
         Objects=Objects(nObW+1:end);
    end
    
end