function floor=generateRest(floor,roomCount,floorRoomLimit,zeroGLimit,oneGLimit,twoGLimit)

% Figure out how many floorRows and floorCols
floorRows=max(size(floor(:,1)));
floorCols=max(size(floor(1,:)));

%%

%% Quick fix: while roomCount<floorRoomLimit

while roomCount < floorRoomLimit
    
% Check every tile
for irow=2:floorRows-1
    for icol=2:floorCols-1
        
        % If floor exceeds number of rooms
        if roomCount > floorRoomLimit
            % Exit loop
            break
        
        % IF TILE HAS VALUE OF 1
        elseif floor(irow,icol)==1
            tempValue=rand()*100;
            
            % ZERO
            if tempValue <= zeroGLimit 
                % Do nothing and make the one a two
                floor(irow,icol)=2;
                roomCount=roomCount+0;  % unneeded, but helps to understand
                
            % ONE ROOM
            elseif tempValue <= oneGLimit
                % SETUP FOR ONE ROOM
                tempiValue=randi(4);
                neighbors=[floor(irow+1,icol),floor(irow-1,icol),...
                           floor(irow,icol-1),floor(irow,icol+1)];
                if min(neighbors) == 0
                    while neighbors(tempiValue) ~= 0
                        tempiValue=randi(4);
                    end
                    switch tempiValue
                        case 1
                            floor(irow+1,icol)=1;
                            floor(irow,icol)=2;
                        case 2
                            floor(irow-1,icol)=1;
                            floor(irow,icol)=2;
                        case 3
                            floor(irow,icol-1)=1;
                            floor(irow,icol)=2;
                        otherwise
                            floor(irow,icol+1)=1;
                            floor(irow,icol)=2;
                    end
                    roomCount=roomCount+1;   % add one to total rooms
                else
                    % Do nothing except make the room a 2
                    % This always must happen even if no further room made
                    floor(irow,icol)=2;
                end
                tempiValue=0;  % Reset
                
            % TWO ROOMS
            elseif tempValue <= twoGLimit
                % SETUP FOR TWO ROOMS
                tempiValue=randi(4);
                tempiValue2=randi(4);
                while tempiValue==tempiValue2    % ensure they aren't the same
                    tempiValue2=randi(4);
                end
                neighbors=[floor(irow+1,icol),floor(irow-1,icol),... % -> <-
                           floor(irow,icol-1),floor(irow,icol+1)];   % ^  v
                neighborsSorted=sort(neighbors);
                
                % At least TWO open spots
                if neighborsSorted(1)==0 && neighborsSorted(2)==0
                    while neighbors(tempiValue) ~= 0 || neighbors(tempiValue2)~=0 || tempiValue == tempiValue2
                        tempiValue=randi(4);
                        tempiValue2=randi(4);
                    end
                    % First room
                    switch tempiValue
                        case 1
                            floor(irow+1,icol)=1;
                            floor(irow,icol)=2;
                        case 2
                            floor(irow-1,icol)=1;
                            floor(irow,icol)=2;
                        case 3
                            floor(irow,icol-1)=1;
                            floor(irow,icol)=2;
                        otherwise
                            floor(irow,icol+1)=1;
                            floor(irow,icol)=2;
                    end
                    % Second room
                    switch tempiValue2
                        case 1
                            floor(irow+1,icol)=1;
                            floor(irow,icol)=2;
                        case 2
                            floor(irow-1,icol)=1;
                            floor(irow,icol)=2;
                        case 3
                            floor(irow,icol-1)=1;
                            floor(irow,icol)=2;
                        otherwise
                            floor(irow,icol+1)=1;
                            floor(irow,icol)=2;
                    end
                    roomCount=roomCount+2;   % Always add two rooms
                    tempiValue=0;
                    tempiValue2=0;
                    
                % ONE open spot!
                elseif neighborsSorted(1)==0
                    while neighbors(tempiValue) ~= 0
                        tempiValue=randi(4);
                    end
                    % One room
                    switch tempiValue
                        case 1
                            floor(irow+1,icol)=1;
                            floor(irow,icol)=2;
                        case 2
                            floor(irow-1,icol)=1;
                            floor(irow,icol)=2;
                        case 3
                            floor(irow,icol-1)=1;
                            floor(irow,icol)=2;
                        otherwise
                            floor(irow,icol+1)=1;
                            floor(irow,icol)=2;
                    end
                    roomCount=roomCount+1;  % only add one
                    tempiValue=0;
                    tempiValue2=0;
                else
                    % NO OPEN SPOTS, no min = 0
                    % Do nothing except:
                    floor(irow,icol)=2;
                    roomCount=roomCount+0;
                end
                
                
            % THREE ROOMS    
            else
                % SETUP FOR THREE ROOMS
                tempiValue=randi(4);
                tempiValue2=randi(4);
                tempiValue3=randi(4);
                while tempiValue == tempiValue2 || tempiValue2 == tempiValue3 || tempiValue == tempiValue3
                    tempiValue=randi(4);
                    tempiValue2=randi(4);
                    tempiValue3=randi(4);
                end 
                % Sort neighbors
                neighbors=[floor(irow+1,icol),floor(irow-1,icol),... % -> <-
                    floor(irow,icol-1),floor(irow,icol+1)];   % ^  v
                neighborsSorted=sort(neighbors);
                
                % At least THREE open spots
                if neighborsSorted(1)==0 && neighborsSorted(2)==0 && neighborsSorted(3)==0
                    while neighbors(tempiValue)~=0||neighbors(tempiValue2)~=0||neighbors(tempiValue3)~=0||tempiValue==tempiValue2||tempiValue==tempiValue3||tempiValue2==tempiValue3
                        % Remake tempiValues if above is true
                        tempiValue=randi(4);
                        tempiValue2=randi(4);
                        tempiValue3=randi(4);
                    end
                    % Cases
                    % FIRST Room
                    switch tempiValue
                        case 1
                            floor(irow+1,icol)=1;
                            floor(irow,icol)=2;
                        case 2
                            floor(irow-1,icol)=1;
                            floor(irow,icol)=2;
                        case 3
                            floor(irow,icol-1)=1;
                            floor(irow,icol)=2;
                        otherwise
                            floor(irow,icol+1)=1;
                            floor(irow,icol)=2;
                    end
                    % SECOND room
                    switch tempiValue2
                        case 1
                            floor(irow+1,icol)=1;
                            floor(irow,icol)=2;
                        case 2
                            floor(irow-1,icol)=1;
                            floor(irow,icol)=2;
                        case 3
                            floor(irow,icol-1)=1;
                            floor(irow,icol)=2;
                        otherwise
                            floor(irow,icol+1)=1;
                            floor(irow,icol)=2;
                    end
                    % THIRD room
                    switch tempiValue3
                        case 1
                            floor(irow+1,icol)=1;
                            floor(irow,icol)=2;
                        case 2
                            floor(irow-1,icol)=1;
                            floor(irow,icol)=2;
                        case 3
                            floor(irow,icol-1)=1;
                            floor(irow,icol)=2;
                        otherwise
                            floor(irow,icol+1)=1;
                            floor(irow,icol)=2;
                    end
                    roomCount=roomCount+3;   % add three
                    tempiValue=0;
                    tempiValue2=0;
                    tempiValue3=0;  % resets...
                    
                % At least TWO open spots
                elseif neighborsSorted(1)==0 && neighborsSorted(2)==0
                    while neighbors(tempiValue) ~= 0 || neighbors(tempiValue2)~=0 || tempiValue == tempiValue2
                        tempiValue=randi(4);
                        tempiValue2=randi(4);
                    end 
                    % First room
                    switch tempiValue
                        case 1
                            floor(irow+1,icol)=1;
                            floor(irow,icol)=2;
                        case 2
                            floor(irow-1,icol)=1;
                            floor(irow,icol)=2;
                        case 3
                            floor(irow,icol-1)=1;
                            floor(irow,icol)=2;
                        otherwise
                            floor(irow,icol+1)=1;
                            floor(irow,icol)=2;
                    end
                    % Second room
                    switch tempiValue2
                        case 1
                            floor(irow+1,icol)=1;
                            floor(irow,icol)=2;
                        case 2
                            floor(irow-1,icol)=1;
                            floor(irow,icol)=2;
                        case 3
                            floor(irow,icol-1)=1;
                            floor(irow,icol)=2;
                        otherwise
                            floor(irow,icol+1)=1;
                            floor(irow,icol)=2;
                    end
                    roomCount=roomCount+2;   % Always add two rooms
                    tempiValue=0;
                    tempiValue2=0;
                    
                % ONE open spot!
                elseif neighborsSorted(1)==0
                    while neighbors(tempiValue) ~= 0
                        tempiValue=randi(4);
                    end
                    % One room
                    switch tempiValue
                        case 1
                            floor(irow+1,icol)=1;
                            floor(irow,icol)=2;
                        case 2
                            floor(irow-1,icol)=1;
                            floor(irow,icol)=2;
                        case 3
                            floor(irow,icol-1)=1;
                            floor(irow,icol)=2;
                        otherwise
                            floor(irow,icol+1)=1;
                            floor(irow,icol)=2;
                    end
                    roomCount=roomCount+1;  % only add one
                    tempiValue=0;
                    tempiValue2=0;
                else
                    % NO OPEN SPOTS, no min = 0
                    % Do nothing except:
                    floor(irow,icol)=2;
                    roomCount=roomCount+0;
                    
                    % End of code for attempted 3, but no spots open at all
                end
                % End of code for when THREE rooms are ATTEMPTED to spawn
            end 
            % End of code for IF tile == 1, anything that follows this
            %     will be carried out if tile == 1
            
        else
            % ELSE, if the tile ~= 1, do nothing currently
            % This can be edited later
        end 
        
        % End of code for one cell or irow,icol (any value)
        % Ends of FOR Loops:
    end 
end 

end % FOR CHEATER WHILE LOOP

%  ~~~~~~~~~~~~~~




% Now, once the number of rooms has exceeded room number, the following
%    code is executed

%% Check for any loose 1's:

for irow=2:floorRows-1
    for icol=2:floorCols-1
        if floor(irow,icol) == 1    % if a 1
            floor(irow,icol)=2;     % make it a two
        end 
    end 
end

%% End of generateRest function

% Have not implemented other rooms, especially the all important exit room

% Author: Matt Phelps, 2/23/17



