
function EE = EECalculation(datafile)

[VCO2,VO2,HR] = loadExternalMetabolicCostData(datafile);

EE = metabolic_energy(VO2,VCO2);
end