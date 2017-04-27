function outcome=combatSF(iterations,strategies,attackPref,class,enemy)

%Fetches Stats
[player,enemy]=whichClass(class,enemy);

rng('shuffle');

%% Player points
%nVictories is the number of enemies defeated
nVictories=0;
combatOngoing=true;
for i=1:iterations
    %it is iteration counter to keep the WHILE loop in control
    it=0;
    while combatOngoing && it<10000
        %attackPref is which attack the player will concentrate on using
        switch attackPref
            case 1
                playerWeaponChoice=1;
            case 2
                playerWeaponChoice=2;
            case 3
                playerWeaponChoice=3;
            case 4
                playerWeaponChoice=randi(3);
        end
        
        %This loads the stats for weapons
        switch playerWeaponChoice
            case 1
                pAttackDamage=player.attack1d;
                pAttackAccuracy=player.attack1a;
            case 2
                pAttackDamage=player.attack2d;
                pAttackAccuracy=player.attack2a;
            case 3
                pAttackDamage=player.attack3d;
                pAttackAccuracy=player.attack3a;
        end
        
        %Strategies is which path the player will concentrate on levelling up in
        switch strategies
            case 1
                levelUpChoice=1;
            case 2
                levelUpChoice=2;
            case 3
                levelUpChoice=3;
            case 4
                levelUpChoice=4;
        end
        
        %Chooses which weapon the enemy will wield
        enemyWeaponChoice=randi(3);
        switch enemyWeaponChoice
            case 1
                eAttackDamage=enemy.attack1d;
                eAttackAccuracy=enemy.attack1a;
            case 2
                eAttackDamage=enemy.attack2d;
                eAttackAccuracy=enemy.attack2a;
            case 3
                eAttackDamage=enemy.attack3d;
                eAttackAccuracy=enemy.attack3a;
        end
        
        %This calculates the damage from one round of attacks
        hit=randi(pAttackAccuracy);
        miss=randi(enemy.dodge);

        %Determines if the attack landed or not
        if miss>=hit
                % Enemy Turn
                hit=randi(eAttackAccuracy);
                miss=randi(player.dodge);

                %Determines if the attack landed or not
                if miss>=hit
                else
                    %Rolls for damage
                    damageRolled=randi(eAttackDamage);
                    %Calculates damage dealt
                    damageDealt=damageRolled*enemy.strength*player.armor;
                    %Updates the player's health
                    player.health=player.health-damageDealt;
                    if player.health<=0
                        combatOngoing=false;
                    else
                    end
                end
        else
            %Rolls for damage
            damageRolled=randi(pAttackDamage);
            %Calculates damage dealt
            damageDealt=damageRolled*player.strength*enemy.armor;
            %Updates the enemy's health
            enemy.health=enemy.health-damageDealt;
            if enemy.health<=0
                %Adds one to number of kills
                nVictories=nVictories+1;
                %Regenerates some of player's health
                newHealth=0.75*(player.hmax-player.health);
                %Provides test to level up the player
                levelThreshold=player.level*10;
                player.score=player.score+enemy.value;
                    if player.score>=levelThreshold
                        switch levelUpChoice
                            case 1
                                player.strength=player.strength+0.2;
                                player.hmax=player.hmax+2;
                                player.health=player.health+2;
                                player.level=player.level+1;
                            case 2
                                player.armor=player.armor-0.05;
                                %Makes sure that the player can't break the
                                %game
                                %if player.armor==0.05
                                    %newChoice=randi(3);
                                    %switch newChoice
                                        %case 1
                                            %levelUpChoice=1;
                                        %case 2
                                            %levelUpChoice=3;
                                        %case 3
                                            %levelUpChoice=4;
                                    %end
                                %else
                                %end
                                player.hmax=player.hmax+2;
                                player.health=player.health+2;
                                player.level=player.level+1;
                            case 3
                                player.accuracy=player.accuracy+1;
                                player.hmax=player.hmax+2;
                                player.health=player.health+2;
                                player.level=player.level+1;
                            case 4
                                player.dodge=player.dodge+1;
                                player.hmax=player.hmax+2;
                                player.health=player.health+2;
                                player.level=player.level+1;
                        end
                    else
                    end
                %Summons a new enemy to fight
                enemy.health=enemy.hmax;
                %Heals player
                player.health=player.health+newHealth;
            else
            end
            % Enemy Turn
            hit=randi(eAttackAccuracy);
            miss=randi(player.dodge);

            %Determines if the attack landed or not
           	if miss>=hit
            else
                %Rolls for damage
                damageRolled=randi(eAttackDamage);
                %Calculates damage dealt
                damageDealt=damageRolled*enemy.strength*player.armor;
                %Updates the player's health
                player.health=player.health-damageDealt;
                if player.health<=0
                    combatOngoing=false;
                else
                end
            end
        end
    it=it+1;
    end
end
outcome=nVictories/iterations;
disp(['The average number of enemies defeated per game was ',num2str(outcome),'.']);
disp(nVictories);