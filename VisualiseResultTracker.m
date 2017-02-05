close all
clc;


%stores info about the dataset [numInsects,UNKNOWN (starting image seq?),numFrames]
Datasets = [  5,2,1001;
             10,2,1001;%10,2,1001; % this I think corresponds to 10 insects
             20,2,1001;
             40,2,1001;
             80,2,1001;
            160,2,1001];  
ds = 2;
StartImageSeq = Datasets(ds,2);
outputFile = './conf_simu10_results/d3TrackingData_010_t1000.mat';
inputDatasetPath = 'conf_simu010';
load (sprintf('conf_simu%03d\\stereoModel.mat', Datasets(ds, 1)));
load(outputFile)

figPath = './conf_simu10_results/figures'; 
mkdir(figPath);

n = StartImageSeq+1;
for v=1:stTrackingParameter.numCamera
    I1 = imread(sprintf('%s\\cam%d\\im%d%03d.jpg',inputDatasetPath,v,v,n)); %I1 = im2double(I1); 
    tm0Frame.cams(v).image = I1;
    tm0Frame.cams(v).regions = GetMeasurement(tm0Frame.cams(v).image);
end  
tm1Frame = tm0Frame; clear tm0Frame
for n=StartImageSeq+2 :  Datasets(ds,3)
    t = n-StartImageSeq+1; 
    display(['tracking image ',num2str(n),' at time ',num2str(t)]);
    %------------------------------------------------------
    for v = 1 : stTrackingParameter.numCamera
        I1 = imread(sprintf('%s\\cam%d\\im%d%03d.jpg',inputDatasetPath,v,v,n));
        tm0Frame.cams(v).image = I1;
        tm0Frame.cams(v).regions = GetMeasurement(tm0Frame.cams(v).image);     
    end   
    %------------------------------ 
    
    %figure(1);
    figure('units','normalized','position',[.1 .1 1.0 1.0])
    tm0Locations = []; tm1Locations = [];
    disp(sprintf('Plotting %d trackers at %d',length(trackers),n));
    for i = 1 : length(trackers)
        if trackers(i).start <= n && trackers(i).end > n
            warning(sprintf('%d < %d',(size(trackers(i).states,2)+trackers(i).start),n))
            if (size(trackers(i).states,2)+trackers(i).start) > n
                warning(sprintf('1 + (%d - %d) = %d',n,trackers(i).start,1 + (n - trackers(i).start)))
                tm0Locations = [tm0Locations, trackers(i).states(1:3,1 + (n - trackers(i).start))];
            end
        end
    end
    for v = 1 : stTrackingParameter.numCamera
        subplot(2,stTrackingParameter.numCamera,v); imshow(tm0Frame.cams(v).image);
        for m = 1 : length(tm0Frame.cams(v).regions)
            DrawEllipseWithAxis(tm0Frame.cams(v).regions(m).ellipse, '-g');
        end    
        title(['t-0, v:',num2str(v)]);
        d2Locations = stStereoModel.cams(v).projection * [tm0Locations; ones(1, size(tm0Locations, 2))];
        d2Locations(1:2, :) = d2Locations(1:2, :) ./ repmat(d2Locations(3, :), 2, 1); 
        plot(d2Locations(1, :), d2Locations(2, :), 'or', 'markersize', 5);

        subplot(2,stTrackingParameter.numCamera,stTrackingParameter.numCamera+v); imshow(tm1Frame.cams(v).image); 
        for m = 1 : length(tm1Frame.cams(v).regions)
            DrawEllipseWithAxis(tm1Frame.cams(v).regions(m).ellipse, '-g');
        end          
%         title(['t-1, v:',num2str(v)]);
%         d2Locations = stStereoModel.cams(v).projection * [tm1Locations; ones(1, size(tm1Locations, 2))];
%         d2Locations(1:2, :) = d2Locations(1:2, :) ./ repmat(d2Locations(3, :), 2, 1); 
%         plot(d2Locations(1, :), d2Locations(2, :), 'or', 'markersize', 5);      
    end
    %return;
    pause(0.1);
    saveas(gcf,sprintf('%s/%d.jpg',figPath,n));
    close all;
    tm1Frame = tm0Frame; clear tm0Frame;
end
