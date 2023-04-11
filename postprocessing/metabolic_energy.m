function EE = metabolic_energy(VO2, VCO2)
% Metabolic Energy Expenditure
% [W] = [W*s/ml][ml/s]+[W*s/ml][ml/s]
% CORTEX gives VO2 and VCO2 in [l/min]
VO2 = (1000/60)*VO2;
VCO2 = (1000/60)*VCO2;
EE = 16.58*VO2 + 4.51*VCO2;
end
