 function [data] = Corrector(data)


for j = 1:1:3
    for i = 1:1:400
        if data(j,i) >= -180 & data(j,i) <= -150
            data(j,i) = data(j,i) + 180;
        end

        if data(j,i) < 180 & data(j,i) > 150
            data(j,i) = data(j,i) - 180;       
        end
    end
end

 end
