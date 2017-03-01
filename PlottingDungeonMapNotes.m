%% Plotting Dungeon Map Notes

% Notes!

% Starting point should probably be in middle ninth of map
% This means if width is positions 2-13 and height is positions 2-10,
%     the start room should be in the middle third of both of these ranges:
%     range for width  =  6-9 
%     range for height =  5-8

%% Naming convention

% oneALimit = one (room) Assign Limit (when assigning start)
% oneGLimit = one (room) Generate Limit (when generating rest)

%% Values for rooms in array

% Starting point value = 8

% Outer wall = 6 (where there are no rooms, used for floor generation)
% Normal rooms value = 2
% Normal room being generated = 1
% Exit = 4
% Treasure = 5
%     has only one entrance, uses function generateRest_treasureRoom#
% Shop = 7