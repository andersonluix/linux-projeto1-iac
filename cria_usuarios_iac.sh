#!/bin/bash

GRUPOS=(GRP_ADM GRP_VEN GRP_SEC)
USERS_ADM=(carlos maria joao)
USERS_VEN=(debora sebastiana roberto)
USERS_SEC=(josefina amanda rogerio)


#Cria os usuarios e adiciona aos respectivos grupos
for i in GRP_ADM GRP_VEN GRP_SEC
   do
    echo "criando grupo $i"
    groupadd $i

     if [ $i = "GRP_ADM" ]
     then
        for u in ${USERS_ADM[@]}
        do
          echo "criando usuario $u e adicionando no grupo $i"
          useradd $u -s /bin/bash -m -p $(openssl passwd -crypt Senha123) -G $i
        done
     fi

     if [ $i = "GRP_VEN" ]
     then
        for u in ${USERS_VEN[@]}
        do
          echo "criando usuario $u e adicionando no grupo $i"
          useradd $u -s /bin/bash -m -p $(openssl passwd -crypt Senha123) -G $i
        done
     fi

     if [ $i = "GRP_SEC" ]
     then
        for u in ${USERS_SEC[@]}
        do
          echo "criando usuario $u e adicionando no grupo $i"
          useradd $u -s /bin/bash -m -p $(openssl passwd -crypt Senha123) -G $i
        done
     fi
  done

#Cria as pastas
echo "Criando as pastas"
mkdir -m770 /adm /ven /sec
mkdir -m777 /publico

#Muda os donos das pastas
echo "Mudando os donos das pastas"
chown root:GRP_ADM /adm
chown root:GRP_VEN /ven
chown root:GRP_SEC /sec
