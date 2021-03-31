function course = removeNAN(course)
    LB_temp = course.LB;
    LA_temp = course.LA;
    LB_res = [];
    LA_res = [];
    
    for i = 1:length(LB_temp)
        if ~isnan(LB_temp(i)) && ~isnan(LA_temp(i))
            LA_res = [LA_res LA_temp(i)];
            LB_res = [LB_res LB_temp(i)];
        end
    end
    
    course.LB = LB_res';
    course.LA = LA_res';
    
    UB_temp = course.UB;
    UA_temp = course.UA;
    UB_res = [];
    UA_res = [];
    
    for i = 1:length(UB_temp)
        if ~isnan(UB_temp(i)) && ~isnan(UA_temp(i))
            UA_res = [UA_res UA_temp(i)];
            UB_res = [UB_res UB_temp(i)];
        end
    end
    
    course.UB = UB_res';
    course.UA = UA_res';
end