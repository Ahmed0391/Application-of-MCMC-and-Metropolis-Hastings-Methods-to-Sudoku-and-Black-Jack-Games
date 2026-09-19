function [card, gameDeck] = drawCard(infinite, gameDeck, fullDeck)
    if infinite
        index = randi(length(fullDeck));
        card = fullDeck{index};
    else
        index = randi(length(gameDeck));
        card = gameDeck{index};
        gameDeck(index) = [];  % remove drawn card from the deck
    end
end

