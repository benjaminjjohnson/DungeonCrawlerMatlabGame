%% Header

%DungeonDwellers.m
%Starting Stats for each class
%Stats not final, need to be balanced

%% Player Characters

%Stats for the Knight
knight.name='Knight';
knight.strength=1.2;
knight.accuracy=6;
knight.dodge=2;
knight.health=15;
knight.hmax=15;
knight.score=0;
knight.armor=0.8;
knight.portrait='Knight.png';
knight.dodgem='You block the enemy''s attack with your shield.';
knight.attack1n='Sword';
knight.attack1d=4;
knight.attack1a=knight.accuracy+1;
knight.attack1m='You strike the enemy with your sword';
knight.attack2n='Bow';
knight.attack2d=6;
knight.attack2a=knight.accuracy;
knight.attack2m='You loose an arrow at your foe';
knight.attack3n='Punch';
knight.attack3d=3;
knight.attack3a=knight.accuracy+3;
knight.attack3m='Your mailed fist sinks into your opponent''s flesh';
save('knightStats','knight');

%Sorcerer Stats
%Stats for the Sorcerer
sorcerer.name='Sorcerer';
sorcerer.strength=1.3;
sorcerer.accuracy=7;
sorcerer.dodge=2;
sorcerer.health=15;
sorcerer.hmax=15;
sorcerer.score=0;
sorcerer.armor=0.9;
sorcerer.portrait='Sorcerer.png';
sorcerer.dodgem='You hastily cast a ward of protection.';
sorcerer.attack1n='Fireball';
sorcerer.attack1d=5;
sorcerer.attack1a=sorcerer.accuracy-2;
sorcerer.attack1m='A ball of sorcerous fire rushes at the enemy';
sorcerer.attack2n='Invocation';
sorcerer.attack2d=4;
sorcerer.attack2a=sorcerer.accuracy;
sorcerer.attack2m='You summon a spirit to fight for you';
sorcerer.attack3n='Staff';
sorcerer.attack3d=3;
sorcerer.attack3a=sorcerer.accuracy+1;
sorcerer.attack3m='You deal a firm blow with your staff';
save('sorcererStats','sorcerer');

%Thief Stats
%Stats for the Thief
thief.name='Thief';
thief.strength=1.1;
thief.accuracy=8;
thief.dodge=5;
thief.health=15;
thief.hmax=15;
theif.score=0;
thief.armor=0.9;
thief.portrait='Thief.png';
thief.dodgem='You roll out of the way of danger.';
thief.attack1n='Stab';
thief.attack1d=3;
thief.attack1a=thief.accuracy;
thief.attack1m='You slip your knife through a chink in your opponent''s armor';
thief.attack2n='Toss';
thief.attack2d=4;
thief.attack2a=thief.accuracy-1;
thief.attack2m='You toss a vial of poison at your foe';
thief.attack3n='Garrote';
thief.attack3d=7;
thief.attack3a=thief.accuracy-3;
thief.attack3m='You slip behind your foe and get a rope around their neck';
save('thiefStats','thief');

%% Enemies

%Stats for the Zombie
zombie.name='Zombie';
zombie.strength=1.3;
zombie.accuracy=4;
zombie.dodge=1;
zombie.health=25;
zombie.hmax=25;
zombie.value=1;
zombie.armor=1;
zombie.portrait='Zombie.png';
zombie.dodgem='The zombie shambles out of the way.';
zombie.attack1n='Punch';
zombie.attack1d=3;
zombie.attack1a=zombie.accuracy+1;
zombie.attack1m='The zombie punches you';
zombie.attack2n='Bite';
zombie.attack2d=6;
zombie.attack2a=zombie.accuracy-2;
zombie.attack2m='The zombie bites you';
zombie.attack3n='Vomit';
zombie.attack3d=4;
zombie.attack3a=zombie.accuracy-1;
zombie.attack3m='The zombie vomits a deluge of filth at you';
save('zombieStats','zombie');

%Stats for the Mercenary
mercenary.name='Mercenary';
mercenary.strength=1.2;
mercenary.accuracy=6;
mercenary.dodge=2;
mercenary.health=15;
mercenary.hmax=15;
mercenary.value=2;
mercenary.armor=0.8;
mercenary.portrait='Mercenary.png';
mercenary.dodgem='The mercenary ducks behind cover.';
mercenary.attack1n='Sword';
mercenary.attack1d=4;
mercenary.attack1a=mercenary.accuracy+1;
mercenary.attack1m='The mercenary''s sword slices you';
mercenary.attack2n='Bow';
mercenary.attack2d=6;
mercenary.attack2a=mercenary.accuracy;
mercenary.attack2m='The mercenary sends an arrow at you';
mercenary.attack3n='Punch';
mercenary.attack3d=3;
mercenary.attack3a=mercenary.accuracy+3;
mercenary.attack3m='The mercenary''s fist flies at your face';
save('mercenaryStats','mercenary');

%Stats for the Ogre
ogre.name='Ogre';
ogre.strength=1.4;
ogre.accuracy=5;
ogre.dodge=1;
ogre.health=30;
ogre.hmax=30;
ogre.value=3;
ogre.armor=0.7;
ogre.portrait='Ogre.png';
ogre.dodgem='The ogre draws back out of range.';
ogre.attack1n='Club';
ogre.attack1d=4;
ogre.attack1a=ogre.accuracy;
ogre.attack1m='The ogre''s club slams your side';
ogre.attack2n='Punch';
ogre.attack2d=3;
ogre.attack2a=ogre.accuracy+1;
ogre.attack2m='The ogre punches you';
ogre.attack3n='Kick';
ogre.attack3d=5;
ogre.attack3a=ogre.accuracy-2;
ogre.attack3m='The ogre kicks you across the room';
save('ogreStats','ogre');

%Stats for the Parakeet
parakeet.name='Parakeet';
parakeet.strength=1;
parakeet.accuracy=8;
parakeet.dodge=7;
parakeet.health=5;
parakeet.hmax=5;
parakeet.value=1;
parakeet.armor=0.8;
parakeet.portrait='Parakeet.png';
parakeet.dodgem='The parakeet flutters up and out of range.';
parakeet.attack1n='Claw';
parakeet.attack1d=2;
parakeet.attack1a=parakeet.accuracy+1;
parakeet.attack1m='The parakeet claws you';
parakeet.attack2n='Peck';
parakeet.attack2d=3;
parakeet.attack2a=parakeet.accuracy;
parakeet.attack2m='The parakeet pecks you';
parakeet.attack3n='Poop';
parakeet.attack3d=4;
parakeet.attack3a=parakeet.accuracy-1;
parakeet.attack3m='The parakeet poops on your head';
save('parakeetStats','parakeet');

%Stats for the Carp
carp.name='Carp';
carp.strength=1.3;
carp.accuracy=5;
carp.dodge=4;
carp.health=7;
carp.hmax=7;
carp.value=2;
carp.armor=0.7;
carp.portrait='Carp.png';
carp.dodgem='The carp swims into deeper water where you cannot reach.';
carp.attack1n='Bite';
carp.attack1d=4;
carp.attack1a=carp.accuracy+1;
carp.attack1m='The carp bites you with its sharp teeth';
carp.attack2n='Drown';
carp.attack2d=7;
carp.attack2a=carp.accuracy-2;
carp.attack2m='The carp drags you beneath the surface';
carp.attack3n='Ram';
carp.attack3d=5;
carp.attack3a=carp.accuracy;
carp.attack3m='The carp rams you';
save('carpStats','carp');

%Stats for the Pig
pig.name='Pig';
pig.strength=1.3;
pig.accuracy=6;
pig.dodge=3;
pig.health=12;
pig.hmax=12;
pig.value=2;
pig.armor=0.8;
pig.portrait='Pig.png';
pig.dodgem='The pig runs away.';
pig.attack1n='Gore';
pig.attack1d=5;
pig.attack1a=pig.accuracy;
pig.attack1m='The pig stabs you with its sharp tusks';
pig.attack2n='Drown';
pig.attack2d=6;
pig.attack2a=pig.accuracy-1;
pig.attack2m='The pig bites you';
pig.attack3n='Ram';
pig.attack3d=4;
pig.attack3a=pig.accuracy+1;
pig.attack3m='The pig slams into you';
save('pigStats','pig');

%Stats for the Whale
whale.name='Whale';
whale.strength=1.5;
whale.accuracy=7;
whale.dodge=3;
whale.health=35;
whale.hmax=35;
whale.value=6;
whale.armor=0.7;
whale.portrait='Whale.png';
whale.dodgem='The whale dives into the deeps.';
whale.attack1n='Flood';
whale.attack1d=2;
whale.attack1a=whale.accuracy+2;
whale.attack1m='The whale slams its tail, creating a shockwave of water';
whale.attack2n='Drown';
whale.attack2d=6;
whale.attack2a=whale.accuracy-3;
whale.attack2m='The whale drags you into deep water';
whale.attack3n='Jet';
whale.attack3d=5;
whale.attack3a=whale.accuracy-2;
whale.attack3m='A stream of concentrated water jets from the whale''s blowhole';
save('whaleStats','whale');

%Stats for the Dragon
dragon.name='Dragon';
dragon.strength=1.5;
dragon.accuracy=7;
dragon.dodge=4;
dragon.health=50;
dragon.hmax=50;
dragon.value=10;
dragon.armor=0.6;
dragon.portrait='Dragon.png';
dragon.dodgem='The dragon flies out of range.';
dragon.attack1n='Fire Breath';
dragon.attack1d=5;
dragon.attack1a=dragon.accuracy+2;
dragon.attack1m='A wall of fire shoots from the dragon''s gullet';
dragon.attack2n='Claw';
dragon.attack2d=6;
dragon.attack2a=dragon.accuracy;
dragon.attack2m='The dragon grabs you with its claws';
dragon.attack3n='Slam,';
dragon.attack3d=8;
dragon.attack3a=dragon.accuracy-2;
dragon.attack3m='The dragon''s tail knocks you across the room';
save('dragonStats','dragon');