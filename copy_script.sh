#!bin/bash

RED="\033[31m"
GREEN="\033[32m"
NORMAL="\033[0;39m"
BLUE="\e[34m"



server=("127.0.0.1")
senha="ubuntu"
usuario="ubuntu"

for ssh in "${server[@]}"
        do 
                sshpass -p $senha scp -P 2222 -o StrictHostKeyChecking=no troca-senha.sh  $usuario@$ssh:.
                echo -e "$GREEN Copiando arquivos...\n $RED" $ssh $NORMAL
                
                sshpass -p $senha ssh -p 2222 ubuntu@$ssh "printf '$senha' | sudo -S bash troca-senha.sh"
                echo -e "$GREEN Executando scripts...\n $RED" $ssh $NORMAL
            
                sshpass -p $senha ssh -p 2222 ubuntu@$ssh "printf '$senha' | sudo -S rm -f troca-senha.sh"    
                echo -e "$GREEN Limpando arquivos temporários...\n $RED $ssh \n" $NORMAL
done
