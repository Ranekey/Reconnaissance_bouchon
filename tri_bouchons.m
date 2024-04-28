function new_image = tri_bouchons(original_image, segmented_image, pos_bouchon, order)
    % Créez une nouvelle image comme copie de l'image originale
    new_image = original_image;  
    
    % Itérer sur le nouvel ordre pour réorganiser les objets
    for i = 1:length(order)
        % Indice de l'objet actuel dans l'ordre d'origine
        original_index = order(i);  % L'index dans le nouvel ordre
        
        % Position de l'objet à partir de l'ordre original
        position_from = pos_bouchon(original_index, :);  % Position de départ
        
        % Nouvelle position à partir de l'ordre
        position_to = pos_bouchon(i, :);  % Nouvelle position dans le nouvel ordre
        
        % Étiquette de l'objet à copier
        label = segmented_image(round(position_from(1)), round(position_from(2)));  % Étiquette du bouchon
        
        % Créer un masque pour l'objet à copier
        mask = (segmented_image == label);  % Masque pour l'étiquette
        
        % Déplacements calculés à partir de deux positions
        delta_y = position_to(1) - position_from(1);  % Décalage vertical
        delta_x = position_to(2) - position_from(2);  % Décalage horizontal
        
        % Copier les pixels de l'objet vers la nouvelle position
        for row = 1:size(segmented_image, 1)
            for col = 1:size(segmented_image, 2)
                if mask(row, col)  % Si c'est le bouchon à copier
                    % Nouvelle position après décalage
                    new_row = round(row + delta_y);  % Nouvelle coordonnée y
                    new_col = round(col + delta_x);  % Nouvelle coordonnée x
                    
                    % Vérifier que les indices sont valides
                    if new_row >= 1 && new_row <= size(new_image, 1) && ...
                       new_col >= 1 && new_col <= size(new_image, 2)  % Indices positifs et dans les limites
                    
                        % Copier les pixels vers la nouvelle position
                        new_image(new_row, new_col, :) = original_image(row, col, :);  
                    end
                end
            end
        end
    end
end

