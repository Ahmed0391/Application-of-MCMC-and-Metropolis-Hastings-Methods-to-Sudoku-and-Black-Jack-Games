function critere(grille)

   T = 10; % Température initiale
    cooling_rate = 0.99; % Taux de refroidissement
    max_iterations = 10000; % Nombre maximum d'itérations

    current_grid = grille;
    current_energy = E(current_grid);

    for iter = 1:max_iterations
        proposed_grid = propose_change(current_grid);
        proposed_energy = E(proposed_grid);

        % Calcul du critère d'acceptation
        alpha = min(1, exp(-(proposed_energy - current_energy) / T));

        % Générer un nombre aléatoire
        u = rand();

        % Mise à jour de la grille
        if u < alpha
            current_grid = proposed_grid;
            current_energy = proposed_energy;
        end

        % Refroidissement
        T = T * cooling_rate;

        % Afficher la grille à chaque 1000 itérations
        if mod(iter, 1000) == 0
            disp(current_grid);
        end

        % Vérifier si la solution est trouvée
        if current_energy == 0
            disp('Solution trouvée:');
            disp(current_grid);
            break;
        end
    end
end

function energy = calculate_energy(grid)
    % Calcule l'énergie (coût) de la grille
    energy = 0;

    % Vérifier les lignes
    for i = 1:9
        energy += 9 - length(unique(grid(i, grid(i, :) > 0)));
    end

    % Vérifier les colonnes
    for j = 1:9
        energy += 9 - length(unique(grid(:, j)'));
    end

    % Vérifier les sous-grilles 3x3
    for box_row = 0:2
        for box_col = 0:2
            box = grid(3*box_row+1:3*box_row+3, 3*box_col+1:3*box_col+3);
            energy += 9 - length(unique(box(box > 0)));
        end
    end
end

function new_grid = propose_change(grid)
    % Propose un changement aléatoire dans la grille
    new_grid = grid;
    empty_cells = find(new_grid == 0);

    if isempty(empty_cells)
        return; % Pas de changement si aucune case vide
    end

    % Choisir une case vide aléatoire
    idx = randi(length(empty_cells));
    cell_index = empty_cells(idx);

    % Choisir un chiffre valide aléatoire (1 à 9)
    new_value = randi(9);
    new_grid(cell_index) = new_value;
end


