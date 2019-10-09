#!bin/bash
RED="\033[31m"
GREEN="\033[32m"
NORMAL="\033[0;39m"
BLUE="\e[34m"
declare -a users
users[0]='user1;6001;7000;\$6\$J.8DdsPg8Q\$4vkvaI4GdmLJujaC02GRXdFrzN0lxv1j/gspYlcNkHXPRE/aj0zbj6T8rdCdHYzS5hg3a9DtC4W/BBAvH6QCI1'
users[1]='user2;6002;7000;\$6\$J.8DdsPg8Q\$4vkvaI4GdmLJujaC02GRXdFrzN0lxv1j/gspYlcNkHXPRE/aj0zbj6T8rdCdHYzS5hg3a9DtC4W/BBAvH6QCI1'
users[2]='user3;6003;7000;\$6\$J.8DdsPg8Q\$4vkvaI4GdmLJujaC02GRXdFrzN0lxv1j/gspYlcNkHXPRE/aj0zbj6T8rdCdHYzS5hg3a9DtC4W/BBAvH6QCI1'
users[3]='user4;6004;7000;\$6\$J.8DdsPg8Q\$4vkvaI4GdmLJujaC02GRXdFrzN0lxv1j/gspYlcNkHXPRE/aj0zbj6T8rdCdHYzS5hg3a9DtC4W/BBAvH6QCI1'
users[4]='user5;6005;7000;\$6\$J.8DdsPg8Q\$4vkvaI4GdmLJujaC02GRXdFrzN0lxv1j/gspYlcNkHXPRE/aj0zbj6T8rdCdHYzS5hg3a9DtC4W/BBAvH6QCI1'

for user in "${users[@]}"
do
   IFS=";" read -r -a arr <<< "${user}"
   user="${arr[0]}"
   id_user="${arr[1]}"
   id_group="${arr[2]}"
   pass="${arr[3]}"
   if grep -i ${user} /etc/passwd; then
       echo -e "#-------- usuário $user existe, alterando a senha...--------#"
       echo -e "usermod -p $pass $user"
       echo -e "#-------- Senha do usuário ${user} alterada --------#\n"
   else
       echo -e "#-------- Usuário $user não existe, cadastrando... ---------# "
       echo -e "Username: $user Uid:  $id_user Gid: $id_group Hash:  $pass"
       echo -e "useradd -m -s /bin/bash -u $id_user -g $id_group -p $pass $user"
       echo -e "Usuário $user cadastrado\n"
   fi
done