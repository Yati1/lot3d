
These raw codes have invoked functions provided by "Machine Vision Toolbox".
Readers can download the toolbox from http://www.petercorke.com/Toolbox_software.html.
We assume readers have installed the toolbox correctly. Or copy files in the "external" folder to the "lot3d" folder.


1. open Matlab (version 2011a) in Windows 7 ultimate.

2. open "demoTrackingSimu.m"

3. run

=====================================================================
Demo extra info
=====================================================================
The demo data provided inside "simu10" only contain the data for a test with 10 flies
The other test data has not been provided

=====================================================================
Output structure
=====================================================================
The demo will process the files in the simu10/cam folders. There are 1002 frames in each folder.
The first 2 frames out of this 1002 frames are used to initialize the tracker.
The demo will process the remaining 1000 frames and store the results in a variable called 'trackers'.
'trackers' is output every 100 frames
'trackers' is structured like this:

trackers has many rows and 10 fields (columns). The 'states' field contains the 3D locations and orientation on the targets.
What each row represents is unclear. Maybe each row is a tracker initialized at the frame numbered in the 'start' field and
ended in the 'end' field.

'states' appears to contain the position and orientation info for one fly for a number of frames
The 'states' structure:
>   has 8 rows and numFrames column.
>   Rows 1-3 is the current frame's position
>   Rows 4-5 is the current frame's orientation
>   Rows 6-8 is the previous frame's position

======================================================================
Ground truth info
======================================================================
The ground truth for the demo can be found in 'simu10/trajectories010.mat'.
It contains the 3D positions, orientations and velocities of the 10 simulated flies.

======================================================================
Info about resultOrientation and resultLocation
======================================================================
These plot graphs.

resultLocation seems to have hard coded results in lines 150~153 that are shown on the plot.
The MOTA and MOTP of the demo output is just printed to console  
