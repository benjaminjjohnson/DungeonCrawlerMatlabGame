classdef character
    properties
        xPos % Current position on the x-axis
        yPos % Current position on the y-axis
        attackBuff % Current attack buff
        defenceBuff % Current defence buff
        dodgeBuff % Current dodge buff
        accuracyBuff % Current accracy buff
        hitpoints % Current hitpoints
        spriteList % List of the data from the sprite image objects
    end
    methods
        function obj = character(xPosInit,yPosInit,attackBuffInit,defenceBuffInit,hitpointsInit,spriteListTemp)
            obj.xPos = xPosInit;
            obj.yPos = yPosInit;
            obj.defenceBuff = defenceBuffInit;
            obj.attackBuff = attackBuffInit;
            obj.hitpoints = hitpointsInit;
            noOfSprites = length(spriteListTemp);
            for iSprites = 1:noOfSprites
                [cData,colorMap,alphaMap] = imread(spriteListTemp{iSprites},'png');
                cData = flip(cData);
                alphaMap = flip(alphaMap);
                obj.spriteList(iSprites).cData = cData;
                obj.spriteList(iSprites).colorMap = colorMap;
                obj.spriteList(iSprites).alphaMap = alphaMap;
            end
        end
    end
end