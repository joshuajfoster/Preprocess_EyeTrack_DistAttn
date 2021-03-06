function runEyeTrack
% run eye tracking preprocessing
%
% Inputs: 
% sn: subject number
% all details to change are specified in the function Settings/Settings_EyeTrack

%% setup directories
root = pwd; 
addpath([root,'/EyeTrack_Functions']) % add EyeTrack_Functions
addpath([root,'/Artifact_Functions']); % add Artifact_Functions
addpath([root,'/Settings/']); % add Settings

%% Print subject number
% fprintf('Subject:\t%d\n',sn)

%% load in the preprocessing settings
settings = Settings_EyeTrack;

%% convert the edf file to a mat file (and save)
edf_name = [settings.dir.raw_filename];
eye = edf2mat(settings.dir.raw_data_path,edf_name,settings.dir.processed_data_path);

%% preprocess eyetracking data and save file
eyeData = doEyeTracking(eye,settings);

%% save data
eyeData.settings = settings; % save settings to eyeData structure
save([settings.dir.processed_data_path,settings.dir.raw_filename,'_EYE_SEG.mat'],'eyeData')