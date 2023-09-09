#### 08/09/2023

Curso de Elixir Parte 3: Conhecendo o ecossistema Elixir

@01-Ecossistema

@@01
Apresentação

[00:00] Sejam muito bem-vindos à Alura. Eu sou o Vinicius Dias e vou guiar vocês nesse treinamento onde vamos criar uma aplicação com Elixir.
[00:08] Já adquirimos certo conhecimento com Elixir, já sabemos um pouco da sintaxe básica, já aprendemos sobre pattern matching, bastante sobre recursão e até formas de execução do código Elixir.

[00:18] Mas nesse treinamento vamos criar uma aplicação real. Inclusive eu tenho um gerenciador de tarefas da Erlang, rodando e mostrando os processos que vamos criar.

[00:28] Teremos um agendador de tarefas que de minuto em minuto vai enviar uma mensagem para um outro processo, que é um servidor que criamos. Essa mensagem será recebida e um número aleatório será escrito no arquivo. Ou seja, de minuto em minuto o número vai mudar.

[00:43] Claro que essa aplicação parece simples, mas para isso teremos que aprender bastante coisa interessante.

[00:48] Começaremos falando do ecossistema do Elixir, como funciona se um processo morrer, como buscar dependências externas e como unir isso tudo.

[00:56] Depois daremos um passo atrás e entenderemos o que é esse conceito de processos, que é diferente no sistema operacional e na Erlang, e, por consequência, no Elixir. Então falaremos bastante sobre processos, comunicação entre eles e abstrações.

[01:09] Depois disso estaremos prontos para criar uma tarefa utilizando o Mix, que é uma ferramenta bastante interessante. A partir disso poderemos criar uma aplicação real. E essa aplicação vai gerenciar esses dois processos diferentes se comunicando.

[01:22] No final de tudo conseguiremos executar testes. Então não só nós vamos executar os testes que já vêm por padrão, mas vamos entender o que é o tal do doctest, criar testes nossos até utilizando Mox e recursos da própria Erlang.

[01:39] Então vale muito a pena acompanhar esse treinamento, e se em algum momento você tiver alguma dúvida, não hesite. Existe um fórum para alunos e você pode abrir sua dúvida lá.

[01:48] Eu tento responder pessoalmente sempre que possível, mas quando eu não consigo, temos uma comunidade de alunos, de moderadores e instrutores muito solícita, e com certeza alguém vai conseguir te ajudar.

[01:58] Agora chega de falar sobre o que veremos e vamos começar a ver. No próximo vídeo já começamos a entender um pouco sobre o ecossistema do Elixir.

@@02
Conhecendo o Hex

[00:00] Bem-vindos de volta. Como eu comentei na introdução, antes de entrarmos em código, antes de escrevermos alguma coisa, vamos conhecer o ecossistema de Elixir.
[00:10] O que fizemos até agora nos treinamentos anteriores foi escrever código em Elixir, chegamos a compilar um módulo em Elixir, mas ainda não criamos uma aplicação em si. E antes de criarmos uma aplicação existem alguns conhecimentos que precisamos para entender como tudo funciona e como tudo se une.

[00:29] Então uma das primeiras coisas que falaremos é sobre gerenciamento de dependências. Não é comum escrevermos todo o código necessário para fazer tudo na nossa aplicação. Por exemplo, se precisamos realizar log de alguma coisa, com certeza alguém já criou um código que é especializado em fazer log. Se eu preciso me autenticar com Facebook, alguém já criou um código assim.

[00:52] Então existem muitos códigos já criados pela comunidade, por outros desenvolvedores que podemos utilizar na nossa aplicação.

[00:59] E assim como JavaScript tem o npm, o PHP tem Composer, o C Sharp tem o NuGet, cada linguagem tem um gerenciador de dependências, com Elixir isso não é diferente: temos o Hex.

[01:10] Dando uma olhada na minha tela, se eu entrar no site hex.pm vemos o site do package manager para o ecossistema de Erlang. Repara que ele não diz que é um package manager para Elixir. Ele é pra o ecossistema de Erlang.

[01:27] Então nós encontraremos dependências que funcionam na máquina virtual do Erlang. E como já comentamos, Elixir roda nessa máquina virtual.

[01:36] Vamos imaginar que eu queira pesquisar os pacotes, então vou entrar em “Packages”, e vou ordenar pelo número total de downloads. Vamos ver quais pacotes têm mais downloads. Repara que esse tal de “Jason” é uma forma de você parsear e gerar JSON utilizando Elixir.

[01:52] Então ele tem uma lista de vários pacotes e podemos pesquisar alguma coisa. Por exemplo, se eu pesquisar “web” vamos ver o que aparece.

[02:00] Ele mostra algumas coisas relacionadas a web, inclusive um framework de desenvolvimento web.

[02:06] Nós não vamos utilizá-lo nesse treinamento, mas ele é o framework mais comum de desenvolvimento web utilizando Elixir. Então vale a pena dar uma olhada depois que terminarmos esse treinamento.

[02:16] Continuando, conseguimos pesquisar dependências. E quando clicamos em alguma dessas dependências existem várias informações.

[02:23] No lado direito da tela conseguimos ver como utilizar essa dependência, e veremos na prática mais para frente, mas temos alguns links. Temos um link para uma documentação e um link para o GitHub. Vou abrir ambos numa nova aba.

[02:36] Repara que todos, ou pelo menos a maioria dos pacotes, são públicos, estão no GitHub. Existe a possibilidade de você disponibilizar, existe a possibilidade de você ter pacotes em repositórios privados, mas a maioria deles estará em repositórios públicos, pelo menos os que estão nessa busca pública.

[02:52] Então conseguimos, além de conferir o código, dar uma olhada na documentação e tudo que está no repositório dele propriamente dito.

[03:01] Mas além do repositório, como eu disse, existe um link para uma documentação online. Isso é outra coisa interessante do ecossistema de Elixir. Muito do que escrevemos é passível de ser documentado diretamente no código.

[03:13] De novo, esse é outro assunto que não entraremos a fundo nesse treinamento, mas é possível que no código você gere algo como essa documentação.

[03:21] Então é muito comum que as bibliotecas sejam muito bem documentadas e que exista esse padrão de como você tem uma introdução, seu pacote, depois todas as funções e etc.

[03:31] Mas enfim, já falamos bastante sobre o Hex, que é o package manager do Elixir, só que ainda não sabemos como uma aplicação pode ficar rodando. Então vamos entender um pouco melhor sobre outra parte do ecossistema do Elixir no próximo vídeo.

@@03
Para que depender?

Neste vídeo nós entendemos que o Hex pode ser utilizado para gerenciar todas as dependências que nós possamos ter em nosso projeto.
Por que nós iríamos querer depender de pacotes externos ao invés de escrever todo o código nós mesmos?

Para pouparmos tempo delegando a culpa de qualquer erro para outros.
 
Alternativa correta
Não há motivo plausível para usar código de terceiros em nosso projeto.
 
Alternativa correta
Para não "reinventar a roda" e usar códigos já prontos e testados.
 
Alternativa correta! Se precisamos realizar tarefas comuns como fazer requisições HTTP, trabalhar com XML ou algo do tipo, várias pessoas já tiveram esse trabalho e resolveram esse problema. Muito provavelmente algum pacote existe e ele será especializado nessa tarefa, com muitas pessoas de olho nele, atentas a possíveis bugs e melhorias. É o princípio seguido pelo Unix onde cada projeto deve fazer uma única coisa e fazê-la muito bem feita.

@@04
Supervisor

[00:00] Em treinamentos anteriores eu comentei que Elixir é muito utilizado quando você precisa de uma aplicação que será tolerante a falha. Um exemplo de aplicação que roda utilizando a máquina virtual do Erlang é o WhatsApp, que é muito utilizado no Brasil.
[00:16] Imagina se um processo do WhatsApp sai do ar. É necessário que alguma ação seja tomada para que esse processo seja iniciado de novo.

[00:23] Então é muito incomum que o WhatsApp por si só saia do ar. Quando acontece uma indisponibilidade vários servidores do Facebook caíram.

[00:31] Outra coisa que eu já comentei que roda utilizando Erlang é a telefonia. É muito provável que quando você faz uma ligação esses dados estejam sendo trafegados através de um sistema utilizando Erlang.

[00:43] Repare que aplicações muito críticas utilizam essa máquina virtual, essa forma de rodar código. E por que será que isso acontece? Existem algumas formas de monitorarmos nossa aplicação e garantir que ela funcione.

[00:56] Mas imagina que você está executando um processo, você está gerenciando um servidor web. Você subiu o seu Nginx e você recebeu uma notificação que o processo do NginX morreu.

[01:08] Então você vai entrar no servidor e iniciar de novo esse processo para que as requisições continuem chegando. Nesse caso o seu papel está sendo de supervisor do processo do seu servidor web.

[01:21] Você fica observando se o processo está ok e se acontecer alguma coisa e esse processo não estiver mais ok, você o inicia de novo.

[01:30] Isso funciona, só que funciona mal. Imagina que o processo cai de madrugada e você não está monitorando, porque você é uma pessoa.

[01:38] Então a Erlang já fornece uma forma de você ter isso automaticamente, sem você precisar instalar nada a mais. E o nome disso é Supervisor, ou seja, supervisor. Vamos dar uma olhada nesta imagem.



[01:53] Podemos criar o que é conhecido como uma árvore de supervisores, ou Supervision Tree. Normalmente a nossa aplicação terá um processo supervisor como início, como a raiz dessa árvore.

[02:06] Esse supervisor pode ter processos filhos. Então podemos ter que um outro supervisor e mais um supervisor. Esses processos filhos podem ser também supervisores. E embaixo desse supervisores temos processos executando alguma coisa.

[02:21] Imagina que um dos processos é um servidor web. Ele está ouvindo conexões. E quando chega uma conexão esse processo se comunica com outro, que vai gerenciar, processar essa requisição.

[02:34] Só que esse processo precisa se comunicar com um banco de dados. Então ele pode se comunicar com outro processo que acessa o banco de dados.

[02:41] Repara que se alguma coisa cair, um supervisor já vai levantar isso de novo, mas uma outra parte da minha aplicação não é afetada. Por essa natureza de como o Erlang roda temos aplicações muito tolerantes a falhas.

[02:54] E também, em cima disso, repara que isso pode ser muito performático. Porque de novo, eu tenho um processo o meu servidor web; outro processo processando essa requisição; outro que vai realizar uma conexão com banco de dados; talvez um outro para ler arquivos; outro ainda para fazer requisições HTTP.

[03:13] Então eu posso separar todas as responsabilidades do meu sistema em processos. E talvez você esteja pensando que você vai estourar o número de processadores que você tem, o número de núcleos do processador. Mas sobre isso falaremos um pouco mais para frente.

[03:26] A ideia é entender que conseguimos ter cada parte da nossa aplicação isolada, executando de forma isolada das outras, e podendo realizar tarefas que inclusive venham a falhar. E se falhar tudo bem, porque tem um supervisor que vai levantar esse processo de novo.

[03:42] Então só para vermos um exemplo do que é possível, mas não é o que vamos implementar nesse curso, podemos ter uma aplicação inteira rodando com vários processos.

![])(https://caelum-online-public.s3.amazonaws.com/2323+elixir+part+3/Transcri%C3%A7%C3%A3o+/Aula1_video3_imagem2.png)

[03:50] Repara que eu tenho um processo de servidor web; eu tenho outro processo para gerenciar sessões; eu tenho outro processo que gerencia armazenamento de dados e dentro desse armazenamento eu posso ter um pool de conexões, talvez algum banco de dados, por exemplo. E tem um outro processo para cuidar de cache.

[04:09] Então repara que eu posso ter vários processos com responsabilidades muito bem definidas. E essa é uma das belezas de se trabalhar com Elixir, conseguimos atingir esse tipo de aplicação.

[04:20] De novo, nesse treinamento não vamos chegar em algo tão complexo. Mas vamos utilizar um pouco desse conceito de supervisão.

[04:27] Só que para conseguirmos ter uma aplicação completa ainda precisamos de uma outra ferramenta. Já falamos sobre o gerenciador de dependências, o Hex, e falamos sobre o supervisor da Erlang.

[04:39] Só que para que isso tudo funcione nós precisamos criar um projeto. Então no próximo vídeo vamos conversar um pouco sobre o projeto.

https://caelum-online-public.s3.amazonaws.com/2323+elixir+part+3/Transcrição+/Aula1_video3_imagem1.png

@@05
Conceito básico

Entendemos neste vídeo o que é um Supervisor.
Em palavras simples, qual o conceito básico de um Supervisor?

Um processo que supervisiona e nos avisa de erros em outros processos
 
Alternativa errada! O Supervisor age diretamente ao invés de somente nos notificar de erros.
Alternativa correta
Um processo que supervisiona e, se necessário, reinicia outros processos
 
Alternativa correta! Em Elixir temos o que é conhecido como Supervision tree. Um Supervisor é um tipo de processo nessa árvore de processos que fica responsável por supervisionar alguns outros processos. Se estes pararem por algum motivo, o Supervisor pode iniciá-los novamente, tornando nossa aplicação mais robusta.
Alternativa correta
Um processo que supervisiona outros processos para armazenar estatísticas.
 
Alternativa errada! Um Supervisor não apenas "supervisiona". Ele não fica só olhando. Ele age diretamente se necessário. :-)

@@06
Entendendo o Mix

[00:00] Como eu comentei, precisamos ver como criar aplicações utilizando Elixir. E antes de falar sobre algum nome ou como criar aplicações vamos dar uma olhada rápida no nosso guia de Elixir que já estávamos conferindo antes.
[00:15] Nós já vimos bastante coisa da parte “Getting Started”. Inclusive, eu te convido para olhar as partes que ainda não cobrimos. Mas depois disso temos uma outra sessão, de “Mix and OTP”.

[00:29] O que será que isso significa? Vamos dar uma olhada. Ele já mostra que esse guia está separado em várias partes diferentes. Então vamos dar uma olhada nesse guia de Mix e OPT. Vou clicar sobre “Introduction to Mix”.

[00:41] Ele vai explicar como criar uma aplicação em Elixir completa, com sua supervision tree, ou seja, sua árvore de supervisão, configuração, testes e etc.

[00:51] Então repara que o Mix é uma forma de criar aplicações. É uma ferramenta que o próprio ecossistema do Elixir já te dá para gerenciar uma aplicação como um todo.

[01:02] Continuando, ele fala o que precisamos, está dizendo qual aplicação esse guia vai criar. Ele mostra um link para a documentação completa do Mix. E lembra que isso é um guia, não é documentação.

[01:17] Mas voltando para o guia, ele mostra como podemos criar nosso primeiro projeto. Usando um comando chamado mix eu posso executar alguns códigos. Vamos entender um pouco melhor.

[01:27] Primeiro um exemplo para quem conhece o mundo C Sharp. Utilizando o Visual Studio você consegue criar uma solução, e dentro dessa solução você pode ter vários projetos. Utilizando o Mix você pode criar um projeto, e dentro desse projeto é possível que você tenha várias aplicações.

[01:45] Então é semelhante o conceito, mas para quem não é dessa área de C Sharp vamos explicar um pouco melhor.

[01:50] A ferramenta Mix é basicamente uma ferramenta provida pelo próprio ecossistema do Elixir que junta todas as peças que precisamos para criar uma aplicação.

[02:01] Utilizando o Mix conseguimos criar uma aplicação, conseguimos executar nossos testes utilizando uma ferramenta específica, conseguimos gerenciar nossas dependências utilizando o Hex, conseguimos inicializar a supervision tree que já vimos, sobre supervisor.

[02:17] Então Mix é basicamente a cola que une tudo que o ecossistema Elixir nos fornece. E o ecossistema Elixir é como se fosse um ambiente um pouco mais fechado.

[02:27] Quem está habituado, por exemplo, com JavaScript ou PHP, que são linguagens muito permissíveis, com ecossistemas permissivos, pode achar isso um pouco estranho.

[02:35] Por exemplo, com JavaScript você pode utilizar o NPM ou Yarn para gerenciar suas dependências. Com PHP você pode criar um projeto web de inúmeras formas possíveis.

[02:45] Já com Elixir, o ecossistema te entrega uma forma, um padrão para você seguir. Isso é meio que oficial. A própria linguagem já te fornece essa forma para você executar. Não é uma ferramenta de terceiros.

[02:57] Isso tem vantagens e desvantagens. Você perde um pouco em flexibilidade, mas você ganha em padrão. Você sabe que toda aplicação que for criada com Elixir vai seguir esse padrão, vai utilizar essa ferramenta de teste, vai utilizar esse gerenciador de dependências, vai seguir essa estrutura. Então isso pode ter vantagens e desvantagens.

[03:16] Mas enfim, chega de falar. Vamos dar uma olhada em como o Mix funciona. Vamos pegar esse comando $ mix new kv ==module KV. Com esse comando estamos criando uma nova aplicação em Elixir, e o nome dessa aplicação é KV.

[03:27] E temos um parâmetro extra de module. Quando criamos uma aplicação, essa aplicação terá um módulo principal. E o nome desse módulo será o nome da aplicação com CamelCase.

[03:40] Então nesse caso seria K maiúsculo e V minúsculo. Só que o criador dessa aplicação queria com as duas letras maiúsculas, porque são de Key e Value, são duas partes diferentes, então ele pode especificar o nome do módulo principal.

[03:54] Vamos ver como nós podemos executar isso. Vamos abrir um terminal. Com mix new eu posso criar uma nova aplicação.

[04:01] E você dá um nome para sua aplicação. Eu vou criar uma aplicação chamada “Elixir teste”. Vamos ver o que acontece se eu tentar criar dessa forma: mix new ElixirTeste.

[04:10] Ele vai avisar que uma aplicação precisa começar com a letra minúscula seguido de caracteres também minúsculos, números ou underline. Ou seja, não podemos fugir desse padrão. Isso é bastante interessante, o Elixir meio que te força a seguir um padrão.

[04:26] Então para a nossa aplicação eu posso ter mix new elixir_teste. Se eu quisesse mudar o módulo eu poderia colocar em seguida --module e o nome do módulo principal que eu quero.

[04:37] E eu posso passar algumas outras opções. Por exemplo, uma das mais comuns é --sup. Com isso vamos criar uma aplicação que tem dentro um supervisor. Já temos nossa raiz de supervisão.

[04:50] Só que eu não vou fazer isso porque esse treinamento não é para você criar já uma aplicação profissional da forma mais produtiva. É para você entender como uma aplicação realmente é criada e funciona.

[05:01] Então vamos criar essa supervisor tree na mão, vamos criar um novo projeto sem uma supervisor tree.

[05:07] Mas continuando, vamos criar um novo projeto de Elixir. Ele mostra quais arquivos foram criados e ele diz como podemos fazer para utilizar esse projeto, pelo menos no início:

[05:19] Ele está dizendo para eu entrar na pasta “elixir_teste”, e depois ele me pede para executar o comando mix test.

[05:28] Isso é uma tarefa do Mix. Ele instruiu o Mix a executar alguma tarefa. E quais tarefas estão disponíveis por padrão? O que eu posso fazer com Elixir? Eu posso digitar mix help. Dessa forma veremos tudo o que é possível de fazer.

[05:48] Repara que tem um monte de coisa. Eu consigo ter tarefas relacionadas à aplicação, arquivo, eu consigo limpar, executar comandos, compilar, gerenciar dependências com Hex, enfim. Tem muita coisa que eu posso fazer.

[06:02] Te convido a passar o olho nisso, mas não tenta entender a fundo tudo que temos nessa lista. Não é o objetivo agora. O que queremos fazer é lidar com uma aplicação.

[06:12] Para lidarmos com essa aplicação vamos primeiro abrir o Visual Studio Code nessa pasta e ver o que temos de estrutura.

[06:21] Abri o Visual Studio e já estou na pasta correta. O que temos dentro desse projeto? Primeiro o arquivo principal, que é o ponto de entrada de uma aplicação Mix.

[06:31] O que o Mix faz? Ele lê esse arquivo “mix.exs” e com isso ele gera uma aplicação do Erlang. Então vamos deixar esse arquivo por último.

[06:39] E dentro de “lib” é onde vamos escrever todos os nossos códigos. Nosso próprio código estará dentro disso. E o módulo principal da nossa aplicação é o “elixir_teste.ex”.

[06:49] Dentro desse módulo podemos definir algum código para ser executado, mas basicamente esse é o nome do módulo principal.

[06:56] E se tivéssemos utilizado aquele --sup nós teríamos uma outra pasta com outro arquivo que seria o nosso supervisor. Mas faremos isso no futuro.

[07:06] Em “test” teremos nossos testes. Falaremos pouco sobre testes nesse treinamento, só para entender como funciona no Elixir. E o “test_helper.exs” é como o Mix consegue identificar quais configurações utilizar. De novo, já entraremos nessa parte.

[07:24] Agora entrando no “mix.exs”, repare que temos a definição de um projeto, então é um Mix.Project, que faz uso de um Project.

[07:32] Essa diretiva use, que ainda não vimos, injeta código no nosso módulo. Ela basicamente pega tudo que está em Project e adiciona no nosso módulo. Com isso nós definimos algumas funções que esse código use Mix.Project vai chamar.

[07:46] Então temos uma função Project, que tem a definição do nosso projeto, e temos um word list, que já vimos anteriormente.

[07:53] Então tem o nome da nossa aplicação, a versão, qual versão do Elixir que estamos utilizando. Nós podemos também definir dependências, então nós temos uma outra função de dependências, e também veremos mais para frente como definir. Mas ele já mostra um exemplo.

[08:09] E em application é basicamente onde vai começar tudo, onde tudo se inicia no nosso projeto.

[08:15] E por enquanto só temos uma aplicação extra, que é o de logger, para exibir algumas coisas no terminal. Mas basicamente é isso que temos hoje.

[08:22] Então antes de continuarmos e de escrevermos algum código, vamos dar um passo atrás e entender sobre aquilo que falamos no Supervisor de processos.

[08:32] Lembra que eu falei que podíamos acabar estourando o número de núcleos do nosso processador? Então vamos entender porque isso não acontece e como o Elixir trabalha com processos, porque processos são a base para qualquer aplicação de Elixir.

[08:45] Então de novo, antes de entrarmos a fundo numa aplicação, num projeto utilizando o Mix, vamos voltar para o nosso terminal interativo e utilizar bastante processos para entendermos a base. Mas isso tudo será no próximo capítulo.

@@07
Faça como eu fiz

Chegou a hora de você seguir todos os passos realizados por mim durante esta aula. Caso já tenha feito, excelente. Se ainda não, é importante que você execute o que foi visto nos vídeos para poder continuar com a próxima aula.

Continue com os seus estudos, e se houver dúvidas, não hesite em recorrer ao nosso fórum!

@@08
O que aprendemos?

Nesta aula, aprendemos:
Conhecemos o ecossistema do Elixir;
Vimos que usamos o Hex para gerenciar pacotes;
Entendemos o que é o Supervisor;
Conhecemos o Mix.

#### 09/09/2023

@02-Processos

@@01
Projeto da aula anterior

Caso queira, você pode baixar aqui o projeto do curso no ponto em que paramos na aula anterior.

https://github.com/alura-cursos/2323-elixir-3/archive/refs/tags/aula-1.zip

@@02
Spawn

[00:00] Bem-vindos de volta a mais um capítulo desse treinamento. Finalmente vamos entender como uma aplicação em Elixir funciona.
[00:07] Claro, não vamos criar uma aplicação complexa, mas estamos começando a entender como todo o ecossistema do Elixir funciona. E todo esse ecossistema gira em torno de um conceito muito importante, que são os processos de Elixir.

[00:20] Talvez você já conheça bastante de programação e saiba como funcionam processos, mas isso é um pouco diferente. Então vamos dar uma olhada no guia do Elixir para eu não modificar nada do que você vai aprender baseado no que o guia explica para nós.

[00:35] Ele começa com algumas afirmações óbvias para nós que já entendemos de computação: que todo código roda dentro de processos. Tudo em computação, toda execução de algum programa roda dentro de processos. Mas você já vai ver que isso é um pouco diferente.

[00:48] Os processos são isolados entre si, de novo, o padrão entre processos. Eles rodam de forma concorrente, se comunicam através do envio de mensagens.

[00:57] E agora começa a parte interessante: os processos são não só a base da concorrência do Elixir, mas eles também fornecem os meios para criarmos aplicações que são tolerantes a falhas. Nós criamos os programas que são tolerantes a falhas utilizando os processos do Elixir.

[01:15] De novo, até aí tudo bem, pode ser uma definição bem genérica. E agora começamos a parte específica do Elixir. Os processos do Elixir não devem ser confundidos com processos do sistema operacional.

[01:27] O que isso quer dizer? Quando eu crio um processo no meu código eu não estou criando um processo no meu sistema operacional direto.

[01:35] Quando eu crio um processo no código, essa instrução vai para a Virtual Machine do Erlang e o Erlang vai criar uma estrutura interna dele que se assemelha a um processo.

[01:47] Mas é o Erlang que vai gerenciar tudo, o escalonamento de processos, a criação e exclusão de processos. Tudo é o Erlang que vai gerenciar.

[01:56] Quando cada processo vai executar e quanto tempo cada processo vai levar para executar o Erlang vai gerenciar, e com isso ganhamos muito em eficiência.

[02:05] Então repara que processos em Elixir são extremamente leves, tanto em termos de memória quanto de CPU. Até quando comparamos com threads, que outras linguagens de programação permitem que criemos.

[02:16] E por causa disso conseguimos ter uma aplicação com milhares de processos, e isso não necessariamente é um problema.

[02:24] Claro que existe um certo custo na hora de criar um processo, mas esse custo é tão pequeno que podemos ter aplicações com milhares de processos.

[02:33] Inclusive, quando trabalhamos com escrita em arquivos eu comentei que cada escrita acontece em um processo diferente. O Elixir cria um desses processos para escrever no arquivo. Então isso acontece de forma paralela, concorrente ao nosso código.

[02:50] Por isso que se eu estiver dentro de uma recursão ou dentro de um loop com várias escritas de arquivo, é interessante eu minimizar o número de processo que vai ser criado. Talvez deixar um processo só criando vários desses arquivos, escrevendo nesses arquivos, e já falamos como tratar disso no treinamento anterior. Mas aqui isso começa a ficar um pouco mais claro.

[03:10] Mas para eu criar um processo como podemos fazer? Nós utilizamos a função Spawn, que é basicamente iniciar um novo processo. Então vou abrir o terminal interativo do Elixir. E para criar um novo processo eu utilizo essa função Spawn.

[03:26] E dentro o que ele espera é receber uma função, que vai fazer alguma coisa. Por exemplo, vou fazer spawn(fn -> IO.puts(“Estou em outro processo”). E finalizei essa função com um end. Agora eu posso executar esse código. Vamos ver o que acontece quando executo.

[03:44] Simples, ele só exibe “Estou em outro processo”. Só que esse puts retorna um “ok”, e eu vou até executar para você se lembrar. Já o Spawn devolve um PID, que é Process ID. É um identificador para esse processo.

[04:04] Só que não devemos confundir esse PID com o PID do nosso sistema operacional, porque os processos do sistema operacional também possuem IDs. Só que esse ID não vai casar com o ID do processo do sistema operacional da Erlang, por exemplo.

[04:18] Para vermos outro exemplo eu vou pegar esse PID baseado na seguinte criação: vou pegar uma variável pid.

[04:28] Depois que criei essa variável eu posso verificar se esse processo está vivo. Só que esse processo executou há bastante tempo, ele já rodou, então ele não está mais vivo. Esse processo já finalizou.

[04:42] Com isso vemos que conseguimos nos comunicar com outros processos, conseguimos pegar informações de outros processos. Inclusive, existe todo um módulo para trabalharmos com esses processos.

[04:53] Então conseguimos ter muito poder quando falamos de processos. Para finalizarmos esse vídeo e ele não ficar muito longo, se eu quiser pegar o PID do meu próprio processo eu posso utilizar a função self.

[05:06] Por que eu pegaria o ID do meu próprio processo? De novo, Elixir não armazena estado, e já falamos sobre isso. Aquela questão de imutabilidade, de não conseguirmos alterar uma variável. Então armazenar estado pode ser difícil.

[05:20] Se eu quiser ter um estado armazenado no meu próprio processo, uma forma para atingir isso através de uma espécie de gambiarra é gerar mensagens para o meu próprio processo e pegar essa mensagem depois.

[05:31] Podemos ver como fazer isso no futuro talvez, mas por enquanto vamos focar na base de como nos comunicamos utilizando processos.

[05:38] Então vamos ver como enviar e receber mensagens de processos no próximo vídeo.

@@03
Erlang vs SO

Neste vídeo falamos um pouco sobre processos. Devs tendem a conhecer um pouco sobre o conceito de processos do sistema operacional.
Qual a diferença de um processo do Sistema Operacional e um processo da Erlang (VM que executa o código Elixir)?

Processos Erlang não são processos reais, sendo muito mais leves e baratos de se criar.
 
Alternativa correta! A Erlang VM controla os seus "processos" de forma diferente, assumindo o controle de gestão, escalonamento, etc. Isso permite que ela faça um trabalho mais direcionado e otimizado, fazendo com que os "processos" Erlang sejam muito baratos de se criar. Existem aplicações que criam milhares de processos e isso não necessariamente é um problema.
Alternativa correta
São exatamente a mesma coisa.
 
Alternativa correta
Processos Erlang não são processos reais, sendo muito mais pesados e caros de se criar.

@@04
Comunicação

[00:00] Vamos entender um pouco de como funciona comunicação entre processos. Se eu tenho comunicação utilizando mensagens, alguém tem que enviar uma mensagem e outra pessoa precisa receber essa mensagem.
[00:17] Vamos criar um novo processo: Spawn(fn ->. E única coisa que esse processo fará é receber mensagem. Então vou usar uma macro chamada receive: Spawn(fn -> receive do.

[00:35] Então dentro do código, entre do e end, poderemos processar o recebimento de mensagens. Vou dar um “Enter”. E dentro o que precisamos fazer?

[00:44] Eu preciso utilizar o pattern matching para receber uma mensagem e executar alguma coisa. Não vou utilizar uma tupla nem nada do tipo, e qualquer mensagem, qualquer conteúdo que eu receber, então será uma variável qualquer, eu vou executar esse código.

[01:03] Então que código eu vou executar? Eu vou só exibir essa mensagem, esse conteúdo: conteudo -> IO.puts(conteudo). Finalizei e vou mostrar o end desse receive. O receive está dentro de um bloco do e end.

[01:19] Agora vou finalizar essa função, porque a única coisa que essa função faz é isso, receber uma mensagem. Então end e posso fechar os parênteses:

[01:26] Isso tudo vai gerar um novo processo. Só que eu não peguei o Process ID desse processo. Então vamos fazer isso tudo de novo, só que armazenando o PID.

[01:36] Eu posso apertar para cima e ver tudo que já foi executado. Então vou armazenar esse PID, vou fazer o match de qualquer variável, vou encerrar o meu receive, encerrar a minha função e fechar os parênteses. Agora sim o meu PID é o Process ID dessa função que eu criei.

[01:56] Eu criei esse processo. No meu processo principal eu posso fazer o que eu quiser, por exemplo: IO.puts(“Estou no processo principal”).

[02:05] Inclusive, podemos lidar com o processo principal. Vamos ver se o meu processo principal está vivo, está rodando ainda. Eu posso utilizar o self, que já vimos, obviamente ele está rodando, senão não estaríamos escrevendo código. Agora vamos ver se aquele outro processo que criamos está vivo também.

[02:24] Nós vemos que ele está vivo sim. Esse processo está rodando ainda. E o que ele está fazendo então? Ele está esperando uma mensagem chegar.

[02:32] Que mensagem, utilizando que padrão? Qualquer um. Qualquer mensagem que chegar ele vai executar.

[02:38] Vimos que com o receive nós esperamos uma mensagem. E como enviamos uma mensagem? Utilizando a função send. Essa função espera dois parâmetros: um PID, ou seja, um Process ID, e uma mensagem que vamos enviar, qualquer variável.

[02:53] Então eu vou enviar para o PID um texto: send(pid, “Texto para ser exibido no processo filho”). O que vai acontecer? Quando eu fizer esse send, uma mensagem será enviada para esse PID. Então a parte do receive será executada.

[03:11] E o que ele espera? Ele espera qualquer conteúdo, e quando esse conteúdo chegar ele vai simplesmente exibir. Então veremos essa mensagem sendo exibida agora. Quando eu dou “Enter”, ele mostra para nós que o texto para ser exibido no processo filho foi exibido. E além disso, é isso que essa função send retorna. Ela retorna a mensagem que nós enviamos.

[03:32] Então se eu tentar enviar de novo, repara que essa mensagem não foi mais exibida. E eu posso inclusive mandar qualquer coisa, como uma tupla com somente um “ok”, e isso será retornado, só que não está sendo mais exibido.

[03:46] Por que isso está acontecendo? Se eu fizer Process.alive?(pid), aquele processo não está mais vivo. Ele executou o que tinha que executar e morreu, porque eu não falei para ele ficar esperando novas mensagens ou alguma coisa do tipo. Ele espera uma mensagem, e uma vez que chegou a mensagem, acabou.

[04:02] Então repara que existem algumas particularidades que precisamos entender. Um processo fica travado quando eu utilizo o receive? Ele vai ficar parado para sempre? O que precisamos fazer para desbloquear? E se der um erro naquele meu processo? O meu processo principal vai receber alguma mensagem? Se eu envio uma mensagem e o processo não existe eu consigo receber essa informação?

[04:23] Existem detalhes que podemos nos aprofundar no conceito de processo. Mas com o que temos, já começamos a entender como o Elixir por si só funciona.

[04:33] Um supervisor tree faz Spawn de vários processos. Um processo que vai receber conexões HTTP; outro que vai lidar com a requisição, um controller, por exemplo; outro para se conectar ao banco de dados.

[04:45] Então o supervisor tree, o nosso código que é a raiz da supervisão, gerencia processos. E um processo espera requisição. Então ele está em um looping infinito aguardando uma conexão. Chegou essa conexão, ele faz o send para um processo que processa requisições.

[05:03] Se esse processo que faz o processamento de requisições não está de pé, repara que meu servidor web não está nem aí. Ele não vai morrer por causa disso.

[05:13] Talvez o meu supervisor tree receba alguma notificação, ou não, mas então repara que dessa forma toda uma aplicação em Elixir é construída. Então o bloco de fundação de qualquer aplicação Elixir são processos.

[05:26] Entendido isso, vamos dar uma olhada em algumas particularidades na hora de lidar com processos no próximo vídeo.

@@05
Detalhes

[00:00] Vamos entender algumas particularidades de processos utilizando Elixir. Mas como eu disse, aquela base já é quase o suficiente para entendermos tudo que acontece.
[00:11] Vou limpar o nosso terminal interativo. Eu vou enviar uma mensagem para mim mesmo, para o meu próprio processo, e vou enviar uma tupla: send(self(), {:ok, “Isso é uma mensagem de sucesso”}). Repara no que vai acontecer. Enviei, essa mensagem foi enviada, só que o meu processo continua rodando, IO.puts(“Meu processo está destravado”).

[00:46] A função send não interrompe o nosso processo. O que ela faz é adicionar essa mensagem em uma mailed box, uma caixa de correio do processo destino, vamos chamar assim. Então se eu estou enviando uma mensagem para mim mesmo, eu estou adicionando na minha caixa de correio uma mensagem para que eu possa ler depois.

[01:08] Agora, a macro receive bloqueia a execução do nosso código. Eu vou ter um receive e eu posso ter de novo o pattern matching. No nosso caso, como eu estou mandando uma mensagem de ok, eu vou fazer o match com o atom :ok e em seguida tenho o conteúdo. De novo, podemos ter pattern matching. E vou só exibir o conteúdo, que é a mensagem de sucesso.

[01:33] Eu poderia ter outros critérios, outras mensagens que eu poderia receber. No nosso caso é só essa, então vou finalizar com nosso end. Então repara que ele exibe a nossa mensagem.

[01:50] Mas se eu fizer um receive da mesma coisa e fizer um end, repara que ele não volta para mim, porque não tem nenhuma mensagem lá. Então ele está esperando algum processo enviar uma mensagem para nós.

[02:03] Então se eu tentar digitar nada acontece. Vou dar um “Ctrl + C” e encerrar o meu IEX, porque eu travei o meu processo. O que será que podemos fazer para evitar o travamento? Vou abrir de novo e limpar a tela.

[Aula2_video3_imagem1]

[02:18] Vou fazer um receive sem ter nenhuma mensagem na minha caixa de correios. Vou tentar pegar qualquer coisa e fazer um qualquer_coisa -> IO.puts(qualquer_coisa) dessa qualquer coisa.

[02:32] Só que eu não vou fazer o end. Eu vou dizer after, e então eu posso informar quanto tempo eu vou esperar em milissegundos antes de desistir. E caso passe esse tempo, o que vai acontecer? Então teremos um código que será executado.

[02:49] Com isso eu posso, por exemplo, retornar uma mensagem, posso executar uma função ou alguma coisa do tipo. Eu vou colocar que depois de 1 segundo, ou seja, 1000 milissegundos, eu vou retornar Ok, mas eu vou exibir uma mensagem dizendo 1000 -> IO.puts(“Deu timeout”).

[03:09] Agora vou fazer o end, ele vai esperar e depois de um segundo deu o timeout e ele retorna o que a expressão retorna, ou seja, o meu receive no final das contas retorna alguma coisa também. Ele vai retornar o que foi executado. No nosso caso, IO.puts retorna ok, então conseguimos pegar o retorno.

[03:27] Então isso é uma primeira particularidade dos processos: conseguimos definir um timeout. Conseguimos monitorar processos através do Spawn Monitor, mas precisaríamos de um módulo e seria algo mais complexo, não vamos entrar nisso.

[03:42] Mas o que eu quero mostrar para vocês é como processos funcionam por baixo dos panos. Só que isso tudo é basicamente uma abstração de mais baixo nível para acessar processos. Via de regra vamos lidar com processos em mais alto nível. O que isso quer dizer?

[04:00] Nós vamos utilizar alguma coisa do Mix ou OTP. Por exemplo, vamos utilizar um Agent, um GenServer ou uma Task.

[04:08] Vamos começar com a Task. Basicamente vamos utilizar uma Task quando precisamos executar alguma tarefa em plano de fundo, ou seja, de forma concorrente, paralela, e depois pegar seu resultado.

[04:24] No guia de Task estamos vendo a partir de uma aplicação já criada, então não está tão didático. Podemos tentar acessar a documentação de Task para ver uma forma mais simples de uma tarefa.

[04:37] Basicamente Task é uma tarefa assíncrona, que vai rodar de forma paralela. E eu sei que assíncrono e paralelo pode ser confuso. Eu vou deixar um Para Saber Mais para explicar a diferença entre assíncrono e paralelo.

[04:54] Mas o que fazemos é basicamente muito parecido com o que fazemos com o Process, com o Spawn, quando criamos um processo. Só que agora temos uma abstração um pouco mais simples.

[05:04] Nós realizamos alguma tarefa e conseguimos pegar o retorno disso. Então através de Task.async é como se estivéssemos fazendo o Spawn desse processo. E com await podemos pegar o retorno disso que aconteceu.

[05:19] Então repara que não necessariamente vamos enviar mensagens para um processo ou outro, mas eu posso sim passar parâmetros e etc.

[05:26] Outra forma de executar uma tarefa é através de ter um módulo. Utilizamos o nome do módulo, a função que queremos passar e alguns parâmetros. Isso também é possível. Repara que uma tarefa é uma forma de executar um processo, uma forma um pouco mais amigável, vamos dizer assim.

[05:43] Agora, outras formas de executar processos, que até foram citadas aqui, são Agents e Generic Servers. Já falamos sobre supervisors, que são formas de executar processos, mas essas duas outras formas nós não vimos. Então vamos dar uma olhada pelo menos na definição.

[06:02] Um Agent é basicamente uma abstração de um processo que te permite lidar com o estado. Ele é um processo que fica rodando, ele recebe uma mensagem e te devolve um estado.

[06:18] Então você consegue trabalhar com o estado dessa forma, porque você manda uma mensagem e ele te devolve uma variável que já estava armazenada lá.

[06:26] E você consegue pegar essa variável que estava num módulo, por exemplo, e ter um novo valor adicionado a essa variável. Então você cria uma nova variável, mas é como se estivesse armazenando o estado.

[06:37] Se em algum momento você precisa armazenar estado em uma aplicação, Agent será a saída. Mas não vamos criar Agents.

[06:44] Já um GenServer é uma forma de você enviar e receber mensagens, de ficar executando código de forma infinita, vamos dizer assim.

[06:52] Por exemplo, podemos criar um servidor web como um servidor genérico. Ele fica esperando uma mensagem chegar, e quando uma mensagem chega ele executa determinada função. E isso sim vamos criar para ver como funciona.

[07:08] Através do handle_cast podemos ter pattern matching. O que isso quer dizer? A função handle_cast será chamada sempre que esse processo receber alguma mensagem.

[07:18] E através de pattern matching podemos ter várias funções handle_cast. E definimos qual função será executada e etc.

[07:26] Então basicamente temos abstrações para lidar com processos. “Vinicius, você falou um monte de nomes, ficou tudo mais confuso ainda”. Fica tranquilo, porque a ideia é te mostrar que essas abstrações existem. Nós vamos utilizando-as conforme forem necessárias.

[07:41] Por enquanto vamos focar na ideia base de processos. Processos podem ser criados, podemos enviar e receber mensagens, definir timeout, monitorar processos e etc. Em cima dessa base existem abstrações. E conforme a necessidade surgir, vamos utilizá-las.

[07:58] Mas já estamos fazendo bastante coisa no nosso terminal interativo. Vamos voltar um pouco para o Mix e ver como podemos utilizá-lo da forma mais básica possível. No próximo capítulo conversaremos um pouco sobre tarefas do Mix.

@@06
Para saber mais: Async vs Paralelo

Existe uma certa confusão entre os termos "Programação Assíncrona" e "Programação Paralela".
No vídeo a seguir há uma explicação e exemplos de quando cada uma das técnicas é interessante. Isso pode ajudar a deixar os conceitos mais claros.

https://youtu.be/zLfXPSeCkB8

@@07
Faça como eu fiz

Chegou a hora de você seguir todos os passos realizados por mim durante esta aula. Caso já tenha feito, excelente. Se ainda não, é importante que você execute o que foi visto nos vídeos para poder continuar com a próxima aula.

Continue com os seus estudos, e se houver dúvidas, não hesite em recorrer ao nosso fórum!

@@08
O que aprendemos?

Nesta aula, aprendemos:
Aprendemos a criar processos em Elixir;
Vimos como processos se comunicam;
Entendemos que processos são a base de uma aplicação em Elixir;
Conhecemos detalhes sobre processos.

####

@03-Mix Tasks

@@01
Criando um código

[00:00] Bem-vindos de volta a mais um capítulo desse treinamento, onde estamos aprendendo um pouco sobre o ecossistema do Elixir e como uma aplicação é criada realmente, ao invés de executar somente códigos isolados. E falando nisso, vamos voltar para o nosso projeto Mix e escrever algum código que já saibamos escrever utilizando o próprio Elixir.
[00:19] Eu vou criar dentro de “lib”, porque de novo, por convenção todo nosso código vai viver em “lib”. É nesse local que o Mix vai procurar nossos módulos. Vou criar um novo módulo, só que eu vou criá-lo dentro de uma nova pasta. Essa pasta já seria criada por padrão se tivéssemos utilizado aquele --sup, de Supervisor.

[00:38] Como não utilizamos, eu vou criar uma pasta com o mesmo nome do nosso projeto, que é “elixir_teste”. Todo nosso código estará dentro dessa pasta. O módulo principal normalmente não será utilizado.

[00:55] Eu vou ter um novo módulo chamado “escreve_numero_aleatorio.ex”. Repare que eu escrevi o nome do arquivo com underline, seguindo a convenção. Já o meu módulo será utilizado primeiro defmodule ElixirTeste, que é o nome do nosso módulo principal, seguido de .EscreveNumeroAleatorio.

[01:20] E o que esse módulo vai fazer? Teremos uma função que escreve um número aleatório em algum arquivo que vamos criar.

[01:27] Vou criar uma função def escreve, por exemplo, que poderá esperar o caminho de um arquivo, talvez. Mas por enquanto não vou esperar o caminho desse arquivo e vou escrever um arquivo já pré-determinado.

[01:41] Onde esse arquivo estará? Agora entra outro detalhe. Quando estávamos trabalhando com arquivos avulsos, o arquivo que estávamos manipulando e o nosso código estavam no mesmo local.

[01:52] Já em um projeto, é uma recomendação que mantenhamos nossos arquivos em um diretório chamado “priv”. Inclusive, conseguimos até acessar este diretório diretamente do código através de um detalhe.

[02:06] Para fazer o caminho desse arquivo eu vou criar uma variável, e será a junção de caminho_arquivo = Path.join([:code.priv_dir].

[02:18] O que isso está pegando? Através do nosso código, :code é algo que já existe no Erlang. A Virtual Machine do Erlang nos fornece isso, e dentro disso nós temos algumas funções.

[02:34] Essa função priv_dir pega o diretório privado de alguma aplicação. E o nome da nossa aplicação é (:elixir_teste): Perfeito, pegamos o nosso código privado e vamos passar o nome do arquivo em si, que será ’arquivo.txt’ mesmo. Vou quebrar a linha para ficar um pouco melhor de ler. Então eu estou unindo tudo em um caminho só.

[03:00] Então vai ser basicamente o caminho do diretório “priv”, barra o nosso “arquivo.txt”. Esse é o caminho do arquivo.

[03:07] E eu quero escrever, então File.write!. Só que se alguma coisa der errado eu não quero saber, eu quero simplesmente interromper a aplicação, então com exclamação. Nesse caminho arquivo eu quero escrever algum conteúdo. Por exemplo: File.write!(caminho_arquivo, “Número: #{numero_aleatorio}”).

[03:26] E como geramos um número aleatório? De novo, podemos utilizar um detalhe do próprio Erlang. Então através de rand temos um método chamado uniform.

[03:36] Esse método vai gerar um número aleatório uniforme. Eu não vou entrar em detalhes do que é isso, e eu posso especificar um limite, por exemplo, que vai ser entre 1, que é o padrão, e 1000: :rand.uniform(1000).

[03:47] Essa função vai gerar um número aleatório entre 1 e 1000, e eu vou armazenar isso na variável número aleatório: numero_aleatorio = :rand.uniform(1000).

[03:54] Repara que já aprendemos algumas coisas, mesmo sem estarem diretamente relacionadas ao Mix. Estamos acessando algumas coisas que a Erlang fornece para nós, um pouco fora do próprio Elixir, mas claro, nada muito complexo.

[04:06] Então eu consigo pegar detalhes do meu código através desse código :code; eu consigo pegar números aleatórios através do módulo :rand que o Erlang fornece para nós; e por último eu estou escrevendo num arquivo. Simples assim.

[04:20] Repara que a função “escreve” sempre vai escrever no mesmo local, no mesmo arquivo, algum número aleatório. E talvez eu até tenha algum erro, não sei. Como podemos saber? Eu vou executar esse código utilizando o nos\so terminal interativo.

[04:34] Só que tudo isso está dentro de um aplicação do Mix. Então vamos ver uma coisa interessante. No meu terminal eu posso fazer mix help, e a última coisa que ele mostra é como inicializar o IEX, ou seja, nosso terminal interativo, mas utilizando tudo que está nesse projeto. Então vamos fazer isso.

[04:55] Com isso, teoricamente eu tenho acesso a esse “EscreveNumeroAleatorio”. Então vamos testar. Vou copiar e fazer ElixirTeste.EscreveNumeroAleatorio.escreve. E vamos ver se isso retorna algum erro. Ele retornou um ok, o arquivo foi criado e temos um número aleatório.

[05:11] Se eu executar esse mesmo código de novo, agora o número que aparece é outro, 917. Escrevo de novo e o arquivo que vai aparecer é 224.

[05:20] Então agora conseguimos criar um código que já estamos habituados, em Elixir, sem nenhum segredo, e executar dentro do nosso projeto, através do IEX.

[05:29] Só que não é isso que eu quero. Eu quero fazer algo como mix escreve. Eu quero executar algo como isso.

[05:41] Repara que essa tarefa não existe, obviamente. Então como será que eu posso criar uma tarefa do Mix? Veremos isso no próximo vídeo.

@@02
Gerando uma tarefa

[00:00] Já vimos como podemos criar código, que já estamos habituados. Não tem nada especial para criar um módulo que execute uma regra de negócios do seu projeto, por exemplo. É código Elixir dentro de um projeto Mix.
[00:14] Agora vamos criar uma tarefa do Mix. É aí que entra a diferença de um código normal para algo que precisaremos adequar ao projeto.

[00:23] Eu vou criar um arquivo chamado “escreve.ex”. Eu vou definir um módulo com defmodule. E a primeira coisa é que o nome desse módulo importa. Eu vou definir como Mix.Tasks.Escreve. Vou realizar alguma tarefa, então acrescento do.

[00:41] E em seguida vou definir uma função chamada run. Ela precisa receber um parâmetro, um argumento. Só que eu não vou utilizá-lo. Lembra como fazer para ignorar uma variável, algum valor de um patttern matching ou um parâmetro? Adicionando um underline: def run(_) do.

[00:55] Esse código pode ser executado. Eu vou só exibir uma mensagem: IO.puts(“Executando código ‘escreve’”). E finalizei. Agora vamos voltar para o nosso Mix e tentar rodar mix escreve. Ele vai compilar nosso projeto e aparece o “Executando código ‘escreve’”, que foi exatamente o que nós definimos. Ou seja, esse código foi executado. Perfeito.

[01:23] Será que se eu mudar o nome do meu arquivo vai funcionar? Porque repara que o nome do arquivo é o mesmo nome dessa tarefa. Vou renomear meu arquivo para “escrevi.ex”. Se eu executar a mesma tarefa ele de novo vai compilar nosso projeto e tudo continua funcionando.

[01:40] Então será que se eu mudar para Mix.Tasks.Escrevi ele também vai continuar executando a mesma tarefa de forma mágica? Quando eu executo, ele não encontra essa tarefa, e inclusive pergunta se eu quis dizer a tarefa “escrevi”:

[01:56] Vou renomear o arquivo novamente para “escreve.ex” e desfazer no código para Mix.Taks.Escreve.

[02:02] O que o Mix faz quando eu tento executar uma tarefa? Ele vai tentar buscar em todos os nossos módulos em “lib” algum módulo chamado Mix.Tasks. seguido do comando que digitamos, só que em CamelCase. Então se eu digitasse, por exemplo, mix escreve_arquivo, ele tentaria buscar um módulo Mix.Tasks.EscreveArquivo.

[02:24] Então basicamente para criarmos uma tarefa no Mix, algo que será executado diretamente pelo Mix, basta criarmos um módulo Mix.Tasks., seguido do nome da tarefa que queremos e implementar a função run. E poderíamos receber argumentos, mas eu não vou mostrar como fazer o parse desse argumento.

[02:42] Agora vamos fazer com que esse código execute o que eu quero, que é escrever um número aleatório. Então eu vou fazer ElixirTeste.EscreveNumeroAleatorio.escreve. Simples assim.

[02:57] Com isso, toda vez que eu executar o mix escreve, o nosso “arquivo.txt” será alterado. Agora apareceu 394.

[03:05] Vamos executar de novo o mix escreve. Ao invés de 394 agora temos 77, e assim por diante. Vamos escrevendo números aleatórios nesse arquivo a cada vez que executamos essa tarefa.

[03:17] Repara que conseguimos criar uma tarefa que executa um código padrão, uma regra que criamos, um código Elixir normal, sem segredo nenhum.

[03:25] Agora, um último detalhe. Vou limpar a tela e executar um mix help. Vimos que todas as tarefas disponíveis em um projeto aparecem nessa lista. Será que a nossa tarefa “escreve” está nessa lista também? Vamos ver.

[03:38] Ela não está. Como será que podemos fazer para informar o Mix que isso é uma tarefa e que ela precisa estar na nossa lista? Veremos como documentar a nossa tarefa no próximo vídeo.

@@03
Nome da tarefa

Neste vídeo nós vimos como é fácil criar uma tarefa do Mix.
O que define o nome da tarefa, ou seja, o comando que utilizaremos para executá-la?

O nome da função.
 
Alternativa correta
O nome do seu módulo.
 
Alternativa correta! Se um módulo Mix.Tasks.Teste for criado criado, ele será reconhecido como a tarefa mix teste (se tiver a função run/1 implementada).
Alternativa correta
O nome do arquivo onde o módulo está definido.

@@04
Documentando a tarefa

[00:00] Como vimos, essa tarefa “escreve” não está disponível na lista para nós. Então como podemos informar para o Mix que temos essa tarefa?
[00:13] Vamos utilizar o que é conhecido como documentação no código. Existe muito conceito de documentação diretamente no código quando falamos de Elixir, mas eu não vou entrar em muitos detalhes.

[00:24] O que eu vou utilizar são alguns atributos para o meu módulo. Para quem está habituado a programação orientada a objetos, é como se fossem propriedades de uma classe. Como se meu módulo fosse uma classe e tivéssemos um atributo. Não vou dar nome para isso, mas é como se fosse a mesma coisa.

[00:43] Então vou ter primeiro um @moduledoc. Isso é bastante comum até onde não temos tarefa do Mix. Inclusive, repare que o Visual Studio Code já até completou isso para mim. Ele colocou três aspas, que são uma sintaxe para termos uma String com várias linhas. Então essas linhas fazem parte da mesma String.

[01:04] Então poderíamos adicionar uma documentação completa da tarefa, inclusive com exemplos. Por exemplo, quando eu executar no IEX alguma coisa como mix escreve, teremos uma saída de alguma coisa. Posso exemplificar só com mix escreve. Posso fazer algumas coisas assim, exemplificar como pode executar esse código.

[01:30] Se eu salvar, entrar no terminal e fizer o mix help, isso ainda não vai aparecer. Só que existe uma alteração num código. Quando eu executo mix help ele não compila nossos arquivos.

[01:42] Então vou executar o mix compile. É a primeira vez que executamos esse comando. E ele compilou um arquivo que foi modificado, e agora talvez na nossa documentação apareça.

[01:54] Ainda não, não temos o “escreve”. Por quê? Nós temos dois tipos de documentação. Uma documentação será exibida nessa lista; e se eu fizer, por exemplo, mix help escreve, teremos uma documentação completa.

[02:08] Repara que agora já temos a documentação completa da tarefa que escrevemos, inclusive com exemplo de código. Isso é exibido na lista, inclusive com o exemplo estando em outra cor. Então já conseguimos criar parte da documentação. Agora falta aquela documentação curta.

[02:24] Então vamos adicionar uma @shortdoc, que é basicamente aquela linha de documentação. Então vai ficar @shortdoc “Escreve um número aleatório no arquivo.txt”. Basicamente é isso que faremos. Vou precisar compilar, claro.

[02:43] E agora repara que ele está dizendo que eu defini esse atributo do módulo, mas nunca estou utilizando. Então vamos ver na ajuda se a nossa “escreve” aparece. Não aparece ainda.

[02:57] Agora entra outro detalhe. Eu defini um atributo. Só que alguém precisa utilizar esse atributo. Esse @moduledoc já é utilizado pelo próprio Elixir, então perfeito, ele não avisa nada.

[03:09] Só que esse @shortdoc é utilizado pelo Mix. Então precisamos adicionar código do Mix. E lembra como fazemos para adicionar um código no nosso próprio módulo? Já falamos sobre isso. É através da diretiva use.

[03:24] Basicamente eu vou pegar um código que existe em algum lugar e inserir. E esse código será use Mix.Task. Basicamente eu estou pegando o código que define uma tarefa e adicionando no meu módulo.

[03:36] Agora ele vai ler inclusive esse atributo @shortdoc, e ele vai poder até nos dar dicas a mais se fosse o caso. Não será esse o nosso caso.

[03:43] Agora eu vou compilar. Aquele aviso não aparece mais para nós, porque o código use Mix.Task está utilizando o atributo @shortdoc. E ele inclusive vai utilizar esse atributo para exibir a nossa ajuda. Então agora temos o nosso mix escreve na lista, dizendo “Escreve um número aleatório no arquivo.txt”:

[04:01] Dessa forma conseguimos definir uma tarefa no Mix, passamos a utilizar código do Mix e documentamos uma tarefa do Mix. Isso tudo são coisas diferentes. Vou minimizar o terminal para fazermos uma conclusão rápida desse módulo, porque eu me empolguei um pouco de utilizar o Mix agora.

[04:18] Nós criamos um código normal, em Elixir, que escreveríamos no IEX, ou seja, executaríamos direto, que rodaria com o Elixir para compilar esse módulo de forma isolada; é um código comum. E passamos a utilizá-lo em um projeto do Mix, no IEX mesmo, utilizando -S mix. Perfeito, começamos bem.

[04:37] Depois criamos uma tarefa do Mix, um código que o próprio Mix vai executar. E vimos um pouco sobre documentação de código. Lembra que eu falei que muito daquela documentação das dependências pode ser gerada através do código? Isso que eu fiz usando @moduledoc é uma das formas de gerar aquela documentação.

[04:54] Não é a única, existem mais atributos que podemos utilizar, mas essa é uma forma. Então está aqui um início de uma bela jornada que você pode seguir até mesmo sem eu te mostrar. Você pode pesquisar mais de como documentar código, de como gerar mais tarefas, de como parsear argumentos. Esse é só o início para começarmos a trabalhar com Mix.

[05:12] Agora vamos fugir um pouco desse assunto de tarefa e criar uma aplicação que talvez execute algum servidor, que algum código fique esperando alguma mensagem, alguma coisa desse tipo.

[05:22] Vamos ver como criar realmente uma aplicação com Supervisor Tree utilizando Mix no próximo capítulo.

@@05
Para saber mais: Documentação

Neste vídeo nós documentamos nossa tarefa, mesmo que não de forma completa ainda.
Documentação é algo que faz parte diretamente do ecossistema Elixir. É extremamente incentivado que tenhamos boas documentações em nossos códigos para torná-los mais acessíveis a outras pessoas que os utilizarão. Tanto é que há uma parte sobre escrever documentação na própria documentação do Elixir. Você pode conferir aqui:

Writing Documentation
Se quiser entender um pouco melhor sobre as anotações utilizadas no código, esse guia pode te ajudar:

Module attributes

https://hexdocs.pm/elixir/writing-documentation.html

https://elixir-lang.org/getting-started/module-attributes.html

06
Faça como eu fiz

Chegou a hora de você seguir todos os passos realizados por mim durante esta aula. Caso já tenha feito, excelente. Se ainda não, é importante que você execute o que foi visto nos vídeos para poder continuar com a próxima aula.

Continue com os seus estudos, e se houver dúvidas, não hesite em recorrer ao nosso fórum!


@@07
O que aprendemos?

Nesta aula, aprendemos:
Vimos que podemos criar um código "comum" em projetos Mix;
Aprendemos a criar uma tarefa do Mix;
Aprendemos um pouco sobre documentação em Elixir.