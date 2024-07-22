---
title: 'Artigo 4: Anytime discovery of a diverse set of patterns with Monte Carlo tree search'
page-layout: full
---

## Introdução

A Descoberta de Subgrupos (SD) é uma área dentro da Mineração de Dados e do Aprendizado de Máquina cujo objetivo é encontrar subgrupos relevantes em conjuntos de dados. Desde o final dos anos 90, muitas estratégias têm sido desenvolvidas para melhorar a eficiência e relevância dos resultados na SD. No entanto, ainda existem desafios significativos, como a eficiência na exploração do espaço de busca.

O artigo "Anytime discovery of a diverse set of patterns with Monte Carlo tree search" propõe uma solução inovadora: o método **MTCS4SD**. Esse método utiliza a Árvore de Busca Monte Carlo (Monte Carlo Tree Search - MCTS), uma heurística popular em jogos de tomada de decisão, para descobrir subgrupos de maneira eficiente e diversificada.

## Conceitos e Adaptações

### Fundamentos do Método

O MTCS4SD adapta a heurística da Árvore de Busca de Monte Carlo, que se baseia em quatro etapas principais:

1. **Select:** Seleciona recursivamente um nó filho a partir da raiz até encontrar um nó não totalmente expandido, utilizando a métrica UCT.
2. **Expand:** Adiciona aleatoriamente uma nova direção a partir do nó selecionado.
3. **Rollout:** Simula aleatoriamente as próximas ações até chegar a um terminal, avaliando a recompensa.
4. **Update:** Propaga o resultado obtido para os nós superiores, atualizando os valores de recompensa acumulada e o número de visitas.

<figure align="center">
    <img src="imgs/artigo4/arvore_busca_monte_carlo.png" width="500">
    <figcaption>Etapas da Árvore de Busca de Monte Carlo.</figcaption>
</figure>

### Adaptação para Descoberta de Subgrupos

Para o contexto de SD, o método sofre algumas adaptações:

1. **Select:** Utiliza-se a SP-MCTS para selecionar subgrupos promissores, considerando a variância da recompensa.
2. **Expand:** Refinamento para obter descrições mais específicas, evitando descritores fechados e duplicações.
3. **Rollout:** Pode executar até que o padrão seja infrequente, agregando os resultados da simulação.
4. **Update:** Utiliza a maior propaganda para priorizar as melhores recompensas.

A execução prolongada do algoritmo permite uma busca exaustiva, embora existam hiperparâmetros que limitam o número de execuções.

## Metodologia e Resultados

O método foi comparado com outros algoritmos da área, como SD-Map*, Beam Search, SSDP e Misere, usando métricas como qualidade média, tempo de execução, redundância, diversidade e uso de memória. Os resultados mostraram que o MCTS4SD encontra conjuntos de padrões mais diversos, embora com um custo um pouco maior de redundância em alguns casos.

<figure align="center">
    <img src="imgs/artigo4/comparacao_algoritmos.png" width="500">
    <figcaption>Ilustração de diferentes algoritmos de busca. a) Redundancy problem. b) Beam search. c) Sampling exploration. d) MCTS-based exploration.</figcaption>
</figure>

### Resultados das Comparações

- **Beam Search:** MCTS4SD produziu resultados mais diversos.
- **SSDP e métodos de amostragem:** MCTS4SD garantiu a busca por ótimos locais, algo que esses métodos não conseguem.
- **Métodos exaustivos:** MCTS4SD obteve resultados onde métodos exaustivos falharam devido a limitações de recursos.

As vantagens incluem flexibilidade, alta diversidade e convergência para uma busca exaustiva, embora consuma muita memória e explore intensamente o espaço de busca.

## Impacto Social e Considerações Éticas

A aplicação do MTCS4SD em áreas como saúde, segurança, agricultura e ecologia traz consigo um potencial incrível, mas também levanta questões éticas e sociais importantes. Vamos analisar os benefícios, riscos e responsabilidades de cada área: 

- **Saúde**
    - Benefício: Detectar doenças precocemente, possibilitando tratamentos mais eficazes e personalizados. 
    - Riscos: Quebra de privacidade dos pacientes, acesso desigual à tecnologia (aumentando a desigualdade social) e decisões automatizadas que desconsideram o lado humano da medicina. 
    - Responsabilidades: Garantir a segurança dos dados dos pacientes, promover o acesso igualitário à tecnologia e garantir que a tomada de decisão médica continue considerando o paciente como um todo. 

- **Segurança**
    - Benefício: Prevenir crimes de forma mais eficiente, utilizando recursos de forma otimizada. 
    - Riscos: Reforçar discriminações e vieses existentes nos dados, gerar desconfiança na justiça e ameaçar liberdades individuais. 
    - Responsabilidades: Assegurar que os dados utilizados sejam neutros e imparciais, operar com transparência e garantir que os direitos individuais sejam preservados. 

- **Agricultura**
    - Benefício: Aumentar a produção de alimentos e otimizar o uso de recursos naturais. 
    - Riscos: Excluir pequenos agricultores do acesso à tecnologia, aumentar a dependência tecnológica e gerar impactos sociais negativos, como o desemprego. 
    - Responsabilidades: Promover o acesso à tecnologia de forma democrática, considerar os impactos sociais de sua implementação e garantir uma produção agrícola mais justa e sustentável. 

- **Ecologia**
    - Benefício: Gerenciar recursos naturais de forma mais eficiente e proteger o meio ambiente. 
    - Riscos: Dificultar o acesso à tecnologia devido à complexidade e custos, centralizar o conhecimento e desconsiderar as comunidades locais na tomada de decisão. 
    - Responsabilidades: Buscar soluções acessíveis e fáceis de usar, democratizar o conhecimento e garantir que as ações beneficiem a todos, principalmente as comunidades mais afetadas pelos problemas ambientais. 

## Código Aberto e Documentação

Os autores disponibilizaram o código do MTCS4DM como software de código aberto no GitHub. O repositório inclui datasets, arquivos executáveis, scripts para experimentos e visualização de resultados. 

### 1. Instalação do Java

Para executar o programa MCTS4DM, é necessário instalar o Java Development Kit (JDK) e o Java Runtime Environment (JRE) na versão 22. Siga os passos abaixo para realizar a instalação:

#### 1.1. Baixar e instalar o JDK
- Acesse o site oficial da Oracle: [Oracle JDK 22](https://www.oracle.com/java/technologies/javase/jdk22-archive-downloads.html).
- Escolha a versão adequada, indicamos o JDK 22.0.1, para o seu sistema operacional (Windows, macOS ou Linux) e faça o download do instalador.
- Execute o instalador baixado e siga as instruções na tela para concluir a instalação.

#### 1.2. Configurar a variável de ambiente JAVA_HOME
- No Windows, abra o Painel de Controle e vá em "Sistema e Segurança" > "Sistema" > "Configurações avançadas do sistema" > "Variáveis de ambiente".
- Crie uma nova variável de sistema chamada `JAVA_HOME` e defina seu valor para o caminho onde o JDK foi instalado, por exemplo, `C:\Program Files\Java\jdk-20`.
- Adicione `%JAVA_HOME%\bin` ao `PATH` nas variáveis de sistema.

#### 1.3. Verificar a instalação
- Abra o terminal (Prompt de Comando no Windows, Terminal no macOS ou Linux) e digite `java -version` e `javac -version` para verificar se o Java foi instalado corretamente.

### 2. Clonar o Repositório

Para obter o código fonte do MCTS4DM, você precisa clonar o repositório do GitHub. Siga os passos abaixo para clonar o repositório em diferentes sistemas operacionais:

#### 2.1. Windows
- Baixe e instale o Git a partir do site oficial: [Git para Windows](https://gitforwindows.org/).
- Após a instalação, abra o Git Bash.
- No Git Bash, execute o seguinte comando para clonar o repositório:
  ```sh
  git clone https://github.com/guillaume-bosc/MCTS4DM.git
  ```

#### 2.2. macOS
- Abra o Terminal.
- Instale o Git usando o Homebrew com o comando:
  ```sh
  brew install git
  ```
- No Terminal, execute o comando para clonar o repositório:
  ```sh
  git clone https://github.com/guillaume-bosc/MCTS4DM.git
  ```

#### 2.3. Linux
- Abra o Terminal.
-  Instale o Git usando o gerenciador de pacotes da sua distribuição Linux, por exemplo, no
Ubuntu:
  ```sh
  sudo apt - get install git
  ```
- No Terminal, execute o comando para clonar o repositório:
  ```sh
  git clone https://github.com/guillaume-bosc/MCTS4DM.git
  ```

### 3. Executar o MCTS4DM

Depois de configurar o ambiente Java, é hora de executar o MCTS4DM. Primeiro, certifique-se de que os arquivos de dataset e o arquivo de configuração de parâmetros estejam preparados. Em seguida, siga os passos abaixo:

#### 3.1. Preparar os arquivos de dataset e configuração
- Navegue até a pasta `datasets` no diretório onde o programa MCTS4DM está localizado.
- Dentro da pasta `datasets`, crie uma pasta exclusiva para o dataset, por exemplo, `BreastCancer`.
- Coloque os arquivos `properties.csv` e `qualities.csv` dentro da pasta `BreastCancer`, por exemplo.
- Certifique-se de que o arquivo `parameters.conf` esteja configurado corretamente, apontando para os caminhos relativos dos arquivos de dataset. O arquivo padrão do repositório `parameters.conf` explica cada parâmetro e como configurar.

#### 3.2. Formato dos arquivos de dataset
- `properties.csv`: Contém a tabela de atributos, onde cada linha é um objeto e cada coluna é um atributo. O separador entre colunas deve ser `\t`.
- `qualities.csv`: Contém a tabela de rótulos, onde cada linha é um objeto (na mesma ordem do `properties.csv`) e cada coluna é um rótulo de alvo.

#### 3.3. Executar o MCTS4DM
- No terminal, navegue até a pasta onde está o arquivo `MCTS4DM.jar`.
- Execute o comando:
  ```sh
  java -jar MCTS4DM.jar <caminho para o arquivo de configuração>
  ```
- Por exemplo:
  ```sh
  java -jar MCTS4DM.jar parameters.conf
  ```

### 4. Resultados da Execução
Após a execução do programa, os resultados estarão disponíveis na pasta especificada no parâmetro `resultFolderName` dentro da pasta `results`. Quatro arquivos serão gerados:

- `info.log`: Contém os valores dos parâmetros utilizados, o tempo de execução e a data da execução.

- `results.log`: Cada linha contém um subgrupo no formato `<Descrição>\t<Alvos>\t<Medida>\t<E11>\t<E10>\t<E01>`. Onde E11 é o número de objetos que respeitam a descrição e estão associados aos alvos, E10 é o número de objetos que respeitam a descrição mas não estão associados aos alvos, e E01 é o número de objetos que não respeitam a descrição mas estão associados aos alvos.

- `support.log`: Contém o suporte de cada subgrupo, onde cada linha corresponde ao suporte do subgrupo correspondente no arquivo `results.log`.

- `supportE11.log`: Contém apenas os IDs dos objetos em E11.

### 5. Geração de Plots com Base nos Resultados

Para gerar plots dos resultados obtidos, siga os passos abaixo:

#### 5.1. Acessar a pasta GenerateDataPlot
- Navegue até a pasta `GenerateDataPlot` no terminal.

#### 5.2. Executar o comando para gerar plots
- Execute o comando:
  ```sh
  java -jar GenerateDataPlot.jar
  ```

#### 5.3. Executar os scripts de bash
- No terminal, vá até a pasta `RunExperiments/results`.
- Execute os seguintes scripts para gerar os gráficos:
  ```sh
  ./launchLength.sh
  ./launchQuality.sh
  ./launchRuntime.sh
  ```

#### 5.4. Verificar os resultados
- Os resultados dos gráficos estarão disponíveis na pasta `RunExperiments/results/NbInterations/` com o nome do dataset correspondente.
- Os gráficos gerados estarão em formato `.pdf` e prontos para análise.

### 6. Executar Experimentos em Lotes

A pasta `RunExperiments` contém o programa que pode executar automaticamente o algoritmo para todos os datasets. Nesta pasta, a pasta `results` contém os resultados dos lotes, a pasta `src` contém os códigos-fonte deste programa, o arquivo `RunExperiments.jar`, e o arquivo `paramGen.conf` para configuração, assim como é o arquivo `parameters.conf`. Para executar, use o comando:
```sh
java -jar RunExperiments.jar [options]
```
As opções disponíveis são escolhidas entre `{ucb, expand, rollout, memory, update, iter}`, que permitem executar o experimento de uma estratégia definida de MCTS.

- `ucb`: Executa experimentos usando a estratégia Upper Confidence Bound (UCB).

- `expand`: Executa experimentos focando na expansão da árvore.

- `rollout`: Executa experimentos utilizando a estratégia de rollout.

- `memory`: Executa experimentos com foco em otimizações de memória.

- `update`: Executa experimentos aplicando estratégias de atualização.

- `iter`: Executa experimentos através de iterações específicas.

Para iniciar o programa com uma opção específica, use o comando no terminal, por exemplo:
```sh
java -jar RunExperiments.jar ucb
```
Os resultados dos experimentos serão armazenados na pasta `results` dentro de uma hierarquia definida, facilitando a análise dos diferentes experimentos realizados.

## Discussões e Pontos Relevantes

Durante a discussão do seminário, vários pontos foram levantados:

- **Viés:** A aplicação em segurança pública gerou preocupações sobre o potencial de reforçar vieses existentes. É crucial garantir a justiça e a equidade na aplicação do método. 
- **Avaliação da Qualidade dos Grupos:** A forma como a qualidade dos grupos é avaliada no artigo gerou debate, levantando a necessidade de métricas mais robustas e transparentes. 
- **Comparação com Abordagens Numéricas:** A falta de comparação com métodos numéricos foi apontada como uma limitação do estudo.
- **Importância da Diversidade:** A capacidade do MCTS4DM em encontrar subgrupos diversos foi destacada como um diferencial importante em relação a outros métodos.

## Conclusões

O artigo apresenta o MTCS4SD como uma abordagem promissora para a descoberta de subgrupos, demonstrando vantagens em relação a métodos tradicionais em termos de qualidade, diversidade e flexibilidade.  

No entanto, é importante destacar que a implementação deste método traz consigo questões éticas e sociais importantes, especialmente quando aplicado em áreas sensíveis como saúde, segurança, agricultura e ecologia. Portanto, ao utilizar o MTCS4DM, é crucial considerar esses aspectos e garantir que o método seja usado de maneira responsável e ética. 

Por fim, a disponibilização do código-fonte e a descrição detalhada do processo de execução fornecem uma base sólida para futuras pesquisas e desenvolvimentos na área de Descoberta de Subgrupos. Isso abre caminho para novas possibilidades de exploração e aprimoramento do MCTS, contribuindo para o avanço contínuo do campo de Aprendizado de Máquina. 

## Referências

- Bosc, G., Boulicaut, JF., Raïssi, C. et al. Anytime discovery of a diverse set of patterns with Monte Carlo tree search. Data Min Knowl Disc 32, 604–650 (2018). [Link para o artigo](https://doi.org/10.1007/s10618-017-0547-5)