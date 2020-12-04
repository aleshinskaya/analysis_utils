function [clusterMask]= checkContiguity (brainData,brainInfo,thresh)

%takes a vector representing the voxels in a tal brain (brainData) and header (brainInfo); expects a matrix!

%finds the voxel with maximal amplitude and then locates all voxels that are adjascent to it and that pass threshold; 
%returns a binary mask 



%vectorsize
brainSize = size(brainData);
vecSize = brainSize(1)*brainSize(2)*brainSize(3);

%turn into vector to find unique max point
vBrain=reshape(brainData,[vecSize,1]);

[peakVal,peakVox]= max(vBrain);

%now go back to matrix coordss
[aa,bb,cc] = ind2sub(brainSize,peakVox);
v=[aa,bb,cc];
% 
% %first, find max (peak) location as vector index... 
% [val1,index1]=max(brainData(:,:,:));
% [val2,index2]=max(val1);
% [val3,index3]=max(val2);
% 
% v(2)=  index2(index3);
% v(3) = index3;
% [v(1),j,k]=find(brainData==val3);
%fprintf('centerpoint is %d  %d  %d',v)

%convert the vector index into tal coordinates
%[err,XYZ] = AFNI_Index2XYZcontinuous (Indx, loc_info, [])


%make a mask where every >thresh voxel that is adjascent gets a 1
global clusterMask;

clusterMask = zeros(size(brainData));


checkNeighbourhood(brainData,v,thresh);
		

end


%v should be a 3-item matrix of coordinates from which to start
function checkNeighbourhood(data,v,thresh)
	global clusterMask 

		neighbours = [];
		for k=1:3
		for l=1:3
		for m=1:3
		options = [0,1,-1];
		neighbours = [neighbours;v+[options(k),options(l),options(m)]];

		end
		end
		end
			
	      %loop through every adjascent point
		for i=1:length(neighbours)
			v = neighbours(i,:);
			if(any(v<=0) | any(v>size(data)) | clusterMask(v(1),...
			   v(2),v(3))==1);
				%don't test points that don't exist
			else
				curPoint = data(v(1),v(2),v(3));
			
				if(curPoint>thresh)
					%this point passes...
					%disp('pass!')
					%reset fail to not-fail
					%fail = 0;
					%set clusterMask point to 1
					clusterMask(v(1),v(2),v(3))=1;
				  %run function from this as center coordinate
			              checkNeighbourhood(data,v,thresh);
				end
			end
		
		end


end


%last parameter is 1 if data is loaded as a vector; 3 if matrix
%[err,Indx] = AFNI_XYZcontinuous2Index (XYZmm, loc_nfo, [], 1)

%XYZ=[-34 58 16]
%XYZ=[-34 55 19]
%XYZ=[-39 58 16]
%XYZ=[-34 58 22]
%[err,Indx] = AFNI_XYZcontinuous2Index (XYZ, loc_info, [], 3)
%index = Indx+1

