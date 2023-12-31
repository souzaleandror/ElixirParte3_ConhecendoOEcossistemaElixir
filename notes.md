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

#### 10/09/2023

@04-Aplicação

@@01
Projeto da aula anterior

Caso queira, você pode baixar aqui o projeto do curso no ponto em que paramos na aula anterior.

https://github.com/alura-cursos/2323-elixir-3/archive/refs/tags/aula-3.zip

@@02
Instalando uma dependência

[00:00] Bem-vindos de volta a mais um capítulo desse treinamento, onde finalmente vamos criar uma aplicação utilizando Elixir. Eu quero te contar o que nós vamos criar. Eu quero criar uma aplicação que fique rodando e de minuto em minuto ela escreva um novo número aleatório naquele arquivo.
[00:16] Ou seja, eu vou criar uma aplicação onde temos alguma coisa que fica de minuto em minuto enviando uma mensagem para um outro processo, que de minuto em minuto recebe essa mensagem. Só que ele pode receber essa mensagem a qualquer momento.

[00:30] Então o que precisaremos fazer? Temos um processo que agenda tarefas, e temos outro processo que recebe alguma mensagem, e quando recebe essa mensagem escreve no arquivo. Repara que teremos um projeto super simples, mas vai dar para dar uma boa visão de como funcionam processos, GenServers, Supervisor e etc. Só que antes de ver sobre Supervisor, sobre um servidor, vamos entender como funciona para utilizarmos uma dependência.

[00:58] Eu falei que eu quero ter um processo que de minuto em minuto mande uma mensagem, ou execute algum código. Eu não vou criar um loop ou uma recursão que espera um minuto e depois executa algum código. Eu vou utilizar um pacote que já fez isso para mim, um pacote que eu possa utilizar e simplesmente agende tarefas.

[01:18] Para quem conhece o mundo de administração de servidores pode se lembrar do cron, que é uma ferramenta que agenda tarefas. Então será que tem alguma coisa direto no Elixir que se assemelha ao cron? Vou pesquisar por cron no hex.pm, que é o local onde pesquisamos bibliotecas.

[01:39] O primeiro pacote que é exibido está dizendo que ele é feito para parsear e formatar Strings no formato cron. Não é isso que eu quero. Eu não quero calcular quando algo vai ser executado, eu quero executar, quero um agendador de tarefas.

[01:53] Então esse Quantum parece ser exatamente isso. E repara que ele tem quase 300 mil downloads recentes. Isso é ótimo, parece ser uma biblioteca bastante utilizada. Vou clicar sobre o quantum.

[02:05] E como será que utilizamos isso? Como primeiro buscamos isso para o nosso pacote? Eu vou na parte direita da tela e vou copiar a primeira opção, porque eu sei que eu tenho esse arquivo “mix.exs”.

[02:15] Se eu tivesse algum outro tipo de projeto com um arquivo “rebar.config”, eu copiaria o de baixo. Se eu estivesse utilizando o Erlang com make eu utilizaria outro.

[02:23] Enfim, eu estou utilizando o Mix, então vou copiar a parte correspondente ao “mix.exs”. E onde eu instalo ou adiciono isso? Vamos para o nosso projeto, porque repara que nessa página não tem nada informando como instalar. Logo veremos sobre documentação.

[02:36] Mas voltando para o nosso projeto, no nosso “mix.exs” eu posso adicionar essa dependência. Então vou tirar o comentário e adicionar a dependência.

[02:48] Repara que eu estou informando somente a versão que eu vou utilizar desse pacote chamado quantum. Eu não estou dizendo de onde ele vai buscar. Então ele vai buscar naquele hex.pm.

[02:58] Se eu quisesse buscar de algum repositório específico, eu poderia utilizar esse formato, nós não vamos utilizar isso nesse treinamento, então vou apagar essa parte.

[03:07] Agora, nesse momento eu defini uma dependência. Significa que eu já posso utilizar essa dependência? Ainda não. Inclusive, ele diz que se eu quiser aprender mais eu devo executar o comando mix help deps.

[03:18] Só que eu já sei o que eu quero fazer. Eu quero realizar mix deps.get. Eu quero buscar todas as dependências que foram definidas. Quando eu executo esse comando ele vai ler a função dependências e vai buscar o nosso projeto que é necessário.

[03:33] E repara que esse projeto quantum precisa de alguns outros. Ele precisa do “gen_state” e daquele “crontab” que vimos anteriormente, porque ele vai parsear aquela String que vamos informar para ele no formato cron e depois executar alguma coisa.

[03:46] Então o quantum é um projeto que possui dependências. E essas dependências já foram buscadas para nós. Então está tudo já adicionado no nosso projeto.

[03:56] Teoricamente eu já tenho uma dependência pronta para utilizarmos. Mas como utilizamos essa dependência? Vamos entrar na documentação. Primeiro ele mostra como adicionar na sua lista de dependências, e já fizemos isso.

[04:13] Agora temos que criar um scheduler para o nosso aplicativo, para nossa aplicação. Então vamos criar um agendador. Vou entrar em “lib > elixir_teste” e criar um arquivo chamado “agendador.ex”.

[04:29] Vou definir um módulo com defmodule. Esse módulo será o nome do nosso projeto com o nome que estamos criando agora, então ElixirTeste.Agendador.

[04:40] O que esse agendador fará? Ele vai utilizar o quantum. Isso quer dizer que ele vai pegar todo o código que está nesse módulo quantum e adicionar no nosso módulo, informado como parâmetro qual é a aplicação. Então vamos adicionar o nome da nossa aplicação. Ao invés de :your_app vamos adicionar o nome da nossa aplicação: use Quantum, otp_app: elixir_teste.

[05:02] Esse otp é Open Telecomunication Platform. É basicamente uma plataforma aberta de telecomunicação. É algo que o Erlang fornece para nós. Então no final das contas vamos gerar uma aplicação do Erlang.

[05:17] Mas não precisa se atentar a esses detalhes. Basicamente o que estamos informando é o nome da nossa aplicação.

[05:23] Continuando na documentação, em seguida ele está informando que eu vou adicionar no Supervision Tree esse nosso scheduler. Mas aí complicou. Lembra que executamos o mix new sem o --sup? Então nós não temos esse nosso Supervision Tree. Nós não temos uma aplicação ainda criada.

[05:43] É exatamente isso que precisamos fazer: precisamos criar uma aplicação para então adicionar esse nosso agendador nos filhos do Supervision Tree.

[05:52] Então agora as coisas começam a complicar. Nós faremos exatamente isso: criaremos uma aplicação no próximo vídeo.

@@03
Termo OTP

Vimos neste vídeo o termo "OTP" que foi utilizado para criar o módulo agendador do nosso projeto.
O que significa a sigla "OTP" neste contexto?

One True Pairing
 
Alternativa correta
Open Telecom Platform
 
Alternativa correta! OTP é um conjunto de bibliotecas que são disponibilizadas com Erlang. O conceito de Supervision tree vem desta plataforma, por exemplo.
Alternativa correta
One Time Password

@@04
Criando uma aplicação

[00:00] Dando uma olhada na documentação do Quantum, que é uma biblioteca externa, temos a primeira visualização do que é uma aplicação do Mix. Precisamos criar exatamente isso: uma aplicação, que ainda não temos.
[00:16] Inclusive, vamos abrir o nosso código e entrar em “mix.exs”. Repara que na parte de application tudo que eu tenho é aplicações extra, ou seja, eu não estou informando qual é a nossa aplicação. E fica uma dica: se você quiser, pausa esse vídeo e dá uma olhada no comando mix help compile.app.

[00:37] Isso vai mostrar um monte de coisa sobre aplicações Elixir. Vale a pena dar uma lida. Eu não vou fazer isso, porque você pode fazer por você mesmo. Mas basicamente esse comando vai mostrar todos os parâmetros em application que podemos ter.

[00:52] Continuando, nós temos extra applications, e precisamos informar alguma coisa que seja uma aplicação real. Como será que fazemos isso?

[01:01] Primeiro vamos criar nossa aplicação. Vou criar um novo arquivo chamado “aplicacao.ex”. E vamos pegar como exemplo o que temos na documentação. Eu vou definir um módulo, com o nome que eu quiser, e ele vai utilizar application, e esse código que vai ser inserido chama o start. Então vamos copiar isso e fazer as modificações que precisar.

[01:25] Vou colar no “aplicacao.ex” e ao invés de Acme.Application vou mudar para Acme.Aplicacao, porque é como eu estou chamando esse arquivo. Vou acertar a indentação. Estou utilizando a aplicação, ou seja, estou inserindo nesse módulo todo código em aplicação.

[01:42] Esse código em aplicação chama uma função chamada start. Em seguida temos o tipo da aplicação e os argumentos que essa aplicação pode receber.

[01:52] Não vamos utilizar nenhum argumento nem nada do tipo, e o tipo de aplicação não importa para nós, por isso tudo começa com underline. Em seguida temos os filhos desse Supervisor Tree. Inclusive, não é Acme.Aplicacao, e sim ElixirTeste.Aplicacao, que é o nome do nosso projeto.

[02:13] E ao invés de Acme.Scheduler, vou trocar para ElixirTeste.Agendador. Esse é o nome do primeiro processo que esse supervisor vai cuidar.

[02:25] Então repara que eu estou adicionando filhos de um supervisor. Eu posso utilizar vários, e eles serão utilizados quando eu inicializar um supervisor. Então repara que eu estou inicializando um novo processo através do módulo Supervisor.

[02:48] Eu estou informando a estratégia de supervisão que vamos utilizar nesse Supervisor. Basicamente a estratégia é quando um processo morrer, outro processo será criado, e somente um.

[02:59] Então vou manter a estratégia :one_for_one porque parece fazer sentido para mim.

[03:02] E eu posso criar um nome para esse supervisor. Vou chamá-lo de ElixirTeste.Supervisor, que é um nome que veremos mais para frente onde ele pode aparecer. Basicamente isso é como definimos uma aplicação. Parece fazer sentido.

[03:18] Agora, como o Mix sabe que esse módulo é o que contém a nossa aplicação? Vamos informar isso para ele no “mix.exs”. Na parte de application, além de aplicações extras eu vou informar qual é o módulo que vamos utilizar: mod: {ElixirTeste.Aplicacao, []}. E eu posso ter parâmetros que vou informar. Nesse caso não preciso informar parâmetro nenhum.

[03:43] E como eu sei que é esse parâmetro que precisamos passar, que é uma tupla e etc? Vamos dar uma olhada rapidamente no comando mix help compile.app.

[03:53] Quando eu executo esse código ele mostra que um módulo pode ser usado dessa forma, mas ele também explica o que é esse parâmetro módulo.

[04:01] Ele específica qual é o módulo que será invocado quando a aplicação for inicializada. E ele precisa estar no formato de uma tupla, onde informamos o módulo e os argumentos. E normalmente esses argumentos são uma lista vazia. A partir daqui eu sei o que fazer.

[04:17] Temos a definição de uma aplicação. Essa aplicação já pode inicializar alguma coisa, só que ainda faltam algumas coisas, principalmente relacionadas a agendar essa tarefa. Nós só criamos a nossa aplicação, mas essa tarefa ainda precisa ser agendada, porque temos na documentação a parte “Usage” do nosso Quantum.

[04:37] Ou seja, nós não estamos utilizando o Quantum. Nós só criamos uma aplicação para conseguir definir o nosso agendador. No próximo vídeo voltamos para efetivamente agendar uma tarefa para ser executada.

@@05
Papel da aplicação

Neste vídeo nós finalmente começamos a criar uma aplicação real usando Elixir. Nós definimos o módulo principal de nossa aplicação.
Qual o papel do módulo principal de uma aplicação Mix?

Executar o código principal do nosso domínio.
 
Alternativa errada! Não é neste ponto que escrevemos código de domínio
Alternativa correta
Definir as dependências e configurações do projeto.
 
Alternativa correta
Inicializar a Supervision Tree.
 
Alternativa correta! O módulo inicial de uma aplicação inicializa a supervision tree dela, ou seja, cria um processo que vai supervisionar os demais processos desta aplicação. Existe um outro tipo de aplicação que usa o conceito de Umbrella, mas isso não será abordado neste treinamento.

@@06
Agendado uma tarefa

[00:00] Vamos entender rapidamente o que fizemos no último vídeo. Nós criamos um novo módulo, que está definindo uma função e não estamos chamando essa função em nenhum momento. Mas vamos ver o que essa função faz. Ela define um array de children, onde temos um agendador, o outro módulo que criamos. E temos também uma keyword list de opções. Temos uma estratégia e um nome.
[00:26] Só que essas duas variáveis estão sendo passadas para uma função do módulo Supervisor. Então a linha Supervisor.start_link(children, opts) está inicializando um Supervisor Tree, está criando um novo Supervisor. Basicamente é isso que está acontecendo.

[00:40] Então o que esse supervisor faz? Ele pega tudo que está em children e inicializa como um processo, utilizando essas opções que passamos. Uma dessas opções é a estratégia desse supervisor. O que queremos dizer com estratégia? Sempre que tivermos um processo que morreu, ele vai criar só um outro, então é one_for_one. Se um processo morreu, crio outro.

[01:04] E estamos dando um nome para esse supervisor. Já veremos o motivo para isso. E com isso criamos nosso Supervisor.

[01:10] Mas de novo, nós não chamamos a função start em nenhum momento. Quem chama é alguma função do módulo Application. E onde executamos essa função do módulo Application? Em “mix.exs”.

[01:23] Quando colocamos nossa aplicação para rodar utilizando Mix ele virá nessa função Application, ver o que tem em módulo, ou seja, ele pega esse módulo e sabe que vai executar a função desse módulo. Repara que as coisas começam a se juntar.

[01:38] Outro detalhe é: o nosso supervisor inicializa um processo de agendador. Só que qual função ele chama de agendador? Como ele sabe enviar mensagens ou receber mensagens desse agendador?

[01:50] Esse agendador está definido como um servidor. Só que não precisamos fazer essa configuração. Não precisamos nem saber que isso foi feito, porque tudo foi feito pelo Quantum.

[02:00] Então essa é a vantagem de utilizar uma biblioteca externa. Ele nos poupou de entender alguns detalhes antes da hora. Isso é bem interessante.

[02:07] Agora que isso tudo está claro, temos nosso agendador pronto para ser utilizado, mas ainda não estamos utilizando ele. O que está faltando é configurar os nossos Jobs, as nossas execuções, o nosso cron propriamente dito.

[02:20] Então vamos olhar na documentação como podemos fazer isso. Nós vimos a parte de Setup, então listamos nas dependências, criamos um scheduler, adicionamos na Supervision Tree. Foi isso que fizemos no vídeo passado.

[02:34] Agora temos a parte de resolução de problemas, ou Troubleshooting. Mas nós ainda nem executamos para ter algum problema.

[02:40] Então vamos para a parte de Usage. Para chegarmos nesse Usage temos que fazer algumas coisas.

[02:46] Primeiro devemos ter um arquivo de configuração e adicionar isso tudo nesse arquivo. Nós não temos esse arquivo de configuração ainda. Para que ele serve? Algumas dependências, algumas bibliotecas ou nosso próprio código podem utilizar configurações que são definidas por padrão nesse arquivo.

[03:06] E para que isso é útil? Para mudarmos alguns detalhes e não precisarmos recompilar nossa aplicação inteira. Então isso é bem interessante. Vamos criar esse arquivo, chamado “config.exs”, na pasta config.

[03:23] Então temos a função config, que espera como parâmetro o nome do nosso projeto, o módulo que estamos configurando, que é o config :elixir_teste, ElixirTeste.Agendador, e em seguida as configurações que vamos passar.

[03:40] No nosso caso vai ser os Jobs, que vai ser um array. Repare que na documentação é isso que ele passa. Ele passa uma função, o primeiro parâmetro é um átomo com o nome do nosso projeto; o segundo parâmetro é o módulo que estamos configurando; e o terceiro é a configuração em si, uma keyword list.

[03:57] O que o nosso agendador espera de configuração? Os Jobs. Então definimos os Jobs, que serão um array. Só que repare que isso é uma função config. Quem vai chamar essa função config? De novo precisamos inserir código, através do use.

[04:15] Então vamos fazer use Mix.Config. Teoricamente é só isso que precisamos para executar essa função config. Agora vamos configurar realmente os nossos Jobs. Cada um dos Jobs precisa ser uma tupla, com a String do nosso cron e o que vai ser executado.

[04:37] Se você não estiver habituado com o formato da String cron, não tem problema. Eu vou deixar até um Para Saber Mais mostrando um site em que você altera uma configuração e ele mostra quando aquilo vai ser executado. Mas basicamente se temos tudo com asterisco isso será executado de minuto em minuto.

[04:54] E agora vamos criar uma função que faz alguma coisa. E por enquanto esse alguma coisa vai ser só exibir uma mensagem, como por exemplo, “Executando tarefa agendada”.

[05:04] Teoricamente é só isso que precisamos para ter as configurações realizadas. Então vamos executar o mix help para primeiro ver se esse arquivo não está com nenhum erro. Como ele exibiu ajuda eu sei que ele não está com erro. E ele mostra o mix run, que inicializa e roda a aplicação atual.

[05:24] Então vamos tentar rodar o mix run. Ele vai rodar, está compilando os arquivos, ele pegou o crontab, está fazendo tudo que tem que fazer, adicionou tarefa e encerrou a aplicação. Porque não tem nenhum serviço nem nenhum processo rodando, nenhum processo acontecendo.

[05:43] Então ele simplesmente encerra. Ele não deixa a aplicação rodando, porque não tem mais nenhum processo vivo. Só vai ter algum processo executando algo daqui a um minuto, que foi quando agendamos.

[05:52] Então podemos fazer algumas coisas, por exemplo, mix run --no-halt. Ele vai fazer exatamente a mesma coisa que aquele mix run, ele vai pegar aquele mix.exs, vai compilar todos os arquivos, vai gerar uma aplicação do Erlang com todas as configurações que fizemos na aplicação, vai rodar aquele nosso módulo principal.

[06:17] Aquele módulo principal inicializa aquela nossa Supervision Tree. E a partir disso temos aquele nosso cron que daqui a um minuto vai inicializar uma tarefa. Então isso vai levar mais um tempo. Daqui a alguns segundos eu volto para ver se aquela mensagem foi exibida.

[06:33] E agora repara que ele mostrou executando a tarefa agendada. Depois de algum tempo, às 14:19 ele executou essa tarefa. Então perfeito, o nosso cron está funcionando.

[06:43] Antes de continuar eu vou encerrar essa aplicação e mostrar outra coisa. Eu vou inicializar dentro do IES, e repara que ele começou a nossa aplicação. E eu posso executar código, utilizar algum módulo que definimos no nosso código, eu posso fazer tudo que eu faria normalmente dentro de um projeto.

[07:02] Só que eu vou dar um código um pouco peculiar, vamos dizer assim: :observer.start. Repara que ele começa com dois pontos, então eu sei que isso vem do Erlang.

[07:11] Quando eu executo isso ele abre uma tela, que basicamente é um monitor do sistema, só que da nossa Virtual Machine, do nosso Erlang. E na aba “Applications” podemos ver tudo que está rodando, inclusive a nossa aplicação elixir_teste.

[07:32] Repara que existe o supervisor do próprio Erlang, que criou para nossa aplicação, e ele está vendo o nome que definimos, que é “ElixirTeste.Supervisor”, e é o que aparece agora. Vou mostrar de novo: em “aplicacao.ex”, definimos esse nome ElixirTeste.Supervisor.

[07:51] E dentro dele ele está chamando o processo Agendador. Então como esse agendador utiliza o Quantum, repara na quantidade de coisa que ele está executando e monitorando. E esse tanto de coisa está sendo monitorado pelo agendador.

[08:15] Não sei se você consegue ver, mas na parte de baixo tem o PID, que está 216. Eu vou encerrar o “ExecutionBroadcaster”. Repara que depois de um tempo ele dá uma atualizada. Eu clico de novo e o PID mudou. Agora é 279, porque esse processo morreu, só que como o agendador também é um supervisor, ele já inicializa um novo. Então por isso que o Elixir é tão potente. Ele tem várias ferramentas para cuidar disso.

[08:43] Agora, para finalizar esse capítulo com chave de ouro eu quero criar um novo processo que recebe mensagens desse agendador. Que mensagem ele vai receber? A mensagem para escrever um número aleatório naquele arquivo. Só que isso tudo vamos fazer no próximo vídeo.

@@07
Para saber mais: Observer

Neste vídeo nós utilizamos o comando :observer.start para analisar detalhes de nossa aplicação, mais especificamente, quais os processos rodando.
O observer faz parte da Erlang e por isso o acessamos através de um Atom já criado, prontinho para nós.

Se quiser saber mais detalhes sobre o Observer ou sobre depuração no geral, você pode conferir esta seção do guia:

Debugging
Se você não estiver familiarizado(a) com o conceito de depuração (debug), pode conferir este vídeo:

https://elixir-lang.org/getting-started/debugging.html

https://youtu.be/CDwdjspV4wc

@@08
GenServer

[00:00] Já temos praticamente tudo que precisamos para que esse nosso agendador mande uma mensagem para algum outro processo e esse processo escreva um número aleatório naquele nosso arquivo.
[00:11] Então só falta esse outro processo, que vai receber uma mensagem de alguma forma, e essa mensagem ele vai utilizar para depois escrever um número aleatório naquele arquivo.

[00:22] Já que faremos isso nós precisamos de alguma abstração, de um processo. Precisamos criar um processo que recebe as mensagens e chama esse nosso “escreve_numero_aleatorio”.

[00:35] Eu vou criar então uma abstração de um processo que já falamos. Nós falamos sobre Tasks, Agents e GenServers, ou seja, um servidor, que fica ouvindo mensagens. Vamos criar exatamente isso.

[00:46] Vou criar um arquivo chamado “servidor_aleatorio”. Você obviamente pode dar um nome melhor do que isso, mas é esse que eu vou criar. Então vou criar nosso módulo: defmodule ElixirTeste.ServidorAleatorio do.

[00:59] Como eu disse, isso será um servidor. Assim como o que é uma aplicação está utilizando o que é uma aplicação; o que é uma configuração usa mix config; o que é uma Task usa o mix task; então estamos utilizando módulos que já existem para definir esse tipo de abstração.

[01:20] Então para definir isso é um GenServer eu vou usar um módulo GenServer: use GenServer. E o que isso faz na prática? Isso pega todo o código que está no módulo de GenServer e adiciona aqui. Simplificando é isso. Esse módulo GenServer vai chamar uma função chamada start_link: def start_link(_) do.

[01:40] O que é essa função? Vou abrir de novo a nossa aplicação. É o que inicializa um processo. Como o nosso supervisor tem o start_ link, o nosso GenServer também tem. E o que faremos é exatamente isso: chamaremos o start_link do GenServer, que espera três parâmetros: GenServer.start_link().

[01:56] O primeiro parâmetro é um módulo que vai inicializar o servidor em si. Então vamos pegar esse nódulo atual de ServidorAleatorio: GenServer.start_link(ElixirTeste.ServidorAleatorio, ).

[02:04] Depois podemos passar uma mensagem inicial ou algo que será passado para uma inicialização desse servidor. Vamos passar só um :ok.

[02:11] E agora podemos passar algumas configurações, por exemplo, o nome desse servidor. Isso é uma keyword list e vamos passar como parâmetro o servidor aleatório: GenServer.start_link(ElixirTeste.ServidorAleatorio, :ok, name: :servidor_aleatorio).

[02:23] Então esse é o nome do nosso servidor. Em todo lugar que precisemos fazer alguma coisa com ele nós podemos utilizar esse nome.

[02:29] Agora só para simplificar um pouco, quando precisamos referenciar o próprio módulo dentro do módulo podemos utilizar o seguinte: __MODULE__.

[02:41] Inicializei meu servidor, e de novo, o segundo valor, o :ok, pode ser passado para uma função de inicialização.

[02:47] Então eu posso ter uma função init que recebe algum parâmetro. Nesse caso eu vou fazer o Pattern Matching com o ok: def init(:ok) do. Então essa função só será chamada com esse ok.

[02:57] Não precisaremos fazer nada, mas basicamente eu posso informar que a inicialização foi ok, deu tudo certo, então eu retorno o ok. E eu posso informar o estado inicial desse servidor. O que isso quer dizer?

[03:08] Um servidor pode armazenar estado por algum motivo. Se eu quiser ter um servidor que tem um contador, por exemplo, eu posso iniciar esse contador com 0, ou então ter um mapa dizendo que o número é 0. Mas no meu caso eu não vou ter nada, eu não vou armazenar estado, então vou ter um mapa vazio:

[03:26] Continuando, eu posso ter respostas para mensagens. Existem várias mensagens que podem chegar. Então como eu reajo a alguma mensagem depende do caso.

[03:36] Se for uma mensagem de informação eu tenho uma função chamada handle_info, quando o processo está inicializando, quando o processo vai morrer e etc. Basicamente tudo chega aqui.

[03:46] Agora, eu tenho uma função que é executada quando chega uma mensagem síncrona. O que isso quer dizer? Chega uma mensagem e eu preciso devolver algo na hora. Ou seja, o outro processo vai meio que me esperar.

[03:59] E temos algo que é assíncrono, em que na verdade um processo vai mandar mensagem e não precisa esperar a resposta. Então é isso que vamos criar.

[04:07] E essa função recebe um parâmetro, que vai ser a mensagem enviada, pode ser qualquer coisa, e depois algumas opções, com as quais não vamos nos importar.

[04:17] Só que de novo, esse servidor pode receber várias mensagens. Então como eu vou saber que eu só quero executar essa função quando a mensagem for para escrever algo? Então vou passar a receber uma mensagem que será o átomo escreve. Então basicamente quando alguém enviar uma mensagem e o valor for escreve eu executo essa função.

[04:35] Se eu quisesse ter outra, por exemplo, quando eu inicializo, quando eu escuto algo, eu poderia ter algo assim. Então só terei uma função para receber a mensagem escreve. Ou seja, estou utilizando Pattern Matching.

[04:47] Então sempre que alguém mandar uma mensagem para esse processo com a mensagem escreve, eu vou fazer ElixirTeste.EscreveNumeroAleatorio.escreve. Eu vou escrever o número aleatório naquele arquivo.

[05:00] Só tem um último detalhe dessa função, ela precisa informar se ela quer responder essa mensagem, ou seja, se ela quer enviar uma mensagem de volta, e qual é o estado da aplicação, qual o estado do servidor depois dessa execução.

[05:14] Lembra que inicialmente nosso estado era vazio? Ele vai se manter vazio, eu não estou fazendo nada com ele, eu não estou utilizando estado.

[05:21] Então eu vou dizer que não quero responder nada e que o estado é vazio: {:noreply, %{}}. Se eu quisesse responder, esse novo estado poderia ser retornado para quem chama essa mensagem. Nós não faremos isso nesse treinamento.

[05:30] Continuando, eu tenho teoricamente um servidor pronto já para ser utilizado. Como eu mando mensagem para esse servidor? Eu preciso de algum módulo que se comunique, que saiba mandar mensagens para processos. E é justamente o GenServer.

[05:45] Então na nossa configuração, ou seja, no nosso cron job eu vou utilizar o GenServer para fazer um cast. Ou seja, ele envia uma mensagem e não espera a resposta. E para qual servidor ele vai mandar? Para aquele servidor aleatório. Vou até copiar o nome para garantir que eu não estou escrevendo errado. Isso é uma coisa chata que podemos pensar em como resolver daqui a pouco.

[06:07] E que mensagem eu quero enviar? Eu poderia mandar qualquer valor, uma tupla, uma lista, um mapa, mas eu vou enviar o escreve, porque é isso que a função handle_cast está esperando através do Pattern Matching.

[06:19] Com isso, de minuto em minuto esse servidor aleatório vai receber a mensagem escreve. Então teoricamente eu já tenho tudo pronto para executar minha aplicação.

[06:28] Só falta um detalhe, mas vamos executar para você ver qual é esse detalhe. Vamos executar dentro do IEX, porque eu quero inicializar o meu :observer.start.

[06:44] Inicializado, vamos entrar na aba de aplicações. Quando eu clico em “elixit_teste”, repara que eu só tenho o processo do meu agendador. O processo do servidor aleatório não foi inicializado.

[06:54] Então vou abortar a execução. Repara que aquele observer já fechou também. Qual é o detalhe que está faltando? Na minha aplicação eu estou inicializando o processo do agendador, mas eu não inicializei esse servidor aleatório. Então vamos inicializá-lo: ElixirTeste.ServidorAleatorio.

[07:17] Teoricamente isso agora é tudo que eu preciso para ter os dois processos e para que eles se comuniquem. Então de novo vou inicializar o IEX. Está rodando. Teoricamente às 03:43 esse “arquivo.txt” precisa ser alterado.

[07:30] Então vamos exibir :observer.start. E vamos ver se todas as aplicações foram carregadas. A aplicação apareceu e o meu servidor chamado servidor aleatório está carregado também.

[07:45] Inclusive, eu posso matar esse servidor que o meu Supervisor vai subir ele de novo. Eu só vou esperar mais um pouco para bater as 03:43 e aquele arquivo ser escrito.

[07:55] Depois que ele for escrito eu vou matá-lo para mostrar que o PID vai mudar, só que o processo vai continuar existindo, porque temos um supervisor cuidando dele.

[08:06] O processo aconteceu, então agora vamos no arquivo. E repare que ele foi modificado e exibiu a mensagem, e agora o número é 16. De novo, eu tenho dois processos embaixo do meu Supervisor. Se eu matar o meu servidor aleatório, ele não morre. O PID era 223, e quando eu volto depois de matar e olho de novo agora é 275.

[08:28] Ou seja, o processo foi morto, só que o outro já foi criado imediatamente depois, porque eu tenho um supervisor cuidando desse servidor.

[08:36] Por isso, se eu vier no meu servidor e executar um código escreve e esse escreve morre porque o arquivo não está acessível, o arquivo não existe naquele momento ou algo assim, não tem problema, esse processo será criado de novo e minha aplicação não sai do ar por causa disso.

[08:51] Então essa é beleza de se utilizar Elixir e de se utilizar vários processos para ter a mesma aplicação se comunicando através de mensagens.

[09:00] Repara que o meu código de agendamento não chama diretamente o código de escrita de arquivo. Ele manda uma mensagem através dos servidores e um servidor está pronto para ouvir essa mensagem e executar o código.

[09:12] Repara que foi executada de novo a nossa tarefa, então vamos ver nosso arquivo mais uma vez. Está mostrando um número aleatório.

[09:18] Com isso temos uma aplicação muito simples, mas que está funcionando, está executando o que ela se propõe.

[09:24] Agora falta um detalhe para encerrarmos, que é: se eu tivesse lógicas realmente complexas, regras de negócio, como eu testaria? Como eu verificaria que a minha regra de negócios está realmente funcionando? Falaremos um pouco sobre testes no próximo capítulo.

@@09
Faça como eu fiz

Chegou a hora de você seguir todos os passos realizados por mim durante esta aula. Caso já tenha feito, excelente. Se ainda não, é importante que você execute o que foi visto nos vídeos para poder continuar com a próxima aula.

Continue com os seus estudos, e se houver dúvidas, não hesite em recorrer ao nosso fórum!

@@10
O que aprendemos?

Nesta aula, aprendemos:
Gerenciamos nossa primeira dependência (pacote externo);
Efetivamente criamos uma aplicação Mix;
Definimos configurações para o projeto Mix;
Utilizamos o conceito de GenServer para receber mensagens.

#### 11/09/2023

@05-Testes

@@01
Projeto da aula anterior

Caso queira, você pode baixar aqui o projeto do curso no ponto em que paramos na aula anterior.

https://github.com/alura-cursos/2323-elixir-3/archive/refs/tags/aula-4.zip

@@02
Conhecendo o ExUnit

[00:00] Bem-vindos de volta a mais um capítulo desse treinamento, onde finalmente criamos uma aplicação utilizando Elixir. Nós temos dois processos em nossa aplicação. Um envia uma mensagem a cada minuto e o outro processo recebe essa mensagem e escreve em um arquivo.
[00:15] Claro que é uma aplicação muito simples, mas você já pode pensar nas possibilidades. De novo, um processo fica recebendo requisições HTTP, envia cada requisição por mensagem para outro processo que realiza o processamento da requisição, enfim. O céu é o limite.

[00:32] Inclusive, vou deixar rapidamente um desafio para você. Ao invés de escrever em um arquivo aleatório, faça com que o seu processo que recebe a mensagem a cada minuto verifique se um site está no ar. Assim você pode ter de minuto em minuto uma requisição sendo feita e a verificação se o site está de pé.

[00:48] Para isso você vai precisar pesquisar uma dependência que faz requisição HTTP, ver como ela devolve a resposta, analisar os cabeçalhos e etc. Eu acho que será um bom estudo.

[00:57] Mas o propósito deste capítulo é realizar testes. Você lembra que quando executamos o mix new para criar o nosso projeto ele disse que poderíamos executar mix test?

[01:09] Com o mix test o que acontece? Ele inicializa nossa aplicação, repara que ele está mostrando que os cron Jobs foram adicionados e ele executa todos os nossos testes. Então se tivermos qualquer serviço ou processo que fosse necessário para os nossos testes, poderíamos ter acesso. Isso é bem interessante.

[01:27] Mas continuando, nós já temos dois pontos aparecendo. Cada ponto significa um teste que passou. E ele inclusive nos diz que é um doctest, e talvez nós conversemos sobre isso; um teste efetivamente; e nenhuma falha.

[01:41] Então vamos dar uma olhada rápida nesse teste que já temos. Na pasta “test” nós temos dois arquivos. O “test_helper.exs” é o que o Mix executa efetivamente. Ele basicamente inicializa uma ferramenta chamada ExUnit.

[01:57] Essa ferramenta ExUnit fornece as ferramentas necessárias de teste. Então a partir do ExUnit conseguimos criar casos de teste.

[02:05] Importante citar: esse treinamento não é de testes. Existem treinamentos de testes com linguagens específicas na Alura, e caso você queira saber um pouco mais sobre testes de forma genérica, eu vou deixar uma playlist no Para Saber Mais.

[02:18] Mas por enquanto esse não é um treinamento de testes com Elixir. É só uma base para você entender como os testes funcionam.

[02:25] Continuando, eu tenho um outro arquivo chamado “elixir_teste_test.exs”. Ou seja, quando esse arquivo é executado o que o Mix faz é procurar casos de teste em todos os arquivos “_test” dessa página “test”. E então ele vai executá-los.

[02:41] Então o que temos é exatamente um caso de teste para o nosso “elixir_teste”. E ele usa ExUnit.Case. E ele também utiliza doctest. Podemos falar mais disso depois.

[02:56] Mas primeiro, todo caso de teste precisa ter esse use ExUnit.Case para identificarmos que isso é um caso de testes. E cada um dos nossos testes efetivamente terá o seguinte formato. Então ao invés de definir uma função com def, nós utilizamos a macro test. E isso define um teste. Esse teste terá uma descrição ou um nome. Você descreve o que o teste fará.

[03:20] E dentro você pode realizar asserções ou verificações. Então no caso estamos garantindo que o valor ElixirTeste.hello() é igual ao átomo :world, que é exatamente o que essa função retorna. Se dermos uma olhada no “elixir_teste” é exatamente isso que temos. Temos a definição da função hello, que retorna o átomo :world.

[03:42] Agora vamos criar um novo teste que vai falhar de propósito: test “teste que falha de propósito” do.

[03:54] Dentro o que podemos ter? Podemos fazer qualquer verificação, mas tudo que eu vou fazer é verificar que assert ElixirTeste.hello é diferente de :world. Ou seja, eu estou fazendo exatamente o contrário do teste anterior, só para vermos como funciona a exibição de um teste falhando.

[04:09] Então abrindo o terminal de novo e executando meus testes, repara que eu tenho aqueles dois testes que já existiam, e eles continuam passando, que são os dois pontos.

[04:16] E agora tem um teste falhando. Ele traz o nome do teste que falhou, em qual módulo esse teste foi definido, onde está a definição do teste em si, que no caso é a linha 9, onde está o código que falhou. Ou seja, ele mostra exatamente a linha que falhou, que é o assert.

[04:37] E se tiver alguma coisa que não é um valor explícito, por exemplo, uma chamada de função, ele mostra qual é o valor do resultado dessa função. Então conseguimos entender que estamos verificando que :world é diferente de :world. E isso obviamente vai falhar.

[04:51] Só que antes de corrigir ou apagar esse teste, imagina que temos uma aplicação real com vários testes verificando várias regras de negócio e aplicando várias verificações, e eu queira analisar somente alguns testes. Isso pode demorar muito. Embora o Mix seja rápido, se eu tiver um monte de testes, uma aplicação robusta, isso pode levar um bom tempo.

[05:11] Então se eu quiser, por exemplo, rodar somente esse teste que criamos, eu posso fazer mix test test/elixir_teste_test.exs. Eu posso executar somente esse arquivo de teste.

[05:21] Então ele vai encontrar o arquivo de configuração sem problema nenhum, mas só vai executar os testes que estão nesse arquivo. Só que no nosso caso realmente só temos um arquivo.

[05:30] E se eu quisesse, por exemplo, filtrar de alguma outra forma? Existe o formato de tags para filtrarmos o que queremos executar ou não. Então eu posso criar uma tag de falha e adicionar o valor true: @tag falha: true. Então eu estou dizendo que esse teste faz parte da tag falha. Então se eu quiser executar somente ele, eu posso executar mix test --only falha.

[05:51] E com isso, repare que somente esse teste foi executado. Ele está incluindo todas as tags de teste, ou seja, está excluindo a tag padrão e incluindo apenas a tag falha. E esse é o único teste que foi executado.

[06:06] Repare que dois testes que existem foram excluídos, eles não foram executados.

[06:11] Agora eu posso fazer também o contrário: executar todos os testes menos os que têm essa tag. Então ao invés de only, eu posso colocar exclude, para excluir esse teste da nossa suite. E repara que agora todos estão passando e temos um que foi excluído.

[06:25] Existem outras formas de filtrarmos quais testes de executar. Por exemplo, no “test_helper” podemos adicionar algumas configurações. Mas eu acho que esse é o básico para começarmos.

[06:35] E no próximo vídeo vamos criar um teste, mesmo que não tão útil assim, para o nosso escritor de arquivo aleatório.

@@03
Filtros

Vimos neste vídeo além de como executar e analisar a saída de nossos testes, como filtrar quais testes serão executados.
Quais as alternativas a seguir foram mostradas como possíveis para filtrarmos quais testes serão executados ou não?

Alternativa correta
Através do uso de tags.
 
Alternativa correta! É possível excluir os testes marcados com uma tag ou executar apenas eles.
Alternativa correta
Executando apenas 1 arquivo de testes.
 
Alternativa correta! É possível executar apenas os testes definidos em um arquivo específico passando-o por parâmetro para o comando mix test.
Alternativa correta
Através do nome dos testes.

@@04
Para saber mais: Testes

Este treinamento não é sobre testes, mas esse é um conteúdo tão importante que eu acredito ser válido falarmos um pouco já que estamos aprendendo sobre um novo ecossistema.
Se você ainda não tem familiaridade com testes, pode dar uma olhada nessa playlist repleta de conteúdos sobre testes:

Intro a Testes Automatizados
Se você já tem domínio de alguma outra linguagem, pode conferir se há treinamentos de testes utilizando-a aqui na Alura também. ;-)

https://www.youtube.com/playlist?list=PL3j2sfzg3FPsPiaDUmDDKNvco49YMdj8f

@@05
Criando um novo teste

[00:00] Antes de qualquer coisa vamos remover esse teste que eu adicionei com a tag, porque ele está atrapalhando nossa suíte, e vamos criar um novo teste. Eu vou criar um teste para o nosso escritor de arquivo, que escreve um número aleatório. E é comum que sigamos a mesma estrutura de diretórios em “lib” e em “test”.
[00:21] Então vou criar um novo arquivo que estará dentro de “elixir_teste” e vai se chamar “escreve_numero_aleatorio_test”. Sempre terminamos o nome dos nossos arquivos com “test”. E o arquivo é .exs, porque ele não é um módulo que vai ser compilado necessariamente, ele pode ser só executado.

[00:41] Então vamos definir esse módulo, e repare que todos os nossos testes estão dentro do módulo ElixirTesteTest. Então defmodule ElixirTesteTest.EscreveNumeroAleatorioTest do. E dentro, de novo, eu preciso usar ExUnit.Case, porque isso faz com que meus testes sejam executados.

[01:05] E dentro eu posso ter vários testes. Vamos testar primeiro que duas escritas no arquivo geram números diferentes: test “2 escritas no arquivo geram números diferentes” do.

[01:20] Então o que eu vou aplicar? Esse teste não está escrito da melhor forma possível, mas é só para termos um teste mais próximo do real dentro do nosso código.

[01:31] Eu preciso usar aquele nosso código, então ElixirTeste.EscreveNumeroAleatorio.escreve.

[01:36] Esse código escreve num arquivo específico. Então vamos pegar o conteúdo desse arquivo: primeiro_conteudo = File.read!(Path.join( [:code.priv_dir(:elixir_teste), “arquivo.txt”])).

[02:07] Agora eu vou escrever de novo nesse arquivo e vou pegar de novo esse conteúdo, só que agora ele vai ser o segundo conteúdo. Eu quero garantir que o primeiro conteúdo seja diferente do segundo. Dessa forma eu sei que em duas escritas os números gerados são diferentes.

[02:26] Então vamos fazer assert primeiro_conteudo != segundo_conteudo. Salvei, e se tudo der certo podemos executar esse teste com mix test. Aparentemente tudo está funcionando, temos um teste a mais.

[02:41] Normalmente é uma boa prática para verificarmos se nosso teste realmente está testando alguma coisa fazer o teste falhar. Então vamos executar isso de novo e agora nosso teste falha.

[02:51] Ele está tentando verificar se esses dois conteúdos são iguais, sendo que na verdade eles não são. Então perfeito, conseguimos executar nosso teste.

[03:01] Agora duas coisas: primeiro, repare que temos a execução de um doctest. Não entraremos em detalhes de como criar doctests, mas eu quero te mostrar o que é isso rapidamente.

[03:14] Nós temos no módulo principal “elixir_teste” uma documentação um pouco maior. Temos a documentação do módulo em si e uma documentação do que essa função Hello world faz. Inclusive ela tem alguns exemplos.

[03:29] E dentro desses exemplos ela utiliza o seguinte formato: iex>, seguido de uma execução de código, como ele executaria esse código. E embaixo tem a saída desse código. Com isso o ExUnit consegue pegar esse pedaço da documentação, executar esse código e verificar se a saída realmente é essa.

[03:52] Então se existir essa possibilidade de você ter um método cuja saída é sempre a mesma baseado nos parâmetros, você nem precisa criar um caso de teste. Na sua documentação você já tem testes automáticos sendo escritos para você se você colocar assim.

[04:06] Então dessa forma, se eu mudar a saída de :world para :hello, por exemplo, e executar os testes, repare que eu terei um outro teste falhando. Eu tenho agora o meu doctest falhando, pois onde ele esperava world ele recebeu na verdade um hello.

[04:19] Isso é muito interessante, porque se você está criando código para disponibilizar para outras pessoas, você garante que além de ter uma boa documentação, essa documentação está realmente atualizada.

[04:31] Porque se em algum momento esse código retornar algo diferente de world você não vai precisar se lembrar de atualizar a documentação, porque isso vai quebrar um teste se você tiver doctests.

[04:41] E para você informar o Elixir que você quer executar os doctests é só em algum caso de teste você adicionar doctest, seguido do módulo que você quer testar, que você quer ler os doctests.

[04:52] De novo, isso se chama doctest, e eu queria juntar com esse vídeo onde escrevemos um teste.

[04:58] Mas eu disse que eu queria falar de duas coisas. A primeira foi sobre doctest, que é bastante interessante, em minha opinião. E agora a segunda é que eu estou tendo que escrever no sistema de arquivos mesmo, depois tendo que ler esse arquivo, e esse arquivo nem está dentro do nosso diretório de teste. Isso está meio bagunçado.

[05:16] E se você entende de testes você já deve conhecer dublês de testes. Então vamos entender como podemos utilizar dublês em Elixir através do ExUnit.

@@06
Doctests

Neste vídeo nós vimos algo bastante interessante: O elixir executou um teste que nós nem mesmo escrevemos.
Como foi possível a execução de um teste que nós não escrevemos explicitamente?

Alternativa correta
Através da documentação do módulo a ser testado.
 
Alternativa correta
Através de arquivos de configuração.
 
Alternativa correta
Através da documentação da função a ser testada.
 
Alternativa correta! Se a documentação da função tiver um bloco indentado começando com iex> ou ...> seguido de um exemplo de código, este código será executado e seu retorno será comparado com o que estiver na linha seguinte. Através da chamada de doctest NomeDoModulo no módulo de testes nós informamos que queremos executar os doctests.

@@07
Usando mock para criar um spy

[00:00] Esse vídeo será um pouco mais complexo, então eu já instalei uma dependência para não tomar muito seu tempo.
[00:07] Essa dependência se chama Mock. Eu estou instalando essa dependência como já fizemos antes, através do nosso “mix.exs”, então só adicionei esse conteúdo nas nossas dependências.

[00:18] E ele nos ajuda a criar Mocks, a criar dublês de teste. De novo, se você não entende muito sobre esse assunto eu deixei um Para Saber Mais nesse capítulo falando sobre testes e lá tem um vídeo sobre dublês.

[00:29] Mas continuando, o que eu quero fazer é evitar essa escrita de arquivos. Eu não quero realmente escrever no arquivo e etc. Então eu vou criar uma nova função que se chama File.write. Basicamente é isso, eu vou fingir que eu tenho uma função File.write. Você já vai entender.

[00:50] Vou criar um teste e eu vou chamá-lo de “com mock”. Claro que você deve nomear seus testes de forma correta, mas é só para não ficar pensando muito bem nos testes. Como eu utilizo essa biblioteca? Eu primeiro preciso importar mock: import Mock.

[01:15] Por que fazemos o import? Se você se lembra bem, nós temos macros. Então eu poderei utilizar uma macro chamada with_mock. Essa macro espera um módulo e uma keyword list que vamos implementar.

[01:32] Então o que eu vou informar? Eu tenho um módulo File e eu quero implementar a função “write!”, que é a função que utilizamos no nosso escritor, no nosso “escreve_numero_aleatorio”.

[01:50] Essa função eu quero trocar por alguma outra coisa, uma função anônima: write!: fn (). Então eu sei que a função write espera um caminho, que eu não vou precisar usar, e um conteúdo, e isso assim usaremos em algum momento.

[02:07] Dentro dessa função eu preciso fazer alguma coisa. O que eu quero fazer é armazenar em algum lugar todos os conteúdos que forem escritos. E dentro desse with_mock eu vou escrever duas vezes.

[02:31] Tudo que está dentro desse do e end vai utilizar uma função de mentira do File. Ou seja, esse File.write! que será utilizado dentro disso é um de mentira, e será essa função que eu estou passando.

[02:46] Então eu posso executar o que eu quiser. E o que eu vou executar? Eu vou armazenar isso em algum lugar, cada uma dessas escritas. Então a cada vez que eu chamar essa função eu quero adicionar numa lista, por exemplo, e no final eu quero pegar dois itens desta lista e eu quero verificar se o primeiro é igual ao segundo. É isso que eu vou fazer.

[03:04] E existe algo que o Erlang fornece para nós chamado ETS. Vou pesquisar para mostrar para vocês. Isso significa Built-in term storage.

[03:21] Basicamente é um local onde você consegue armazenar dados utilizando Erlang. Então é basicamente uma tabela de armazenamento de dados, só que isso fica em memória. É como se fosse um banco de dados em memória que o Erlang já te fornece para você armazenar coisas pequenas, ou às vezes até muitas coisas. Não vamos entrar nesse detalhe sobre Erlang.

[03:43] Mas eu vou utilizar esta funcionalidade para criar conteúdos, por exemplo. Então eu vou adicionar os dois conteúdos desses arquivos em alguma dessas tabelas.

[03:52] Então vamos criar essa tabela através de ETS. Tudo que é do Erlang eu consigo acessar através de um atom. E eu vou criar uma nova tabela chamada “conteúdos”. E eu posso passar algumas configurações para ela.

[04:10] Por exemplo, eu vou utilizar um conjunto. Eu não posso ter dados repetidos. E isso será privado, só o meu próprio processo pode acessar isso :set, :private. Mas isso já é o padrão, então eu nem precisaria informar.

[04:22] Só que essa eu preciso: :named_table. Basicamente, quando eu informo a opção named_table eu posso acessar essa tabela em qualquer lugar a partir deste átomo, a partir desse nome. Se eu já tenho isso, eu posso toda vez que receber esse conteúdo adicionar, inserir um novo conteúdo tendo esse conteúdo.

[04:47] Eu estou utilizando um Mock. E o que esse Mock faz? Ele pega a função write! do módulo File e vai substituir por essa função.

[04:56] E essa função adiciona na tabela de conteúdos uma tupla contendo esse conteúdo, porque com tuplas conseguimos trabalhar melhor, só por isso.

[05:05] Continuando, agora dessa tabela de conteúdos eu vou querer apagar todos os conteúdos. Então vou criar uma variável de conteúdos e vou pegar de ETS tab2list. Ou seja, essa tabela de conteúdos eu vou converter numa lista. Agora eu tenho uma lista onde cada um dos elementos será o conteúdo em si.

[05:29] Então vamos pegar o primeiro valor e o restante de conteúdos: [primeiro_valor | conteudos] = conteudos. Lembra que isso é uma lista, então eu estou pegando o primeiro elemento e adicionando o restante em uma variável com o mesmo nome, então ele está mudando o valor da variável. Lembra que a lista original não é alterada, só o que altera é para onde essa variável aponta.

[05:51] E embaixo disso eu posso pegar o segundo valor e ignorar o restante dessa lista, que vai estar vazia de conteúdos: [segundo_valor | _] = conteudos. Porque essa lista tem dois elementos só. Peguei o primeiro e depois peguei o segundo. Então o segundo será basicamente uma lista vazia.

[06:04] Agora eu posso garantir que o primeiro valor é diferente do segundo valor: assert primeiro_valor != segundo_valor.

[06:10] Então eu utilizei uma tabela do Erlang, uma ETS para conseguirmos armazenar valores utilizando o Mock e no final fazemos a verificação.

[06:24] Essa técnica na verdade não se chama Mock. Mock é só um termo genérico que essa biblioteca utiliza para gerar qualquer tipo de dublê.

[06:32] O que nós fizemos na prática foi um Spy. Nós estamos armazenando os dados utilizando um dublê de teste para depois conferir esses dados. Mas tudo bem, de novo, se você não entende muito sobre esse assunto não precisa se atentar aos termos.

[06:45] Mas vamos garantir que eu não escrevi anda errado e vamos ver se isso tudo continua passando com mix test. Agora está recompilando nosso projeto e eu esqueci de um T em insert. Agora se tudo der certo vai funcionar. E tudo funcionando.

[07:03] Se eu substituir o assert primeiro_valor != segundo_valor para assert primeiro_valor == segundo_valor, eu espero que isso falhe. E perfeito, está falhando. Repara que ele está olhando que a nossa tupla tem valores diferentes.

[07:13] Dessa forma conseguimos criar um teste relativamente complexo, mesmo que seja para um código simples, para não precisarmos utilizar o sistema de arquivos e etc.

[07:22] Então dessa forma nós estamos substituindo uma função existente utilizando a biblioteca Mock e utilizamos o ETS da Erlang para armazenar valores. E com isso temos um teste relativamente complexo.

@@08
Para saber mais: ETS

Este vídeo foi um pouco mais complexo pois além de mostrar a biblioteca mocks também fez uso de ETS.
Para saber mais sobre mocks, ou seja, dublês de testes, você pode conferir a playlist sugerida há alguns capítulos. Aqui está o link de novo:

Intro a Testes Automatizados
Já se quiser entender melhor sobre ETS, você pode conferir aqui:

Erlang - ETS

https://www.youtube.com/playlist?list=PL3j2sfzg3FPsPiaDUmDDKNvco49YMdj8f

https://erlang.org/doc/man/ets.html

@@09
Faça como eu fiz

Chegou a hora de você seguir todos os passos realizados por mim durante esta aula. Caso já tenha feito, excelente. Se ainda não, é importante que você execute o que foi visto nos vídeos para poder continuar com os próximos cursos que tenham este como pré-requisito.

Continue com os seus estudos, e se houver dúvidas, não hesite em recorrer ao nosso fórum!

@@10
Projeto final do curso

Caso queira, você pode baixar aqui o projeto completo implementado neste curso.

https://github.com/alura-cursos/2323-elixir-3/archive/refs/tags/aula-5.zip

@@11
O que aprendemos?

Nesta aula, aprendemos:
Conhecemos o ExUnit e rodamos os testes existentes;
Criamos nosso primeiro teste automatizado em Elixir;
Aprendemos a usar um pacote externo para mocks;
Conhecemos o ETS da Erlang.

@@12
Conclusão

[00:00] Parabéns por terem chegado ao final desse treinamento de Elixir. Agora nós encerramos um ciclo. Nós já vimos um pouco da sintaxe do Elixir, nos aprofundamos em alguns conceitos, vimos formas de execução, e agora criamos uma aplicação.
[00:14] Claro que essa aplicação não é a mais complexa do mundo, mas ela é uma ótima base para você expandir seus conhecimentos de Elixir.

[00:20] Com os conhecimentos que você adquiriu nesse treinamento você já consegue desenvolver aplicações reais e aprender novas ferramentas como, por exemplo, talvez um framework web. Então vamos recapitular rapidamente o que vimos nesse treinamento.

[00:32] Começamos falando sobre o ecossistema do Elixir. Falamos sobre o Hex, o Dependency Manager, ou Package Manager do Elixir.

[00:39] Vimos também como utilizar usando o Mix. Na nossa função de dependências inclusive utilizamos duas dependências.

[00:47] Falamos um pouco sobre o Supervisor, ou uma Supervision Tree. Ou seja, falamos de como supervisionar processos.

[00:54] E na verdade, até temos um supervisor criado na nossa aplicação. Então nós inicializamos uma Supervision Tree. E vimos como unir isso tudo através do Mix. Inclusive o arquivo “mix.exs” é o arquivo principal de entrada do Mix.

[01:08] Um detalhe interessante é que isso tudo vira no final uma aplicação. Então dentro temos uma aplicação do Mix podendo ser gerada. Isso é bastante interessante. E dentro de “ebin” repara que temos um “.app”. É uma aplicação que roda na Erlang.

[01:23] Então se você quiser distribuir essa aplicação de Erlang por algum motivo, essa é uma das possibilidades. Existem outras, mas não vamos nos alongar.

[01:30] Tendo entendido um pouco do que é o Mix, demos um passo atrás e aprendemos sobre processos. Vimos como criar processos através da função Spawn. Vimos como nos comunicar mandando mensagens com a função send e recebendo com a macro receive.

[01:45] Também vimos um pouco sobre as abstrações de processos, como Agents, Tasks e GenServers. E esse último utilizamos na prática na hora de criar uma aplicação.

[01:55] Então no final temos uma aplicação com dois processos. O primeiro é um agendador de tarefas que utiliza uma biblioteca externa que utiliza configurações do nosso sistema. E o segundo é um servidor, um GenServer que criamos na mão para ficar ouvindo mensagens que esse agendador pode mandar.

[02:12] Com isso temos uma aplicação que de minuto em minuto escreve um número aleatório no arquivo. Isso é bem interessante, e nesse processo também vimos como analisar o observer, que é um gerenciador de tarefas, vamos dizer assim, da Erlang.

[02:26] E no final ainda demos de bônus uma olhada em testes. Vimos os testes que já existiam, aprendemos sobre doctest, que é algo muito interessante do Elixir, e até escrevemos alguns testes, acessando o sistema de arquivos e inclusive utilizando o Mocks.

[02:41] De novo, isso não é tudo que temos para ver sobre Elixir, nem de longe. Isso é somente uma boa base. Com isso você praticamente já consegue andar com as próprias pernas e aprender conceitos novos, seja em documentações, em outros artigos e até dando uma olhada em pacotes do Hex.

[02:56] Então meu convite é para você implementar aquele desafio de, ao invés de escrever no arquivo um número aleatório, fazer uma requisição HTTP e verificar se um site está no ar. Pega uma lista de sites e adiciona em um arquivo. Um processo lê esses sites e manda mensagens para outro processo verificar se eles estão no ar.

[03:13] Começa a brincar com essa base que temos. Depois você sai disso e cria novos projetos. Mais uma vez, parabéns por ter chegado até o final desse treinamento. Realmente espero que você tenha gostado e tirado bastante proveito.

[03:24] Se ficou com alguma dúvida no processo, não hesite. Temos um fórum onde nossa comunidade de alunos, moderadores e instrutores é muito solícita, e com certeza alguém vai conseguir te ajudar.

[03:35] Então muito obrigado por ter me acompanhado até aqui, por ter aguentado minha voz até o final. Espero te ver em outros treinamentos na Alura.