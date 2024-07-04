# Flutter To-Do List

Este é um aplicativo de lista de tarefas (To-Do List) desenvolvido em Flutter. Ele permite que os usuários adicionem, editem e excluam tarefas. Os dados são armazenados localmente no dispositivo usando SQLite.

## Tecnologias Utilizadas

- **Flutter**: Framework de desenvolvimento de aplicativos móveis.
- **Dart**: Linguagem de programação utilizada pelo Flutter.
- **SQLite**: Banco de dados leve para armazenamento local.

## Funcionalidades

- Adicionar novas tarefas.
- Editar tarefas existentes.
- Excluir tarefas.
- Marcar tarefas como concluídas.

## Pré-requisitos

- **Flutter**: Certifique-se de ter o Flutter instalado em sua máquina. Você pode seguir as instruções de instalação no site oficial do [Flutter](https://flutter.dev/docs/get-started/install).

## Instalação

1. Clone o repositório:

    ```sh
    git clone https://github.com/seu-usuario/flutter-todo-list.git
    ```

2. Navegue até o diretório do projeto:

    ```sh
    cd flutter-todo-list
    ```

3. Instale as dependências:

    ```sh
    flutter pub get
    ```

4. Execute o aplicativo:

    ```sh
    flutter run
    ```

## Estrutura do Projeto

```plaintext
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
