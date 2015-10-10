%==========================================================%
% Function For Analysis of the encrypted Images
% NPCR_and_UACI   
% NPCR => Number of changing pixel rate
% UACI => unified averaged changed intensity

% NPCR and UACI are two most common quantities used to evaluate the strength
% of image encryption algorithms/ciphers with respect to differential attacks. 
%=========================================================%
%% Function
NPCR_and_UACI('DESencrypt.jpg','DESdecrypt.jpg');
