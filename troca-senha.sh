#!bin/bash


RED="\033[31m"
GREEN="\033[32m"
NORMAL="\033[0;39m"
BLUE="\e[34m"

#Hash todo caracter especial deve ser adicionado "\"
#"user" "uid" "gid" "senha_em_hash"
login=("user1" "user2" "user3" "user4" "user5")
uid=("9001" "9002" "9003" "9004" "9005")
guid="6000"
senha=("\$6\$J.8DdsPg8Q\$4vkvaI4GdmLJujaC02GRXdFrzN0lxv1j/gspYlcNkHXPRE/aj0zbj6T8rdCdHYzS5hg3a9DtC4W/BBAvH6QCI1" "\$6\$J.8DdsPg8Q\$4vkvaI4GdmLJujaC02GRXdFrzN0lxv1j/gspYlcNkHXPRE/aj0zbj6T8rdCdHYzS5hg3a9DtC4W/BBAvH6QCI1" "\$6\$J.8DdsPg8Q\$4vkvaI4GdmLJujaC02GRXdFrzN0lxv1j/gspYlcNkHXPRE/aj0zbj6T8rdCdHYzS5hg3a9DtC4W/BBAvH6QCI1" "\$6\$J.8DdsPg8Q\$4vkvaI4GdmLJujaC02GRXdFrzN0lxv1j/gspYlcNkHXPRE/aj0zbj6T8rdCdHYzS5hg3a9DtC4W/BBAvH6QCI1" "\$6\$J.8DdsPg8Q\$4vkvaI4GdmLJujaC02GRXdFrzN0lxv1j/gspYlcNkHXPRE/aj0zbj6T8rdCdHYzS5hg3a9DtC4W/BBAvH6QCI1")

for (( l=0; l<=3; l++ ))
    do 
        if sudo grep -q ${login[$l]} /etc/shadow; then
                        usermod -p ${senha[$l]} ${login[$l]}
                        echo -e "$BLUE #-----Usuário: $RED ${login[$l]} $BLUE existe, trocando a senha-----# $NORMAL"
                    else
                        useradd -m -s /bin/bash -u ${uid[$l]} -g $guid -p ${senha[$l]} ${login[$l]}
                        echo -e "$GREEN #-----Usuário: $RED ${login[$l]} $GREEN não existe, criando-----# $NORMAL"
                    fi
        
done