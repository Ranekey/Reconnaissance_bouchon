clear all
close all

%Affiche image originale
image_rgb_wassim = imread("IMG_wassim.jpg");
figure;
imshow(image_rgb_wassim);title('image originale');

%Affiche image ndg
image_wassim_nvg = rgb2gray(image_rgb_wassim);
%figure;
%imshow(image_wassim_nvg);title('image nvg');

%Effectue un filtre moyenneur sur l'image
img_moy = filtreM(image_wassim_nvg,3); 
%figure;
%imshow(img_moy);title('image moyenne');

%seuillage
seuil = 90 ;
binary = 255*(img_moy<seuil);
%figure;
%imshow(binary);title('seuillage')

%Dilation
img_dil = filtreDilat(binary,5);
img_dil2 = filtreDilat(img_dil,3);
%figure;
%imshow(img_dil2);title('image dilater')

%Segmentation
[img_seg,etiquettes,pos_bouchon] = segmentons(img_dil2);
%figure;
%imshow(img_seg);title('image segmenter');

etiquettes;
pos_bouchon;


%Identification couleur
img_id = Id_couleurs(img_seg,image_rgb_wassim,etiquettes,pos_bouchon);
figure;
imshow(img_id);

