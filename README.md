Tabela de conteúdos
-----------
<!--ts-->
* Instalando aplicação localmente
    * [Pré-requisitos](#prerequisites)
    * [Instalando depêndencias](#install)
    * [Iniciando containers para debug](#debug)
* Documentação
    * [Testes API](#testesapi)
    * [Endpoints](#endpoints)
    * [Considerações](#consideracoes)
<!--te-->
# Instalando aplicação localmente

<a href="prerequisites">Pré-requisitos</a>
-----------
`docker`
`docker-compose`

Link para documentação oficial de instalação de docker e docker-compose:
https://docs.docker.com/compose/install/


<a href="install">Instalando depêndencias</a>
-----------

Para baixar as imagens e preparar os containers execute o comando:

`docker-compose build --no-cache`

Após a execução, podemos utilizar o seguinte comando para iniciar os containers:

`docker-compose up` ou

`docker-compose up -d` caso queira executar de forma detach (background)

Para descobrir o nome da imagem:

`docker ps -a --format "table {{.ID}}\t{{.Names}}\t{{.Status}}"`

Para acessar o container:

`docker exec -ti nome-da-imagem bash`

<a href="debug">Iniciando containers para debug</a>
-----------

    docker-compose up -d
    docker attach nome-da-imagem

Dessa forma podemos utilizar o comando `byebug` para pausar a execução e debugar.
