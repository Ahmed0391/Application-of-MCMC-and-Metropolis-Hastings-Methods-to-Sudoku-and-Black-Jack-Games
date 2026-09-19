function evaluatePolicy(name, policyFunc, runs)


    infWins = 0; infLosses = 0; infDraws = 0;
    deckWins = 0; deckLosses = 0; deckDraws = 0;
    l1=[];
    l2=[];
    for i = 1:runs
        % Infinite deck
        [res1, iter1] = simulateGame(policyFunc, true);
        l1{i}=iter1;
        if res1 == 1
            infWins = infWins + 1;
        elseif res1 == -1
            infLosses = infLosses + 1;
        else
            infDraws = infDraws + 1;
        endif

         %Single deck
        %[res2, iter2] = simulateGame(policyFunc, false);
        %l2{i}=iter2;
        %if res2 == 1
         %   deckWins = deckWins + 1;
        %elseif res2 == -1
         %   deckLosses = deckLosses + 1;
        %else
         %   deckDraws = deckDraws + 1;
        %endif
    endfor
    l1_numeric = cell2mat(l1);
    %l2_numeric = cell2mat(l2);

    moy1= mean(l1_numeric);
    %moy2= mean(l2_numeric);
    ecart_type1 = std(l1_numeric);
    %ecart_type2 = std(l2_numeric);

    % Affichage des statistiques
    fprintf("Policy: %s\n", name);
    fprintf("  Infinite Deck:\n");
    printStats(infWins, infLosses, infDraws, runs);
    printf("moyenne des iterations: %d\n", moy1);
    printf("I1=[%f, %f]\n", moy1-1.96*(ecart_type1/runs), moy1+1.96*(ecart_type1/runs));
    %fprintf("  Single Deck:\n");
    %printStats(deckWins, deckLosses, deckDraws, runs);
    %printf("moyenne des iterations: %d\n", moy2);
    %printf("I2=[%f, %f]\n", moy2-1.96*(ecart_type2/runs), moy2+1.96*(ecart_type2/runs));

    fprintf("--------------------------\n");
end

function printStats(wins, losses, draws, runs)
    winRate = 100 * wins / runs;
    drawRate = 100 * draws / runs;
    lossRate = 100 - winRate - drawRate;
    fprintf("    Win Rate:  %.2f%%\n", winRate);
    fprintf("    Loss Rate: %.2f%%\n", lossRate);
    fprintf("    Draw Rate: %.2f%%\n", drawRate);
end

