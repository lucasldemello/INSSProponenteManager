Tabela de conteúdos
-----------
<!--ts-->
* Instalando aplicação localmente
    * [Pré-requisitos](#prerequisites)
    * [Instalando depêndencias](#install)
    * [Iniciando containers para debug](#debug)
* Documentação
    * [Dando start no projeto](#start)
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

`mv .env-example .env`

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

Dessa forma podemos utilizar o comando `debugger` para pausar a execução e debugar.

<a href="start">Dando start no projeto</a>
-----------

Precisamos executar os seguintes comandos no container web. 

`docker exec -ti inssproponentemanager-web-1 bash`

Criar dbs... 

`rails db:create`

Rodar migrações...

`rails db:migrate`

Rodar seeds

`rails db:seed`

Rodar testes

`rspec .`

<a href="consideracoes">Explicações</a>
-----------

* Ao acessar o endereço http://localhost:3001 voce deve cair na listagem de funcionários.
* Se o seed correu certo, voce deve ter uma massa de dados de 40 registros, exibindo 5 registros por página. 
* Haverá um botão que direciona para o relatório / gráfico. Como já temos dados, não deve ser problema lista-lo. 
* Também é possível criar um novo funcionário, editar o mesmo e o excluir. 
* Ao digitar o salário e tirar o foco do campo, deve ser calculado a aliquota do inss.

<a href="consideracoes">Considerações</a>
-----------

Teoricamente atendi todos os requisitos. Posso citar que o único que não foi 100% é a questão do sidekiq, pois o mesmo aparentemente teve um erro nas configurações do docker,
não enxergando o db... 

Nested forms no rails não funcionam tão bem, ao imaginar realizar o cadastro em uma só pagina eu contava que isso funcionasse melhor mas vi que era melhor ter escolhido uma versão anterior para trabalhar sem dores de cabeça. Não consigo adicionar mais linhas para mais telefones.

Minha principal dor na execução do projeto, foi ter optado por utilizar o rails 7, isso impactou em várias etapas do processo, inclusive no final onde eu percebi que o javascript não carregava entre a navegação das páginas, apendas dando refresh. Após pesquisas foi possível normalizar a situação mas caso não carregue o JS para o grafico ou na hora do cadastro do funcionário, um refresh deve resolver. 

Provavelmente eu mudaria o padrão do service InssCalcService para um strategy ou chain of responsability se tivesse mais tempo hábil. 

Em resumo, envolveu muito aprendizado com essa versão do rails e resiliencia com os problemas encontrados. 

Caso haja feedback do mesmo, eu gostaria de pedir apenas que me orientasse no requisito do sidekiq, para entender melhor o que era esperado e ou o que eu deveria ter feito.
