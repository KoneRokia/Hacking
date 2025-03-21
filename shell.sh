
#!/bin/bash

# Menu d'options
echo "1) Whois"
echo "2) Nslookup"
echo "3) Dig"
echo "4) TheHarvester"
echo "5) Traceroute"
echo "6) Host"

# Demande du nom de domaine
read -p "Entrez le nom du domaine : " domain

# Vérifier si un domaine a été saisi
if [ -z "$domain" ]; then
    echo "Erreur : Aucun domaine saisi. Veuillez recommencer."
    exit 1
fi

# Demande de l'option
read -p "Choisissez une option (1-6) : " option

# Création du dossier principal et du sous-dossier spécifique au domaine
Dossier_princ="footprinting"
Dossier="$Dossier_princ/footprinting_$domain"

mkdir -p "$Dossier"

# Exécution de l'outil choisi et enregistrement des résultats
case $option in
    1)
        echo "[+] Exécution de Whois..."
        whois "$domain" > "$Dossier/whois.txt"
        echo "Résultats enregistrés dans $Dossier/whois.txt"
        ;;
    2)
        echo "[+] Exécution de Nslookup..."
        nslookup "$domain" > "$Dossier/nslookup.txt"
        echo "Résultats enregistrés dans $Dossier/nslookup.txt"
        ;;
    3)
        echo "[+] Exécution de Dig..."
        dig "$domain" > "$Dossier/dig.txt"
        echo "Résultats enregistrés dans $Dossier/dig.txt"
        ;;
    4)
        echo "[+] Exécution de TheHarvester..."
        theHarvester -d "$domain" -l 200 -b yahoo > "$Dossier/theHarvester.txt"
        echo "Résultats enregistrés dans $Dossier/theHarvester.txt"
        ;;
    5)
        echo "[+] Exécution de Traceroute..."
        traceroute "$domain" > "$Dossier/traceroute.txt"
        echo "Résultats enregistrés dans $DOMAIN_FOLDER/traceroute.txt"
        ;;
    6)
        echo "[+] Exécution de Host..."
        host "$domain" > "$Dossier/host.txt"
        echo "Résultats enregistrés dans $Dossier/host.txt"
        ;;
    *)
        echo "Option invalide ! Veuillez choisir une option entre 1 et 6."
        exit 1
        ;;
esac

echo "Recherche terminée. Les résultats sont dans : $Dossier"


