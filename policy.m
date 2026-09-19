function result = policy(hand)
    result =  (handvalue(hand)!=21);
end


function result = isHard(hand)
    total = 0;
    aces = 0;

    for i = 1:length(hand)
        val = cardvalue(hand{i});
        total = total + val;
        if strcmp(hand{i}, "A")
            aces = aces + 1;
        end
    end

    result = ~(aces > 0 && total <= 21);
end
