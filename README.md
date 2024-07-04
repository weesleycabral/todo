Flutter To-Do List App

Este é um aplicativo de lista de tarefas (To-Do List) desenvolvido em Flutter. Ele permite que os usuários adicionem, editem e excluam tarefas. Os dados são armazenados localmente no dispositivo usando SQLite.
Tecnologias Utilizadas

    Flutter: Framework de desenvolvimento de aplicativos móveis.
    Dart: Linguagem de programação utilizada pelo Flutter.
    SQLite: Banco de dados leve para armazenamento local.

Funcionalidades

    Adicionar novas tarefas.
    Editar tarefas existentes.
    Excluir tarefas.
    Marcar tarefas como concluídas.

Pré-requisitos

    Flutter: Certifique-se de ter o Flutter instalado em sua máquina. Você pode seguir as instruções de instalação no site oficial do Flutter.

Instalação

    Clone o repositório:

sh

git clone https://github.com/seu-usuario/flutter-todo-list.git

    Navegue até o diretório do projeto:

sh

cd flutter-todo-list

    Instale as dependências:

sh

flutter pub get

    Execute o aplicativo:

sh

flutter run

Estrutura do Projeto

bash

flutter-todo-list/
|- lib/
  |- main.dart          # Ponto de entrada do aplicativo
  |- models/            # Modelos de dados
  |- screens/           # Telas do aplicativo
  |- widgets/           # Widgets reutilizáveis
  |- utils/             # Utilitários e helpers
|- assets/              # Recursos estáticos (imagens, fontes, etc.)
|- pubspec.yaml         # Configurações e dependências do Flutter
|- README.md            # Documentação do projeto

Como Usar

    Ao abrir o aplicativo, você verá uma lista de tarefas (inicialmente vazia).
    Para adicionar uma nova tarefa, clique no botão de adicionar (+) na parte inferior da tela.
    Digite o título da tarefa e clique em "Salvar".
    Para editar ou excluir uma tarefa, clique na tarefa desejada e selecione a ação desejada.
    Para marcar uma tarefa como concluída, clique na caixa de seleção ao lado da tarefa.

Contribuição

Contribuições são bem-vindas! Se você deseja contribuir com este projeto, siga os passos abaixo:

    Fork este repositório.
    Crie um branch para sua feature (git checkout -b feature/nova-feature).
    Faça commit das suas alterações (git commit -m 'Adiciona nova feature').
    Envie para o branch (git push origin feature/nova-feature).
    Abra um Pull Request.

Licença

Este projeto está licenciado sob a Licença MIT. Veja o arquivo LICENSE para mais detalhes.
