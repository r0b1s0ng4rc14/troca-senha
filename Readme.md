# Projeto troca senha

O Objetivo desse projeto é adicionar novos usuários em um ou mais servidores, caso o usuário já exista sua senha será alterada

## Pré-requisitos

- whois
- sshpass

```bash
apt-get install whois sshpass
```

## Como utilizar:


1. Execute o arquivo **gera_senha.sh**
``` bash
bash gera_senha.sh # digite sua senha e copie o hash gerado
```

2. Edite o arquivo **servidores.txt** adicionando os IPs desejados 

``` bash
192.168.0.1
192.168.0.2
...
```

3. No arquivo **All-in-One.sh** 
	1. Altere as informações de usuários conforme sua necessidade
	
    ``` bash
    user1=(login;uid-do-usuario;hash-gerada-pelo-gera-senha)
    ```
	
	2. Altere o valor do Group_ID

	``` bash
	id_group="coloque_aqui_gid"
	```
	3. Execute o arquivo
	``` bash
 	bash All-In_one.sh # será solicitado o usuário e senha o usuário deve ter permissão de sudo.
        #OU execute
        nohup bash All-In_one.sh #Caso deseje logar a sáida do script
    	```
    	
