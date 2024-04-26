
function maskedRgbImage = Id_couleurs(mask,img_rgb,etiquettes,object_position)

maskedRgbImage = img_rgb;
taillexy=size(img_rgb);
taillex=taillexy(1)-1;
tailley=taillexy(2)-1;
couleurs = ["","","",""];

for e=1:length(etiquettes)
    moy = double(0);
    compteur = 0;
   
    for i=2:taillex
        for j=2:tailley
            if (mask(i,j) == etiquettes(e))
                compteur = compteur+1;
                moy = double(moy)+ double(img_rgb(i,j,:));
            end
        end
    end
    moy = moy/compteur;

    couleurs(e) = determine_couleur(moy);
    etiquettes(e);

    
end

hold on
 for m=1:length(object_position(:,1))
 coord=object_position(m,:);
 text(coord(2),coord(1), ['bouchon ' ,couleurs(m)])
 
 end
end
%for i=2:taillexz

 %   for j=2:tailley
  %      if (mask(i,j) == 0)
   %         maskedRgbImage(i,j,:) = 0;
    %    else 
     %       maskedRgbImage(i,j,:) = img_rgb(i,j,:);
      %  end
   % end
%end


% Mask the image using bsxfun() function
% maskedRgbImage = bsxfun(@times, img_rgb, cast(mask, 'like', img_rgb));

