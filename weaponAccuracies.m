function acc=weaponAccuracies(baseAcc,mod)

%This function is designed to fix the glitch of the weapon accuracies not
%updating with the levelling up of accuracy.

acc=baseAcc+mod;