function plotHipFT(hipFT, opt)
if ~exist('opt', 'var')
    opt = 'none';
end

freq = 0.25;

if strcmpi(opt, 'stats')
    [m, s] = meanstd(hipFT);
    plotGaitMeanStd(m(1,:), s(1,:))
    ylabel('F_x (body frame) [N]'); xlabel('Percent Gait Cycle [%]')
    plotGaitMeanStd(m(2,:), s(2,:))
    ylabel('F_y (body frame) [N]'); xlabel('Percent Gait Cycle [%]')
    plotGaitMeanStd(m(3,:), s(3,:))
    ylabel('T_z [N.m]'); xlabel('Percent Gait Cycle [%]')
else
    plotMultiAxis(permute(hipFT(1,:,:), [3, 2, 1]), freq)
    ylabel('F_x (body frame) [N]'); xlabel('Percent Gait Cycle [%]')
    plotMultiAxis(permute(hipFT(2,:,:), [3, 2, 1]), freq)
    ylabel('F_y (body frame) [N]'); xlabel('Percent Gait Cycle [%]')
    plotMultiAxis(permute(hipFT(3,:,:), [3, 2, 1]), freq)
    ylabel('T_z [N.m]'); xlabel('Percent Gait Cycle [%]')
end
