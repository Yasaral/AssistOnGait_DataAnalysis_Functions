function hipFT = estimateHipFT(endFT)
armlen = 0.174; % meters

hipFT(1,:,:) = endFT(1,:,:);
hipFT(2,:,:) = endFT(2,:,:);
hipFT(3,:,:) = endFT(6,:,:) + endFT(1,:,:) * armlen;
end

