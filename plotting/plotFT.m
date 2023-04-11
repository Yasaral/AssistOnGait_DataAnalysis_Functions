function plotFT(ft)
tsamp = 0.25;
labels = ["F_x (body frame) [N]";
          "F_y (body frame) [N]";
          "F_z (body frame) [N]";
          "T_x (body frame) [N.m]";
          "T_y (body frame) [N.m]";
          "T_z (body frame) [N.m]"];
plotMultiAxis(ft, labels, [3 2], tsamp)
end
