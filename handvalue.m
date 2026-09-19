function total=handvalue(hand)
  total = 0;
  aces = 0;

  for i = 1:length(hand)
    val = cardvalue(hand(i));
    total = total + val;
    if strcmp(hand(i),"A")
      aces = aces + 1;
    end
  end


  while total > 21 && aces > 0
    total = total - 10;
    aces = aces - 1;
  end
end
