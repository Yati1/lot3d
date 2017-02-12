% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 2218.712012186051700 ; 2217.294045682774100 ];

%-- Principal point:
cc = [ 1040.231809806729200 ; 1043.080983426513300 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ 0.019946512014260 ; -0.090852158351566 ; 0.004675714150999 ; 0.002842304802827 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 27.225291164845881 ; 27.298936779680524 ];

%-- Principal point uncertainty:
cc_error = [ 34.825152162745979 ; 35.951002875683919 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.045955759574137 ; 0.614024877716759 ; 0.006561343460179 ; 0.005670528144037 ; 0.000000000000000 ];

%-- Image size:
nx = 2048;
ny = 2048;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 6;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ 2.071972e+00 ; 1.696443e+00 ; 1.200374e+00 ];
Tc_1  = [ -1.331251e+02 ; 8.855891e+01 ; 4.845377e+03 ];
omc_error_1 = [ 1.921411e-02 ; 8.030447e-03 ; 2.115947e-02 ];
Tc_error_1  = [ 7.600602e+01 ; 7.850180e+01 ; 6.301536e+01 ];

%-- Image #2:
omc_2 = [ -2.210365e+00 ; -2.022540e+00 ; -6.908559e-01 ];
Tc_2  = [ -8.630079e+02 ; -1.137736e+03 ; 5.732142e+03 ];
omc_error_2 = [ 1.019272e-02 ; 1.340860e-02 ; 1.983068e-02 ];
Tc_error_2  = [ 9.189392e+01 ; 9.452716e+01 ; 7.425941e+01 ];

%-- Image #3:
omc_3 = [ -1.988613e+00 ; -1.956733e+00 ; -2.699860e-01 ];
Tc_3  = [ -3.144712e+02 ; -8.201157e+02 ; 4.887849e+03 ];
omc_error_3 = [ 1.084827e-02 ; 1.227213e-02 ; 2.033484e-02 ];
Tc_error_3  = [ 7.740104e+01 ; 7.976156e+01 ; 6.137554e+01 ];

%-- Image #4:
omc_4 = [ -2.008763e+00 ; -1.910238e+00 ; -6.894210e-01 ];
Tc_4  = [ -8.465829e+02 ; -5.851098e+02 ; 5.167380e+03 ];
omc_error_4 = [ 1.121054e-02 ; 1.453644e-02 ; 1.947522e-02 ];
Tc_error_4  = [ 8.158973e+01 ; 8.485179e+01 ; 6.723859e+01 ];

%-- Image #5:
omc_5 = [ -1.709624e+00 ; -1.855696e+00 ; -2.109894e-01 ];
Tc_5  = [ -5.559177e+02 ; -8.604899e+02 ; 5.607720e+03 ];
omc_error_5 = [ 1.197696e-02 ; 1.255793e-02 ; 1.889388e-02 ];
Tc_error_5  = [ 8.853168e+01 ; 9.142373e+01 ; 7.115823e+01 ];

%-- Image #6:
omc_6 = [ -1.947394e+00 ; -2.349338e+00 ; 4.871413e-01 ];
Tc_6  = [ -5.858609e+02 ; -1.017019e+03 ; 5.417764e+03 ];
omc_error_6 = [ 1.574440e-02 ; 1.056734e-02 ; 2.599606e-02 ];
Tc_error_6  = [ 8.620201e+01 ; 8.850701e+01 ; 6.546767e+01 ];

