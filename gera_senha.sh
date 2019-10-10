#!/bin/bash
echo -e "Gerador de Hass" 
read -s -p "Entre com sua senha: " password

hash=$(mkpasswd -m sha-512 -s $password)
echo $hash | sed -r 's/[$@]/\\\\\\$/g'

