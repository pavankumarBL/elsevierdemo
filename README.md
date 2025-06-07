# Elsevier Demo

This project is a Spring Boot Java API application designed to demonstrate best practices for building RESTful services.

## Table of Contents

- [Project Overview](#project-overview)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Getting Started](#getting-started)
- [Running the Application](#running-the-application)
- [API Documentation](#api-documentation)
- [Testing](#testing)
- [Contributing](#contributing)
- [License](#license)

## Project Overview

The Elsevier Demo API provides a foundation for building scalable and maintainable Java backend services using Spring Boot.

## Features

- RESTful API endpoints
- Exception handling
- Logging
- Unit and integration tests
- API documentation (Swagger/OpenAPI)

## Tech Stack

- Java 17+
- Spring Boot
- Maven or Gradle
- H2/PostgreSQL/MySQL (choose your DB)
- JUnit & Mockito

## Getting Started

### Prerequisites

- Java 17 or higher
- Maven or Gradle
- Git

### Clone the repository

```bash
git clone https://github.com/yourusername/elsevierdemo.git
cd elsevierdemo
```

### Build the project

```bash
# Using Maven
mvn clean install

# Or using Gradle
./gradlew build
```

## Running the Application

```bash
# Using Maven
mvn spring-boot:run

# Or using Gradle
./gradlew bootRun
```

The application will start on [http://localhost:8080](http://localhost:8080).

## API Documentation

API documentation is available at [http://localhost:8080/swagger-ui.html](http://localhost:8080/swagger-ui.html) after starting the application.

## Testing

Run tests using:

```bash
# Using Maven
mvn test

# Or using Gradle
./gradlew test
```

## Contributing

Contributions are welcome! Please open issues or submit pull requests for improvements.

## License

This project is licensed under the MIT License.