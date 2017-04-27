function combatF(pCharacter, eCharacter, handles)

[player,enemy]=whichClass(pCharacter,eCharacter);

%Decides how long to wait before the enemy makes its move
turnLength=2.5;

%% Determines which weapon the player is using
playerWeaponChoice=handles.attackList.Value;
switch playerWeaponChoice
    case 1
        pAttackDamage=player.attack1d;
        pAttackAccuracy=player.attack1a;
        pAttackMessage=player.attack1m;
    case 2
        pAttackDamage=player.attack2d;
        pAttackAccuracy=player.attack2a;
        pAttackMessage=player.attack2m;
    case 3
        pAttackDamage=player.attack3d;
        pAttackAccuracy=player.attack3a;
        pAttackMessage=player.attack3m;
end

%Put AI script in here?
enemyWeaponChoice=randi(3);
switch enemyWeaponChoice
    case 1
        eAttackDamage=enemy.attack1d;
        eAttackAccuracy=enemy.attack1a;
        eAttackMessage=enemy.attack1m;
    case 2
        eAttackDamage=enemy.attack2d;
        eAttackAccuracy=enemy.attack2a;
        eAttackMessage=enemy.attack2m;
    case 3
        eAttackDamage=enemy.attack3d;
        eAttackAccuracy=enemy.attack3a;
        eAttackMessage=enemy.attack3m;
end
%% Round of Combat
rng('shuffle');
hit=randi(pAttackAccuracy);
miss=randi(enemy.dodge);

%Determines if the attack landed or not
if miss>=hit
    handles.announceTBox.String=enemy.dodgem;
    
    pause(turnLength);
    
    % Enemy Turn

    rng('shuffle');
    hit=randi(eAttackAccuracy);
    miss=randi(player.dodge);

    %Determines if the attack landed or not
    if miss>=hit
        handles.announceTBox.String=player.dodgem;
    else
        %Rolls for damage
        damageRolled=randi(eAttackDamage);
        %Calculates damage dealt
        damageDealt=damageRolled*enemy.strength*player.armor;
        handles.announceTBox.String=[eAttackMessage,' and it dealt ',num2str(damageDealt),' damage.'];
        %Updates the player's health
        handles.pHealthSlider.Value=handles.pHealthSlider.Value-damageDealt;
        handles.pHealthSlider.UserData=handles.pHealthSlider.UserData-damageDealt;
        if handles.pHealthSlider.Value<=0
            %Closes BSGUI
            handles.pHealthSlider.Value=0;
            handles.pHealthBox.String=0;
            handles.announceTBox.String=['You were defeated by the ',enemy.name,'.'];
            pause(2*turnLength);
            close(BSGUI);
        else
            pHS=num2str(handles.pHealthSlider.Value);
            handles.pHealthBox.String=pHS;
        end
    end
else
    %Rolls for damage
    damageRolled=randi(pAttackDamage);
    %Calculates damage dealt
    damageDealt=damageRolled*player.strength*enemy.armor;
    handles.announceTBox.String=[pAttackMessage,' and it dealt ',num2str(damageDealt),' damage.'];
    %Updates the enemy's health
    handles.eHealthSlider.Value=handles.eHealthSlider.Value-damageDealt;
    handles.eHealthSlider.UserData=handles.eHealthSlider.UserData-damageDealt;
    if handles.eHealthSlider.Value<=0
        %Closes MATLAB Figure
        handles.eHealthSlider.Value=0;
        handles.eHealthBox.String = 0;
        handles.announceTBox.String=['You struck down the ',enemy.name,'.'];
        %Provides test to level up the player
        levelThreshold=5*player.level+5;
        switch pCharacter
            case 1
                knight=load('knightStats');
                variables=fields(knight);
                knight=knight.(variables{1});
                knight.score=knight.score+enemy.value;
                knight.health=handles.pHealthSlider.Value+5;
                save('knightStats','knight');
                if knight.score==levelThreshold
                    open(LevelUp);
                    waitfor(LevelUp);
                else
                end
            case 2
                sorcerer=load('sorcererStats');
                variables=fields(sorcerer);
                sorcerer=sorcerer.(variables{1});
                sorcerer.score=sorcerer.score+enemy.value;
                sorcerer.health=handles.pHealthSlider.Value+5;                
                save('sorcererStats','sorcerer');
                if sorcerer.score>=levelThreshold
                    open(LevelUp);
                    waitfor(LevelUp);
                else
                end
            case 3
                thief=load('thiefStats');
                variables=fields(thief);
                thief=thief.(variables{1});
                thief.score=thief.score+enemy.value;
                thief.health=handles.pHealthSlider.Value+5;
                save('thiefStats','thief');
                if thief.score>=levelThreshold
                    open(LevelUp);
                    waitfor(LevelUp);
                else
                end
        end
    else
        eHS=num2str(handles.eHealthSlider.Value);
        handles.eHealthBox.String=eHS;
        
        pause(turnLength);

        % Enemy Turn

        rng('shuffle');
        hit=randi(eAttackAccuracy);
        miss=randi(player.dodge);

        %Determines if the attack landed or not
        if miss>=hit
            handles.announceTBox.String=player.dodgem;
        else
            %Rolls for damage
            damageRolled=randi(eAttackDamage);
            %Calculates damage dealt
            damageDealt=damageRolled*enemy.strength*player.armor;
            handles.announceTBox.String=[eAttackMessage,' and it dealt ',num2str(damageDealt),' damage.'];
            %Updates the player's health
            handles.pHealthSlider.Value=handles.pHealthSlider.Value-damageDealt;
            handles.pHealthSlider.UserData=handles.pHealthSlider.UserData-damageDealt;
            if handles.pHealthSlider.Value<=0
                handles.pHealthSlider.Value=0;
                handles.pHealthBox.String=0;
                handles.announceTBox.String=['You were defeated by the ',enemy.name,'.'];
                pause(2*turnLength);
                close(BSGUI);
            else
                pHS=num2str(handles.pHealthSlider.Value);
                handles.pHealthBox.String=pHS;
            end
        end
    end
end