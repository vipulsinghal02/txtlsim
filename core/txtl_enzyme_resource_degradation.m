function txtl_enzyme_resource_degradation(modelObj)

atp_deg_rate = modelObj.UserData.ReactionConfig.ATP_degradation_rate;
atp_deg_time = modelObj.UserData.ReactionConfig.ATP_degradation_start_time;

% After some time, ATP regeneration stops, leading to an overall decrease in 
% ATP concentrations. c.f. V Noireaux 2003.
parameterObj = addparameter(modelObj, 'AGTPdeg_F', 0, 'ConstantValue', false);
parameterObj = addparameter(modelObj, 'AGTPdeg_time', 0, 'ConstantValue', true);
parameterObj = addparameter(modelObj, 'AGTPdeg_rate', atp_deg_rate, 'ConstantValue', true);
evt2 = addevent(modelObj, 'time <= AGTPdeg_time' , 'AGTPdeg_F = 0');
evt3 = addevent(modelObj, 'time > AGTPdeg_time',...
    ['AGTPdeg_F = AGTPdeg_rate']);% '=' num2str(atp_deg_rate)]
reactionObj = addreaction(modelObj,'AGTP -> AGTP_USED');
kineticlawObj = addkineticlaw(reactionObj, 'MassAction');
set(kineticlawObj, 'ParameterVariableName', 'AGTPdeg_F');

end