# Todo App

A Todo application built with Flutter, Firebase, and Stacked architecture.

## Table of Contents

- [Features](#features)
- [Getting Started](#getting-started)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Usage](#usage)

## Features

- User authentication with Firebase Authentication.
- Task management with Firebase Firestore.
- MVVM architecture with Stacked.
- Mocking and unit testing with Mockito.
- Bottom sheet and dialog services.

## Getting Started

Follow these instructions to get a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Dart: [Install Dart](https://dart.dev/get-dart)

### Installation

1. **Clone the repository:**

    ```sh
    git clone https://github.com/nidhin579/todo_app.git
    cd todo_app
    ```

2. **Install dependencies:**

    ```sh
    flutter pub get
    stacked generate
    ```

3. **Run the app:**

    ```sh
    flutter run
    ```

### Usage

- **Authentication**: Users can sign up, log in
- **Tasks**: Users can add, update, delete, and filter tasks.
- **Filters**: Tasks can be filtered by status: All, Todo, In Progress, and Done.