function floor = generateRest_bossRoom2(floor,floorRows,floorCols,valueR,valueC)
% Matt Phelps, 3/5/17

%% Look for possible branch points

bPot=0; % Initialize number of boss potentials

for irow=2:floorRows+1
    for icol=2:floorCols+1
        % Must make a new space
        if floor(irow,icol)==0
        room=[0 0 0 0];
        adj=[floor(irow,icol+1),floor(irow,icol-1),...
             floor(irow-1,icol),floor(irow+1,icol)]; % adj=adjacent rooms
        for it=1:4
            switch adj(it)
                case 0 
                    room(it)=false;
                case 2 
                    room(it)=true;
                case 3
                    room(it)=false; 
                case 4 
                    room(it)=true;
                case 5 
                    room(it)=true; % cannot border treasure
                case 6 
                    room(it)=false; % can border wall
                case 7 
                    room(it)=true; % placeholder
                case 8 
                    room(it)=true; % cannot border start
                case 9 
                    room(it)=true;
                otherwise
                    room(it)=true;
            end
        end
        % Complicated Logic to check if and only if one of the four room
        % checks is true. All other three must be false for onlyOneRoom 
        check1=xor(xor(room(1),room(2)),xor(room(3),room(4)));
        check2=and(or(room(1),room(2)),or(room(3),room(4)));
        onlyOneRoom=(check1==1 && check2==0);
        if onlyOneRoom 
            bPot=bPot+1;
            floor(irow,icol)=3; % potential boss room (4)
            potentialBoss{bPot,1}=[irow,icol]; % column 1 = coordinates
        end
        end
    end
end
% NOW, ALL POTENTIAL BOSS ROOMS HAVE BEEN FOUND AND GIVEN THE VALUE 3

%% Add distance from origin to potentialBoss column 2, find max dist


% Initialize max distance and max coordinates
maxDist=0;
maxRow=1;
maxCol=1;

for it=1:bPot
    % Column 2 (calculate via pythagorean theorem sqrt((x2-x1)^2+(y2-y1)^2)
    potentialBoss{it,2}=sqrt((potentialBoss{it,1}(1)-valueR)^2 ... % rowPoint - rowStart
                        +(potentialBoss{it,1}(2)-valueC)^2);       % colPoint - colStart
    % If bigger 
    if potentialBoss{it,2} >= maxDist
        maxDist=potentialBoss{it,2}; 
        maxRow=potentialBoss{it,1}(1); maxCol=potentialBoss{it,1}(2);
    end
end

%% Get rid of 3's

for irow=2:floorRows+1
    for icol=2:floorCols+1
        if floor(irow,icol)==3
            floor(irow,icol)=0;
        end
    end
end

%% Add boss room and exit room

% Add BOSS, value of 4? and add exit room, value of 3?
floor(maxRow,maxCol)=3;        % remember, maxRow and maxCol and max distance 
                               % for a potential boss away from start
% ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
% Now, determine where to branch off to for EXIT:
% UPPER LEFT exit
if maxRow-valueR < 0 && maxCol-valueC <= 0 
    tempiValue=randi(2);
    switch tempiValue 
        case 1 ; floor(maxRow-1,maxCol)=4;
        case 2 ; floor(maxRow,maxCol-1)=4; 
    end
% BOTTOM RIGHT exit
elseif maxRow-valueR >= 0 && maxCol-valueC > 0
    tempiValue=randi(2);
    switch tempiValue 
        case 1 ; floor(maxRow+1,maxCol)=4;
        case 2 ; floor(maxRow,maxCol+1)=4; 
    end   
% UPPER RIGHT exit
elseif maxRow-valueR < 0 && maxCol-valueC > 0
    tempiValue=randi(2);
    switch tempiValue 
        case 1 ; floor(maxRow-1,maxCol)=4;
        case 2 ; floor(maxRow,maxCol+1)=4; 
    end
% BOTTOM LEFT exit
elseif maxRow-valueR >= 0 && maxCol-valueC <= 0
    tempiValue=randi(2);
    switch tempiValue 
        case 1 ; floor(maxRow+1,maxCol)=4;
        case 2 ; floor(maxRow,maxCol-1)=4; 
    end
else disp('Something went wrong') % Should never happen. 
end
clear tempiValue

%% End of code

    
























        
