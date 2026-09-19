function [outcome, iter] = simulateGame(policyFunc, infiniteDeck)
    fullDeck = {"2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"};
    gameDeck = repmat(fullDeck, 1, 4);

    % Distribution initiale

    player = {"A","3"};



    E=21-handvalue(player);
    Ei=21-handvalue(player);


    [card, gameDeck] = drawCard(infiniteDeck, gameDeck, fullDeck);
    dealer = {card};
    [card, gameDeck] = drawCard(infiniteDeck, gameDeck, fullDeck);
    dealer{end+1} = card;

    % Tour du joueur
    iter=0;
    while policyFunc(player)
        [card, gameDeck] = drawCard(infiniteDeck, gameDeck, fullDeck);
        player{end+1} = card;
        %card;

        %E
        E_new=21-handvalue(player);
        %E_new;
        %if handvalue(player) > 21
         %   outcome = -1; % Player bust
            %fprintf("Player bust: %s (Value: %d)\n", strjoin(player, ', '), handvalue(player));    %pour visualiser la main

          %  return;
        %endif


        if acceptanceCriterion(E, E_new, 0.5)
          E = E_new;
        else
          player(end) = [];
        endif

        iter=iter+1;

    end



    % Tour du dealer
    while handvalue(dealer) < 17
        [card, gameDeck] = drawCard(infiniteDeck, gameDeck, fullDeck);
        dealer{end+1} = card;
    end

    % Résultat final
    p = handvalue(player);
    d = handvalue(dealer);


    %fprintf("Final Player Hand: %s (Value: %d)\n", strjoin(player, ', '), p);      %||||pour visualiser les differentes
    %fprintf("Final Dealer Hand: %s (Value: %d)\n", strjoin(dealer, ', '), d);         % iterartions||||
    %printf("initial energy=%d final energy=%d\n" ,Ei, E);
    %printf("nombre d iterartion: %d\n", iter);

    if d > 21 || p > d
        outcome = 1;
    elseif p == d
        outcome = 0;
    else
        outcome = -1;
    endif
endfunction
