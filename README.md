# $Challeng-MOTTU$

## 🛠️ Projeto: Sistema de Identificação Automatizada de Motos no Pátio — Mottu

### Objetivo:

Criar uma solução automatizada para identificar e localizar motos no pátio da Mottu com confiabilidade, sem depender de processos manuais ou operadores, mesmo quando motos estão sem placa ou com identificação comprometida.

---

### Conceito Principal:

Usar tags RFID passivas de baixa frequência (LF - 125 kHz) embutidas na estrutura da moto, ativadas por um “canhão” de sinal eletromagnético, e detectadas por antenas receptoras distribuídas no pátio.

> _Pequeno chip com antena_

### Conceito Base:

1. RFID é basicamente um sistema composto por:

   - _Tag_ (ou etiqueta RFID) → Fica na moto.
   - _Leitor RFID_ → Emite um sinal de rádio.
   - _Antena_ → Transmite e recebe sinal.
   - _Controladora_ → Processa os dados capturados.

2. “canhão” de sinal eletromagnético:
   - Forma de compensar o alcance do RFID de baixa frequência.
   - Função de um _amplificador direcionado_ de campo magnético.
   - Criar um campo magnético LF (125 kHz) **forte o suficiente** pra energizar todas as tags passivas num raio grande.

#### Tipos de RFID

| Tipo                       | Frequência  | Alcance      | Vantagem                 | Limitação                  |
| -------------------------- | ----------- | ------------ | ------------------------ | -------------------------- |
| LF (Low Frequency)         | 125-134 kHz | ~10 cm       | Imune a água/metais      | Alcance super curto        |
| HF (High Frequency)        | 13.56 MHz   | ~1 metro     | Compatível com NFC       | Menos performance em metal |
| UHF (Ultra High Frequency) | 860-960 MHz | ~2-10 metros | Leitura em massa, barato | Sofre com metal e água     |


---

#### Variações de tag

| Tipo                             | Vantagem           | Custo estimado |
| -------------------------------- | ------------------ | -------------- |
| Etiqueta adesiva anti-metal      | Flexível, discreta | ~R$1 - R$3     |
| Placa plástica com RFID embutido | Robusto            | ~R$5 - R$10    |
| Tag encapsulada industrial       | Ultra resistente   | ~R$10 - R$20   |

---

## 🔧 Componentes do Sistema

### 1. **RFID LF (125 kHz)**

- Tags passivas (sem bateria), encapsuladas e embutidas no chassi da moto.
- Cada tag possui um **ID único** e é resistente a remoção ou falsificação.
- LF atravessa parede, plásticos, não sofre tanto com metal.

### 2. **Canhão RFID eletromagnético**

- Dispositivo baseado em:
  - Arduino (PWM a 125 kHz)
  - MOSFET como chave de potência
  - Bobina indutora de grande porte (30 cm de diâmetro)
  - Capacitor ressonante para formar circuito LC
- Gera campo magnético suficiente para ativar tags RFID num raio definido.

### 3. **Antenas de Leitura**

- Antenas LF espalhadas pelo pátio.
- Conectadas a leitores compatíveis (ex: RDM6300, EM4100)
- Cada antena sabe sua posição → Ao detectar uma tag, envia o ID + localização.

### 4. **Interface Visual**

- Mapa interativo do pátio com zonas/slots.
- Exibição em tempo real das motos detectadas e seu status (alugada, manutenção, devolvida).
- Filtros e busca por ID ou status.

---

## ⚙️ Fluxo do Sistema

1. Canhão emite campo LF → ativa todas as tags na área.
2. As tags respondem com seus IDs.
3. Antenas recebem e repassam ao sistema central.
4. Software interpreta os dados, localiza as motos e atualiza o painel.

---

## 🎓 Fundamentos Físicos Envolvidos

| Tema                     | Onde Estudar                       |
| ------------------------ | ---------------------------------- |
| Indução eletromagnética  | Leis de Faraday e Lenz             |
| Circuitos Ressonantes LC | Eletrônica analógica               |
| RFID passivo             | Comunicação por modulação de carga |
| Amplificação com MOSFET  | Controle de potência               |

---

## Desafio

→ O chip LF ainda exige curta distância pra comunicação (o retorno da resposta da tag é baixo ganho). Então:

- O canhão pode "acordar" os RFID passivos.
- Mas o retorno das tags ainda precisaria ser captado perto → Várias antenas receptoras.

---

## 🔍 Vantagens da Solução

- Baixo custo por moto (tags baratas e sem manutenção)
- Altamente escalável (mais de 100 mil motos viáveis)
- Vandalismo resistente (tags internas, sem interface visível)
- Automação total com possibilidade futura de operação remota
- Não precisa de bateria
