%% Cool Color Generator
% Generates aesthetically pleasing colors for tiles. 15 Options!
% Author: Olivia Wang

clear
clc
clf % clear figure on each run so that multiple figures aren't created each time

rng('shuffle')
colorchoice = randi(15);  % Generates random number between 1-15

switch colorchoice
    case 1
        % Gray
        color1 = .69595;
        color2 = .69989;
        color3 = .63853;
    case 2
        % Light Green
        color1 = .45742;
        color2 = .87537;
        color3 = .51805;
    case 3
        % Light Pink
        color1 = .94362;
        color2 = .63771;
        color3 = .95769;
    case 4
        % Magenta
        color1 = .47136;
        color2 = .035763;
        color3 = .17587;
    case 5
        % Gray-ish blue
        color1 = .58225;
        color2 = .54074;
        color3 = .86994;
    case 6
        % Light blue
        color1 = .62790;
        color2 = .77198;
        color3 = .93285;
    case 7
        % Sky blue
        color1 = .39346;
        color2 = .67143;
        color3 = .74126;
    case 8
        % Yellow
        color1 = .91669;
        color2 = .98895;
        color3 = .54318;
    case 9
        % Red
        color1 = .534060;
        color2 = .089951;
        color3 = .11171;
    case 10
        % Green-blue
        color1 = .13629;
        color2 = .67865;
        color3 = .49518;
    case 11
        % Turquoise
        color1 = .13358;
        color2 = .95196;
        color3 = .88287;
    case 12
        % Rose
        color1 = .94894;
        color2 = .37362;
        color3 = .39651;
    case 13
        % Dark blue
        color1 = .031913;
        color2 = .19474;
        color3 = .41255;
    case 14
        % Another green-blue
        color1 = .19544;
        color2 = .83848;
        color3 = .60949;
    case 15
        color1 = .80725;
        color2 = .64931;
        color3 = .99882;
    otherwise
end
    

figure('Color',[color1 color2 color3]);

