
# Pre-requisitos

É necessário ter instalado o [Flutter](https://flutter.dev/) nesta versão:

```
Flutter 3.24.5 • channel stable • https://github.com/flutter/flutter.git
Framework • revision dec2ee5c1f (9 days ago) • 2024-11-13 11:13:06 -0800
Engine • revision a18df97ca5
Tools • Dart 3.5.4 • DevTools 2.37.3
```

Para conferir se a versão esta correta, execute o comando `flutter --version` no terminal.

Para conferir se o Flutter foi instalado corretamente, execute o comando `flutter doctor` no terminal.

# Instruções pra instalar e rodar o projeto

No execute no terminal o comando `npx json-server database.json`, para iniciar o json-server para simular a API no arquivo `database.json`.

Em outro terminal execute o comando `flutter run --dart-define=API_BASE_URL=http://endreço_IP_da_sua_máquina:3000` ou a URL de outra api para rodar o projeto.

Por exemplo `flutter run --dart-define=API_BASE_URL=192.168.0.1:3000`

Para gerar o APK do o projeto para instalar no celular Android, execute o comando `flutter build apk` no terminal.

Qual duvida entre em fale comigo:

https://www.linkedin.com/in/leandrorochaadm

[(11) 99711-8447 (WhatsApp)](https://wa.me/5511997118447)

# Teste Técnico Mobile BeTalent

Este é um repositório para Testes Técnicos em Mobile da Be. Ele é destinado a pessoas que participam de nossos processos seletivos. 

Se você chegou até aqui por meio de um formulário de Teste Técnico, siga em frente. Caso contrário, acompanhe a BeTalent no [Linkedin](https://www.linkedin.com/company/betalenttech), [Instagram](https://www.instagram.com/betalent.tech/), [Facebook](https://web.facebook.com/bemobile.tech) ou na nossa newsletter [BeTalent Academy](https://beacademy.substack.com/). Divulgamos novos processos seletivos por lá.

## Desafio

O Teste Técnico Mobile BeTalent consiste em construir a visualização de uma tabela com dados que virão de uma API simulada.

### Mockup

Este é o [projeto em Figma](https://www.figma.com/design/Lpdera6rS8SztMUAwzkpN0/Teste-T%C3%A9cnico-Mobile-BeTalent?node-id=1-4&node-type=canvas&t=NI5lQZvrO1hsQCqz-0) para você se orientar. Nele, você encontrará o guia de estilos e o design da tela a ser construída.

### Requisitos Gerais

Deve-se utilizar React Native ou Flutter para a construção da aplicação.

É permitido utilizar libs externas, mas recomenda-se que seja o mínimo possível.

A tabela deve conter as seguintes colunas:

- imagem (thumb do/a usuário/a);
- nome;
- cargo
- data de admissão;
- telefone.

Também deve ser possível realizar pesquisa na tabela por meio de um input. O input de pesquisa deve permitir filtrar dados por cargo, nome e telefone.

Datas e telefones devem ser formatadas no front-end e não na API.

Tenha instaladas em sua máquina as ferramentas [Git](https://git-scm.com/), [Node.js](https://nodejs.org/en/) e [Yarn](https://yarnpkg.com/), e [React Native](https://reactnative.dev/) ou [Dart](https://dart.dev/) e [Flutter](https://flutter.dev/), para poder trabalhar no projeto.


### Critérios de Avaliação

Em ordem de relevância, avaliaremos:

1. lógica de programação;
2. organização (do código e dos arquivos);
3. proficiência no uso de React Native e/ou Flutter;
4. README, que deve conter, pelo menos, as seguintes informações: sobre o projeto, pré-requisitos e instruções para rodar a aplicação.

É um diferencial na avaliação o uso de TypeScript.

### Envio da Solução

O projeto deverá ser hospedado em um repositório no seu GitHub. O link do repositório deverá ser fornecido por meio do formulário de Teste Técnico encaminhado ao seu e-mail. Não serão aceitos links de projetos enviados por outros meios.

Demais instruções e regras serão instruídas nos formulários e nas comunicações do processo seletivo do qual você está participando.
