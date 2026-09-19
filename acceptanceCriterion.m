function accept = acceptanceCriterion(E_current, E_new, temperature)
    deltaE = E_new - E_current;
    if E_new<0
      accept=false;
      return ;

    elseif (deltaE < 0)
        accept = true;
    else
        accept = (rand() < exp(-deltaE / temperature));
    endif
end
