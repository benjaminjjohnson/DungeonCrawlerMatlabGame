function combat=attack(base, weapon, dodge, armor, health)
%Base is the base attack damage. I think that it should be related to
%the attacker's strength. The weapon is the damage granted by whichever
%weapon the attacker is using. It is added on to the base damage, so a
%character with a base damage of 3 and a sword of 4 damage will do seven
%damage total. Dodge is related to the target's mobility, and represent's
%the target's chances to avoid damage. Armor is the target's armor, and
%reduces damage. So if one takes the attack mentioned beforehand, paired
%with an armor of 5, the target takes 2 damage

rng('shuffle');
hit=randi(10);
if hit<=dodge
    disp(' ');
    disp('The ___enemy___ dodged your attack!');
    %I plan to add an array containing different messages to display, to
    %vary it up, such as ducked behind a wall or rolled out of the way
else damage=(base+weapon-armor);
    %I might have armor be a percent reduction of damage, rather than a
    %flat reduction
    disp(' ');
    disp(['The attack did ',num2str(damage),' damage.']);
    if health<=damage
        disp(' ');
        disp('The ___enemy___collapses, defeated.');
    else health=health-damage;
        disp(' ');
        disp('The ___enemy___ grunts in pain.');
        disp(['The ___enemy___is now down to ',num2str(health),' health.']);
    end
end