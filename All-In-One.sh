#!bin/bash

#Siga os passos no Readme.md

server=("192.168.50.11" "192.168.50.12")
read -p "Enter username : " usuario
read -s -p "Enter password : " senha

RED="\033[31m"
GREEN="\033[32m"
NORMAL="\033[0;39m"
BLUE="\e[34m"



for ssh in "${server[@]}"
    do
    echo -e "\n#--------------------------# $RED  $ssh $NORMAL #--------------------------#  " 
    echo -e "$GREEN Copiando arquivos..."
    sshpass -p $senha ssh -o StrictHostKeyChecking=no  $usuario@$ssh bash -c 'cat <<EOF >access.sh
    #!bin/bash    
    RED="\033[31m"
    GREEN="\033[32m"
    NORMAL="\033[0;39m"
    BLUE="\e[34m"
    RED="\033[31m"
    GREEN="\033[32m"
    NORMAL="\033[0;39m"
    BLUE="\e[34m"

    declare -a users
    users[1]="user1asdasdads;7000;\\\$6\\\$FG53AmR6\\\$foO/gJYsdj9tlecqPvpKPtela.zB0niYZzlFl578BlxXxpmKbzR80Nl6WOTH3fHPsY3AqBIIr3Fhm5Tr0wMYT/"
    users[2]="user22;7001;\\\$6\\\$J7gzi7UALaEzKnQ\\\$9cTtoKyN6bhxNXtYJ4NsBdwZZ.IW.h.SfU8UI.AkVDfz82FuMrAEkpd4AQKB4F4b3o7ZSYzL3rIf/qTL5KBJG0"
    users[3]="user3;7002;\\\$6\\\$J7gzi7UALaEzKnQ\\\$9cTtoKyN6bhxNXtYJ4NsBdwZZ.IW.h.SfU8UI.AkVDfz82FuMrAEkpd4AQKB4F4b3o7ZSYzL3rIf/qTL5KBJG0"
    users[4]="user2;7004;\\\$6\\\$J7gzi7UALaEzKnQ\\\$9cTtoKyN6bhxNXtYJ4NsBdwZZ.IW.h.SfU8UI.AkVDfz82FuMrAEkpd4AQKB4F4b3o7ZSYzL3rIf/qTL5KBJG0"
    id_group="6000"

    echo -e "\n"
    if [ \$(id -u) -eq 0 ]; then
    if grep -i \$id_group /etc/group &> /dev/null; then
        for user in \${users[@]}
        do
            IFS=";" read -r -a user_info <<< "\$user"
            user=\${user_info[0]}
            id_user=\${user_info[1]}
            pass=\${user_info[2]}
            
            if grep -i \$user /etc/passwd &> /dev/null; then
                echo -e "#------------------------------------------------------------------------#"
                printf "%-74s%s\n" "#    Usuário  \$user existe." "#" 
                usermod -p "\$pass" \${user} &> /dev/null  \
                    && printf "# \$BLUE %-68s \$NORMAL %s \n" "  Senha alterada." "#"\
                    || printf "# \$RED %-68s \$NORMAL %s \n" "  Falha ao alterar a senha." "#"
            
            else
                echo -e "#------------------------------------------------------------------------#"
                printf "%-75s%s\n" "#    Usuário: \$user não existe." "#" 
                useradd -m -s /bin/bash -u \$id_user -g \$id_group -p \$pass \$user &> /dev/null \
                    && printf "# \$GREEN %-69s \$NORMAL %s \n" "  Usuário cadastrado " "#"  \
                    || printf "# \$RED %-69s \$NORMAL %s \n" "  Falha ao adicionar usuário" "#"
            fi 
        done
            echo -e "#------------------------------------------------------------------------#"
    else
        echo -e "\$RED Grupo id \$id_group não exite \$NORMAL"    
    fi
    else
        echo -e "\$RED Somente o root pode adicionar um usuário ao sistema \$NORMAL"
        exit 2
    fi
EOF'

    echo -e "$GREEN Executando scripts... $NORMAL"
    sshpass -p $senha ssh -o StrictHostKeyChecking=no  $usuario@$ssh "printf '$senha\n' | sudo -S bash access.sh "
    echo -e "$GREEN Limpando arquivos temporários... $NORMAL "
    sshpass -p $senha ssh -o StrictHostKeyChecking=no  $usuario@$ssh "printf '$senha\n' | sudo -S rm -f access.sh &> /dev/null"    
    echo -e "$BLUE FIM $NORMAL\n"
done


