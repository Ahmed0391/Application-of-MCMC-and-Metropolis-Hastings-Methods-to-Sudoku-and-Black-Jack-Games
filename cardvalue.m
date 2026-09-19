function s=cardvalue(card)
  if (strcmp(card,"K") || strcmp(card,"J") || strcmp(card,"Q"))
    s=10;
  elseif strcmp(card,"A")
    s=11;
  else
    s=str2double(card);
  endif
end

cardvalue("5")
