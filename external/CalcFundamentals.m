I = {};
I{1} = rgb2gray(imread('./fundamentalCalib/cam1_1.jpg'));
I{2} = rgb2gray(imread('./fundamentalCalib/cam2_1.jpg'));
I{3} = rgb2gray(imread('./fundamentalCalib/cam3_1.jpg'));

points = {};
points{1} = detectSURFFeatures(I{1});
points{2} = detectSURFFeatures(I{2});
points{3} = detectSURFFeatures(I{3});

features= {};
valid_points = {};
[features{1},valid_points{1}] = extractFeatures(I{1},points{1});
[features{2},valid_points{2}] = extractFeatures(I{2},points{2});
[features{3},valid_points{3}] = extractFeatures(I{3},points{3});

indexPairs = {};
indexPairs{1} = matchFeatures(features{1},features{2});
indexPairs{2} = matchFeatures(features{2},features{3});
indexPairs{3} = matchFeatures(features{1},features{3});

matchedPoints = {};

matchedPoints{1}= {};
matchedPoints{1}{1} = valid_points{1}(indexPairs{1}(:,1),:);
matchedPoints{1}{2} = valid_points{2}(indexPairs{1}(:,2),:);
figure; showMatchedFeatures(I{1},I{2},matchedPoints{1}{1},matchedPoints{1}{2});

matchedPoints{2}= {};
matchedPoints{2}{1} = valid_points{2}(indexPairs{2}(:,1),:);
matchedPoints{2}{2} = valid_points{3}(indexPairs{2}(:,2),:);
figure; showMatchedFeatures(I{2},I{3},matchedPoints{2}{1},matchedPoints{2}{2});

matchedPoints{3}= {};
matchedPoints{3}{1} = valid_points{1}(indexPairs{3}(:,1),:);
matchedPoints{3}{2} = valid_points{3}(indexPairs{3}(:,2),:);
figure; showMatchedFeatures(I{1},I{3},matchedPoints{3}{1},matchedPoints{3}{2});


fRANSAC1 = estimateFundamentalMatrix(matchedPoints{1}{1},...
    matchedPoints{1}{2},'Method','RANSAC',...
    'NumTrials',2000,'DistanceThreshold',1e-4)

fRANSAC2 = estimateFundamentalMatrix(matchedPoints{2}{1},...
    matchedPoints{2}{2},'Method','RANSAC',...
    'NumTrials',2000,'DistanceThreshold',1e-4)

fRANSAC3 = estimateFundamentalMatrix(matchedPoints{3}{1},...
    matchedPoints{3}{2},'Method','RANSAC',...
    'NumTrials',2000,'DistanceThreshold',1e-4)

save('./fundamentalCalib/cam1_cam2Fundamental.mat','fRANSAC1');
save('./fundamentalCalib/cam2_cam3Fundamental.mat','fRANSAC2');
save('./fundamentalCalib/cam1_cam3Fundamental.mat','fRANSAC3');