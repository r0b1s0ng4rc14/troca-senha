#!bin/bash

#Hash todo caracter especial deve ser adicionado "\"
#"user" "uid" "gid" "senha_em_hash"

login=("user1" "user2" "user3" "user4" "user5")
uid=("0001" "0002" "0003" "0004" "0005")
guid="6000"
senha=("\$6\$J.8DdsPg8Q\$4vkvaI4GdmLJujaC02GRXdFrzN0lxv1j/gspYlcNkHXPRE/aj0zbj6T8rdCdHYzS5hg3a9DtC4W/BBAvH6QCI1" "\$6\$J.8DdsPg8Q\$4vkvaI4GdmLJujaC02GRXdFrzN0lxv1j/gspYlcNkHXPRE/aj0zbj6T8rdCdHYzS5hg3a9DtC4W/BBAvH6QCI1" "\$6\$J.8DdsPg8Q\$4vkvaI4GdmLJujaC02GRXdFrzN0lxv1j/gspYlcNkHXPRE/aj0zbj6T8rdCdHYzS5hg3a9DtC4W/BBAvH6QCI1" "\$6\$J.8DdsPg8Q\$4vkvaI4GdmLJujaC02GRXdFrzN0lxv1j/gspYlcNkHXPRE/aj0zbj6T8rdCdHYzS5hg3a9DtC4W/BBAvH6QCI1" "\$6\$J.8DdsPg8Q\$4vkvaI4GdmLJujaC02GRXdFrzN0lxv1j/gspYlcNkHXPRE/aj0zbj6T8rdCdHYzS5hg3a9DtC4W/BBAvH6QCI1")

for (( l=0; l<=3; l++ ))
    do 
        if sudo grep -q ${login[$l]} /etc/shadow; then
                        echo "usuario existe"
                        usermod -p ${login[$l]} ${login[$l]}
                        echo ${login[$l]} ${uid[$l]} $guid ${senha[$l]}
                    else
                        echo "usuario nao existe"
                        echo ${login[$l]} ${uid[$l]} $guid ${senha[$l]}
                        echo -e "useradd -m -s /bin/bash -u $id_user -g $id_group -p $pass $user"
                    fi
        
done