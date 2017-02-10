%stores info about the dataset [numInsects,UNKNOWN (starting image seq?),numFrames]
Datasets = [  5,2,1001;
             10,2,1001;%10,2,1001; % this I think corresponds to 10 insects
             20,2,1001;
             40,2,1001;
             80,2,1001;
            160,2,1001];  
ds = 2;
StartImageSeq = Datasets(ds,2);
outputDir = './conf_simu10_results/grids'
outputFile = './conf_simu10_results/d3TrackingData_010_t1000.mat';
load(outputFile);
totalTimeFrames = 1000;
grid_size = [31 31 31];

% Uncomment below to measure bounding box for 3d points
points = [];
for t=1: length(trackers)
    points = [points trackers(t).states(1:3, :)];
end
maxZ = max(points(3,:))
minZ = min(points(3,:))
maxY = max(points(2,:))
minY = min(points(2,:))
maxX = max(points(1,:))
minX = min(points(1,:))
%box = boundingBox(points)
[Z,edges_X] = discretize([minX maxX],31);
[Z,edges_Y] = discretize([minY maxY],31);
[Z,edges_Z] = discretize([minX maxX],31);
for n=1: totalTimeFrames
    grid = zeros(grid_size);
    for i = 1 : length(trackers)
        if trackers(i).start <= n && trackers(i).end > n
            warning(sprintf('%d < %d',(size(trackers(i).states,2)+trackers(i).start),n))
            if (size(trackers(i).states,2)+trackers(i).start) > n
                warning(sprintf('1 + (%d - %d) = %d',n,trackers(i).start,1 + (n - trackers(i).start)))
                tm0Locations = trackers(i).states(1:3,1 + (n - trackers(i).start));
                % the lua file uses y x z
                disp(i)
                disp(tm0Locations);
                x=uint32(discretize(tm0Locations(1),edges_X))+1;
                y=uint32(discretize(tm0Locations(2),edges_Y))+1;
                z=uint32(discretize(tm0Locations(3),edges_Z))+1;
                disp(sprintf('%d %d %d',x,y,z))
                grid(y,x,z) = 1;  
            end
        end
    end
    disp(sprintf('Frame %d',n));
    save(sprintf('%s/%d.mat',outputDir,n),'grid');
end
