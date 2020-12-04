function R = createROI_groupBoundary(S)
% roiMask = createROI_groupBoundary(S)
% loads a group file with cluster indices
%S must contain:
% - roiDir: where group clusterized file lives 
% - roiFile: name of cluster file 
% - clustNumber: the index of the cluster of interest
% returns roiMask, which has 1's where the index is true, 0's otherwise 


%load group boundary
[maskROI,header]=BrikLoad([S.roiDir,S.roiFile],'matrix');

%pull out specified cluster from group boundary we loaded
R.roiMask = maskROI(:,:,:,2)==S.clustNumber;
R.nVox = sum(sum(sum(R.roiMask)));
R.roiSize = size(R.roiMask);

fprintf('\nloaded boundary for ROI file %s with %d voxels\n',S.roiFile,R.nVox)









