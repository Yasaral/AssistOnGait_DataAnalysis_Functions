function plotHipVel(hipMot, opt)
if ~exist('opt', 'var')
    opt = 'none';
end

freq = 0.25;

if strcmpi(opt, 'stats')
    [m, s] = meanstd(hipMot);
    plotGaitMeanStd(m(4,:), s(4,:))
    ylabel('v_x [mm/s]'); xlabel('Percent Gait Cycle [%]')
    plotGaitMeanStd(m(5,:), s(5,:))
    ylabel('v_y [mm/s]'); xlabel('Percent Gait Cycle [%]')
    plotGaitMeanStd(m(6,:), s(6,:))
    ylabel('\omega [rad/s]'); xlabel('Percent Gait Cycle [%]')
else
    plotMultiAxis(permute(hipMot(4,:,:), [3, 2, 1]), freq)
    ylabel('v_x [mm/s]'); xlabel('Percent Gait Cycle [%]')
    plotMultiAxis(permute(hipMot(5,:,:), [3, 2, 1]), freq)
    ylabel('v_y [mm/s]'); xlabel('Percent Gait Cycle [%]')
    plotMultiAxis(permute(hipMot(6,:,:), [3, 2, 1]), freq)
    ylabel('\omega [rad/s]'); xlabel('Percent Gait Cycle [%]')
end
