function couleur = determine_couleur(pixel)

canal_rouge = pixel(1);
canal_vert = pixel(2);
canal_bleu = pixel(3);

seuil_rouge = canal_rouge > 120 & canal_vert < 100 & canal_bleu < 100;
seuil_vert = canal_vert > 100 & canal_rouge < 100 & canal_bleu < 100;
seuil_bleu = canal_bleu > 80 & canal_rouge < 80 & canal_vert < 80;
seuil_noir = canal_rouge < 60 & canal_vert < 60 & canal_bleu < 60;
if(seuil_rouge)
    couleur = "rouge";
end
if(seuil_vert)
    couleur = "vert";
end
if(seuil_bleu)
    couleur = "bleu";
end
if(seuil_noir)
    couleur = "noir";
end