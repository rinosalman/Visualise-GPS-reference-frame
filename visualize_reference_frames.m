%% Script to visualize data in your favourite reference frame
%% The data is in ITRF08 reference frame
%% Rishav Mallick, Nov 2017, Myanmar workshop
close all; clear all

%% Load data
% International boundaries
load countries_map.mat
% GPS velocities in ITRF08 (from Kreemer et al., 2014)
load GPS_ref.mat


%% Input
% option
% 0 = Plot velocites in ITRF08
% 1 = Plot velocities in different reference frame
% if inp_transform = 1, provide the pole parameters, see poles.IGS08.txt
inp_transform = 1;
latp = 32.35934;
lonp = 38.00460 ;
degmyr = 0.63025;


%% Computation
if inp_transform == 1

    [uEn,uNn] = pole_velocity(lat,lon,latp,lonp,degmyr);
    figure(1),clf
    plot(coastlines(:,1),coastlines(:,2),'k'),hold on
    % Plot velocities in ITRF2008 as red
    quiver(lon,lat,uE,uN,'color',[1 0 0]);hold on
    % Plot velocities of the reference plate as green
    quiver(lon,lat,uEn,uNn,'color',[0 1 0]);hold on
    % Plot velocities fixed to the reference plate as blue
    quiver(lon,lat,uE-uEn,uN-uNn,'color',[0 0 1]);hold on
    title('Global map of station velocities relative to reference frame defined by user','FontSize',15)
    xlabel('Longitude (\circ)')
    ylabel('Latitude (\circ)')
    axis tight, axis equal

else

    disp('Visualizing default velocities')
    figure(1),clf
    plot(coastlines(:,1),coastlines(:,2),'k'),hold on
    quiver(lon,lat,uE,uN,1)
    title('Global map of station velocities in ITRF2008','FontSize',15)
    xlabel('Longitude (\circ)')
    ylabel('Latitude (\circ)')
    axis tight, axis equal

end
