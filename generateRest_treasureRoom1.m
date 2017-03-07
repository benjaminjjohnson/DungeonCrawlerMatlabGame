function floor = generateRest_treasureRoom1(floor,numTreasure,floorRows,floorCols)

%%
%% SECTION 1: Treasure Room ; Value of 5

% Criteria: Once generation has occured, the map can add a treasure room
% Treasure room has only one entrance!

rng('shuffle')
% Initialize has1Entrace
has1Entrance=false;

%% Assign random direction to search from

% Repeat for number of treasure rooms
for i=1:numTreasure
        
    % Choose one of four directions (represented with either 1,2,3,4)
    tempiValue=randi(8);
    
    switch tempiValue
        % SCAN FROM LEFT SIDE (SCROLL UP) TO CENTER 
        case 1
            for icol=2:1:floorCols-1
                for irow=floorRows-1:-1:2
                        if ~has1Entrance
                        [floor,has1Entrance]=checkFor1Two(floor,irow,icol);
                        end
                end
            end
        % SCAN FROM LEFT SIDE (SCROLL DOWN) TO CENTER
        case 2
            for icol=2:1:floorCols-1
                for irow=2:1:floorRows-1
                        if ~has1Entrance
                        [floor,has1Entrance]=checkFor1Two(floor,irow,icol);
                        end
                end
            end
        % SCAN FROM RIGHT SIDE (SCROLL UP) TO CENTER
        case 3
            for icol=floorCols-1:-1:2
                for irow=floorRows-1:-1:2
                        if ~has1Entrance
                        [floor,has1Entrance]=checkFor1Two(floor,irow,icol);
                        end
                end
            end
        % SCAN FROM RIGHT SIDE (SCROLL DOWN) TO CENTER
        case 4
            for icol=floorCols-1:-1:2
                for irow=2:1:floorRows-1
                        if ~has1Entrance
                        [floor,has1Entrance]=checkFor1Two(floor,irow,icol);
                        end
                end
            end
        % SCAN FROM TOP SIDE (SCROLL RIGHT) TO CENTER
        case 5
            for irow=2:1:floorRows-1
                for icol=2:1:floorCols-1
                        if ~has1Entrance
                        [floor,has1Entrance]=checkFor1Two(floor,irow,icol);
                        end
                end
            end
        % SCAN FROM TOP SIDE (SCROLL LEFT) TO CENTER
        case 6
            for irow=2:1:floorRows-1
                for icol=floorCols-1:-1:2
                        if ~has1Entrance
                        [floor,has1Entrance]=checkFor1Two(floor,irow,icol);
                        end
                end
            end
        % SCAN FROM BOTTOM SIDE (SCROLL RIGHT) TO CENTER
        case 7 
            for irow=floorRows-1:-1:2
                for icol=2:1:floorCols-1
                        % checkFor1Two function
                        if ~has1Entrance
                        [floor,has1Entrance]=checkFor1Two(floor,irow,icol);
                        end
                end
            end
        % SCAN FROM BOTTOM SIDE (SCROLL LEFT) TO CENTER
        case 8
            for irow=floorRows-1:-1:2
                for icol=floorCols-1:-1:2
                        % checkFor1Two function
                        if ~has1Entrance
                        [floor,has1Entrance]=checkFor1Two(floor,irow,icol);
                        end
                end
            end
        % End of switch        
    end
    % Initialize has1Entrance back to false so it continues above
    has1Entrance=false;
end

    
end % function end

%% Check for one entrance only - function checkFor1Two

function [floor,has1Entrance] = checkFor1Two(floor,irow,icol)

% Assign values of right,left,below,above, and point
right=floor(irow,icol+1);
left=floor(irow,icol-1);
below=floor(irow+1,icol);
above=floor(irow-1,icol);

% The value of floor(irow,icol)
point=floor(irow,icol);

% Initialize has1Entrance
has1Entrance=false;

% CHECK IF TREASURE ROOM CAN SPAWN
% Criteria: only one bordering 2
% RIGHT
if point==2&&(left==0||left==6)&&(below==0||below==6)&&(above==0||above==6)
    % Found appropriate spot. Add room at that point.
    floor(irow,icol)=5;
    has1Entrance=true;
% LEFT
elseif point==2&&(right==0||right==6)&&(below==0||below==6)&&(above==0||above==6)
    % Found appropriate spot. Add room at that point.
    floor(irow,icol)=5;
    has1Entrance=true;
% BELOW
elseif point==2&&(right==0||right==6)&&(left==0||left==6)&&(above==0||above==6)
    % Found appropriate spot. Add room at that point.
    floor(irow,icol)=5;
    has1Entrance=true;
% ABOVE
elseif point==2&&(right==0||right==6)&&(below==0||below==6)&&(left==0||left==6)
    % Found appropriate spot. Add room at that point.
    floor(irow,icol)=5;
    has1Entrance=true;
else
    has1Entrance=false;
end

end % End to function












