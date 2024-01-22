# fodinha_flutter

### App para gerenciar um jogo de baralho chamado Fodinha.
A criação desse aplicativo foi muito proveitosa para praticar o uso do gerenciador de estados globais com MobX, persistencia de dados com banco NoSQL (isarDB) e também compreender melhor o conceito arquitetura de software MVVM.

### Descrição do Projeto
Um aplicativo para gerenciar uma partida de Fodinha pelo celular. 
O aplicativo deve ser capaz de criar uma partida, adicionar até no máximo 10 jogadores, definir o número de rounds que cada jogador disse fazer seguindo as seguintes regras.

- O número de rounds que o jogador define não pode ser maior que o número de cartas.
- O número de cartas aumenta em 1 a cada round até 5 e reduz até 1 novamente.
- O número de rounds dos jogadores somados não pode ser igual ao número de cartas, pois sempre tem que haver ao menos 1 perdedor da rodada.
- Se o jogador perder 5x (vezes) está eliminado do jogo.
- O jogo acaba quando restar 1.


### Instalação
1. Clique no arquivo fodinha-flutter.apk
2. Pesquise por raw, atalho (ctrl + f), ou no canto superior direito verá um icone para baixar o arquivo, clique nele.
3. Mande esse arquivo para um dispositivo android e instale. "O aplicativo não tem credenciais, o dispositivo android irá acusar como possivel arquivo malicioso"

### Ou

### Instalação
1. Clone o repositório
```bash
$ git clone https://github.com/Brunonasccimentto/fodinha-flutter
```

2. Conecte um emulador ou dispositivo android via usb
3. Caso não tenha feito, ative a depuração via usb nas opções de desenvolvedor. 

4. Instale o apk
```bash
$ flutter install
```

### Como usar
- **Adicionar jogadores:** Toque no botão adicionar jogadores.
- **Definir foto ou avatar:** Para escolher um avatar toque na área colorida com as iniciais do jogador.
- **Novo Dealer:** Para definir um novo dealer (icone de moeda roxa) pressione um jogador não dealer.
- **Defina o número de rounds:** Para cada jogador defina o número de rounds pelos botões de - e +.
- **Defina o perdedor:** Para Selecionar o perdedor, toque nos jogadores que perderam o round.

### ScreenShots

#### Tela inicial
<img src="assets/screenshoots/Screenshot_1705952896.png">

#### Tela de jogadores
<img src="assets/screenshoots/Screenshot_1705953068.png">

#### Modal de avatares
<img src="assets/screenshoots/Screenshot_1705953063.png">

#### Jogadores arrastáveis para excluir
<img src="assets/screenshoots/Screenshot_1705953080.png">

#### Tela do jogo / Scoreboard
<img src="assets/screenshoots/Screenshot_1705953097.png">

<img src="assets/screenshoots/Screenshot_1705953184.png">

#### Histórico do jogador
<img src="assets/screenshoots/Screenshot_1705953223.png">

#### Tela Fim de round
<img src="assets/screenshoots/SScreenshot_1705953116.png">

<img src="assets/screenshoots/Screenshot_1705953127.png">

#### Modal do vencedor
<img src="assets/screenshoots/Screenshot_1705953288.png">




