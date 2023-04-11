function [NoExo,H0,H1,H2] = Selector(Data,Condition)
        
        NoExo = [];
        H0 = [];
        H1 = [];
        H2 = [];

        if isequal('NoExo', Condition )
            NoExo = cat(2,NoExo,Data);
        elseif isequal('H0', Condition )
            H0 = cat(2,H0,Data);
        end
        
        if isequal('H1', 'Condition')
            H1 = cat(2,H1,Data);
        elseif isequal('H2', Condition )
            H2 = cat(2,H2,Data);
        end
            
            
                 
