function [player,enemy]=whichClass(pCharacter,eCharacter)

%This function loads the stats for the various PC types and enemy types in
%the game

switch pCharacter
    case 1
        %Loads stats for PC Knight
        player=load('knightStats');
        variables=fields(player);
        player=player.(variables{1});
    case 2
        %Loads stats for PC Sorcerer
        player=load('sorcererStats');
        variables=fields(player);
        player=player.(variables{1});
    case 3
        %Loads stats for PC thief
        player=load('thiefStats');
        variables=fields(player);
        player=player.(variables{1});
end

switch eCharacter
    case 1
        %Loads stats for enemy zombie
        enemy=load('zombieStats');
        variables=fields(enemy);
        enemy=enemy.(variables{1});
    case 2
        %Loads stats for enemy mercenary
        enemy=load('mercenaryStats');
        variables=fields(enemy);
        enemy=enemy.(variables{1});
    case 3
        %Loads stats for enemy ogre
        enemy=load('ogreStats');
        variables=fields(enemy);
        enemy=enemy.(variables{1});
    case 4
        %Loads stats for enemy parakeet
        enemy=load('parakeetStats');
        variables=fields(enemy);
        enemy=enemy.(variables{1});
    case 5
        %Loads stats for enemy carp
        enemy=load('carpStats');
        variables=fields(enemy);
        enemy=enemy.(variables{1});
    case 6
        %Loads stats for enemy pig
        enemy=load('pigStats');
        variables=fields(enemy);
        enemy=enemy.(variables{1});
    case 7
        %Loads stats for enemy whale
        enemy=load('whaleStats');
        variables=fields(enemy);
        enemy=enemy.(variables{1});
    case 8
        %Loads stats for enemy dragon
        enemy=load('dragonStats');
        variables=fields(enemy);
        enemy=enemy.(variables{1});
end