#!/bin/bash

nb_cve=$(debsecan $(lsb_release --codename --short) | wc -l)
liste_cve=$(debsecan $(lsb_release --codename --short) --format detail)

echo -e "NOMBRE DE CVE : $nb_cve \n \n $liste_cve" > ./CVE_$(date +"%d-%m-%Y_%H:%M:%S").txt