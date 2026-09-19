function grille = initialisationGrille(grille, indices_fixes)
    for block_row = 0:2
        for block_col = 0:2

            lignes = block_row * 3 + (1:3);
            colonnes = block_col * 3 + (1:3);

            chiffres_dans_bloc = [];
            positions_vides = [];


            for i = lignes
                for j = colonnes
                    if indices_fixes(i, j)
                        chiffres_dans_bloc(end+1) = grille(i, j);
                    else
                        positions_vides(end+1, :) = [i, j];
                    end
                end
            end

            % Chiffres manquants dans le bloc
            tous = 1:9;
            manquants = setdiff(tous, chiffres_dans_bloc);
            manquants = manquants(randperm(length(manquants))); % Mélange aléatoire

            % Remplir les positions vides
            for k = 1:size(positions_vides, 1)
                i = positions_vides(k, 1);
                j = positions_vides(k, 2);
                grille(i, j) = manquants(k);
            end
        end
    end
end


