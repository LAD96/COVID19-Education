clear all;
close all;

%% GENERAL INFORMATION
% This code calculates the correlation of all courses' liking and
% understanding as filled in by the students in the questionnaire.

%% INITIALISATION
% Read the table
Tab = readtable('UL_matlab.xlsx');
Tab(:,1) = [];

%% ORGANISATION
% Chemistry
COURSE.SK.LB = table2array(Tab(:,1));
COURSE.SK.LA = table2array(Tab(:,2));
COURSE.SK.UB = table2array(Tab(:,3));
COURSE.SK.UA = table2array(Tab(:,4));
COURSE.SK    = removeNAN(COURSE.SK);

% Economics
COURSE.EC.LB = table2array(Tab(:,5));
COURSE.EC.LA = table2array(Tab(:,6));
COURSE.EC.UB = table2array(Tab(:,7));
COURSE.EC.UA = table2array(Tab(:,8));
COURSE.EC    = removeNAN(COURSE.EC);

% German
COURSE.DU.LB = table2array(Tab(:,9));
COURSE.DU.LA = table2array(Tab(:,10));
COURSE.DU.UB = table2array(Tab(:,11));
COURSE.DU.UA = table2array(Tab(:,12));
COURSE.DU    = removeNAN(COURSE.DU);

% Physics
COURSE.NA.LB = table2array(Tab(:,13));
COURSE.NA.LA = table2array(Tab(:,14));
COURSE.NA.UB = table2array(Tab(:,15));
COURSE.NA.UA = table2array(Tab(:,16));
COURSE.NA    = removeNAN(COURSE.NA);

% Mathematics
COURSE.WI.LB = table2array(Tab(:,17));
COURSE.WI.LA = table2array(Tab(:,18));
COURSE.WI.UB = table2array(Tab(:,19));
COURSE.WI.UA = table2array(Tab(:,20));
COURSE.WI    = removeNAN(COURSE.WI);

% Dutch
COURSE.NE.LB = table2array(Tab(:,21));
COURSE.NE.LA = table2array(Tab(:,22));
COURSE.NE.UB = table2array(Tab(:,23));
COURSE.NE.UA = table2array(Tab(:,24));
COURSE.NE    = removeNAN(COURSE.NE);

% English
COURSE.EN.LB = table2array(Tab(:,25));
COURSE.EN.LA = table2array(Tab(:,26));
COURSE.EN.UB = table2array(Tab(:,27));
COURSE.EN.UA = table2array(Tab(:,28));
COURSE.EN    = removeNAN(COURSE.EN);

% French
COURSE.FA.LB = table2array(Tab(:,29));
COURSE.FA.LA = table2array(Tab(:,30));
COURSE.FA.UB = table2array(Tab(:,31));
COURSE.FA.UA = table2array(Tab(:,32));
COURSE.FA    = removeNAN(COURSE.FA);

% Art
COURSE.TE.LB = table2array(Tab(:,33));
COURSE.TE.LA = table2array(Tab(:,34));
COURSE.TE.UB = table2array(Tab(:,35));
COURSE.TE.UA = table2array(Tab(:,36));
COURSE.TE    = removeNAN(COURSE.TE);

% History
COURSE.GS.LB = table2array(Tab(:,37));
COURSE.GS.LA = table2array(Tab(:,38));
COURSE.GS.UB = table2array(Tab(:,39));
COURSE.GS.UA = table2array(Tab(:,40));
COURSE.GS    = removeNAN(COURSE.GS);

% Geography
COURSE.AK.LB = table2array(Tab(:,41));
COURSE.AK.LA = table2array(Tab(:,42));
COURSE.AK.UB = table2array(Tab(:,43));
COURSE.AK.UA = table2array(Tab(:,44));
COURSE.AK    = removeNAN(COURSE.AK);

% Latin
COURSE.LA.LB = table2array(Tab(:,45));
COURSE.LA.LA = table2array(Tab(:,46));
COURSE.LA.UB = table2array(Tab(:,47));
COURSE.LA.UA = table2array(Tab(:,48));
COURSE.LA    = removeNAN(COURSE.LA);

% Greek
COURSE.GR.LB = table2array(Tab(:,49));
COURSE.GR.LA = table2array(Tab(:,50));
COURSE.GR.UB = table2array(Tab(:,51));
COURSE.GR.UA = table2array(Tab(:,52));
COURSE.GR    = removeNAN(COURSE.GR);

%% RANKING
% First the ranking is generated according to the Spearman algorithm with
% ties.

course_list = fieldnames(COURSE);
result = ["Course" "Liking Corr" "Liking Sign" "Understanding Corr" "Understanding Sign"];

for i = 1:length(course_list)
    course_str = string(course_list(i));
    switch course_str
        case "SK"
            course = COURSE.SK;
        case "EC"
            course = COURSE.EC;
        case "DU"
            course = COURSE.DU;
        case "NA"
            course = COURSE.NA;
        case "WI"
            course = COURSE.WI;
        case "NE"
            course = COURSE.NE;
        case "EN"
            course = COURSE.EN;
        case "FA"
            course = COURSE.FA;
        case "TE"
            course = COURSE.TE;
        case "GS"
            course = COURSE.GS;
        case "AK"
            course = COURSE.AK;
        case "LA"
            course = COURSE.LA;
        case "GR"
            course = COURSE.GR;
        otherwise
            break;
    end
    
    [rL, pL] = corr(course.LB, course.LA, 'Type', 'Pearson');
    [rU, pU] = corr(course.UB, course.UA, 'Type', 'Pearson');
    
    result = [result; course_str rL pL rU pU];
end






