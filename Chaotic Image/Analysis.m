%=============================================================
% Function For Analysis of the encrypted Images
% NPCR_and_UACI   
% NPCR => Number of changing pixel rate
% UACI => unified averaged changed intensity

% NPCR and UACI are two most common quantities used to evaluate the strength
% of image encryption algorithms/ciphers with respect to differential attacks. 
%==============================================================

NPCR_and_UACI('Blowfishencrypt.jpg','Blowfishdecryptt.jpg');



%=============================================================
%OUTPUT:
%        results.npcr_score: quantitative NPCR score (larger is better)
%        results.npcr_pVal : qualitative NPCR score  (larger is better)
%        results.npcr_dist : theoretical NPCR normal dist. (mean +\- var)
%        results.uaci_score: quantitative UACI score (larger is NOT better)
%        results.uaci_pVal : qualitative UACI score  (larger is better)
%        results.uaci_dist : theoretical UACI normal dist. (mean +\- var)
%============================================================

% =========================================================================
% SCORE INTERPRETATION:        
%        if your cipher is abled to encrypted images that indistinguishable
%        from random images under the NPCR and UACI measures, pVals simply 
%        represent the possibility that your tested images are indeed random
%        -like, and thus a larger pVal is preferred. On the other hand, 
%        pVals are random variables, and could be very small (say 0.0001)
%        even though test images are truely random-like. Therefore, it is
%        meaningless to make any conclusive claim for a small test data set.
%        However, if you observe that out of 100 tested image pairs, 5 of
%        them fail to achieve pVals greater than 0.01 (or 1%), then this is
%        a clear indicator that this image cipher fail to generated
%        random-like outputs, because if we use 100 truely random-like
%        image pairs, we will only observe 1 out 100 with pVal less than
%        0.01 in theory.