function hipPOS = extract_motion(endPOS)

hipPOS(1,:,:) = endPOS(1,:,:); %rx pos
hipPOS(2,:,:) = endPOS(2,:,:); %ry pos
hipPOS(3,:,:) = endPOS(3,:,:); %rtheta
end