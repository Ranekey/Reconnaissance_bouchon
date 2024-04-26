% Charger l'image
img_final = tes('IMG_wassim.jpg'); % Remplacez 'image.jpg' par le chemin de votre image

% Séparation des canaux de couleur
canal_rouge = image_originale(:,:,1);
canal_vert = image_originale(:,:,2);
canal_bleu = image_originale(:,:,3);

% Mettre en évidence le rouge
seuil_rouge = canal_rouge > 120 & canal_vert < 100 & canal_bleu < 100;
image_rouge = image_originale;
image_rouge(repmat(~seuil_rouge,[1 1 3])) = 0;

% Mettre en évidence le vert
seuil_vert = canal_vert > 100 & canal_rouge < 100 & canal_bleu < 100;
image_vert = image_originale;
image_vert(repmat(~seuil_vert,[1 1 3])) = 0;

% Mettre en évidence le bleu
seuil_bleu = canal_bleu > 80 & canal_rouge < 80 & canal_vert < 80;
image_bleu = image_originale;
image_bleu(repmat(~seuil_bleu,[1 1 3])) = 0;

% Mettre en évidence le noir
seuil_noir = canal_rouge < 60 & canal_vert < 60 & canal_bleu < 60;
image_noir = image_originale;
image_noir(repmat(~seuil_noir,[1 1 3])) = 255;

% Affichage des images avec les couleurs mises en évidence
figure;
subplot(1,5,1);
imshow(image_originale);
title('Image Originale');

subplot(1,5,2);
imshow(image_rouge);
title('Rouge Mis en Évidence');

subplot(1,5,3);
imshow(image_vert);
title('Vert Mis en Évidence');

subplot(1,5,4);
imshow(image_bleu);
title('Bleu Mis en Évidence');

subplot(1,5,5);
imshow(image_noir);
title('Noir Mis en Évidence');
