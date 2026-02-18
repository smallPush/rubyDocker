# Ruby on Rails with Docker

This is a modern Ruby on Rails application (version 7.1+) containerized with Docker. It uses PostgreSQL as the database and is pre-configured for a smooth development workflow.

## Prerequisites

Ensure you have the following installed:
- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Getting Started

Follow these steps to get the application up and running:

1.  **Clone the repository:**
    ```bash
    git clone <repository-url>
    cd rubyDocker
    ```

2.  **Build and start the containers:**
    ```bash
    docker-compose up --build
    ```
    This command will:
    - Build the Rails application image.
    - Pull the PostgreSQL image.
    - Create and start the containers.
    - Automatically create the database and run migrations (via `entrypoint.sh`).

3.  **Access the application:**
    Open your browser and navigate to `http://localhost:3000`. You should see the Rails welcome page or the health check at `http://localhost:3000/up`.

## Common Commands

### Running Rails Commands
To run Rails commands inside the container, use `docker-compose exec`:

- **Generate a controller:**
  ```bash
  docker-compose exec web bundle exec rails generate controller Welcome index
  ```
- **Run migrations manually:**
  ```bash
  docker-compose exec web bundle exec rails db:migrate
  ```
- **Open Rails console:**
  ```bash
  docker-compose exec web bundle exec rails console
  ```

### Database Management
The database is managed automatically on startup, but you can also manage it manually:

- **Reset database:**
  ```bash
  docker-compose exec web bundle exec rails db:reset
  ```

### Running Tests
To run the test suite:
```bash
docker-compose exec web bundle exec rails test
```

## Troubleshooting

- **Server already running?** If you see an error like `A server is already running. Check /app/tmp/pids/server.pid`, the `entrypoint.sh` is designed to handle this by removing the stale PID file on startup.
- **Database connection issues:** Ensure the `db` service is healthy. You can check logs with `docker-compose logs db`.

## Project Configuration

- **Ruby Version:** 3.3.0
- **Rails Version:** 7.1.6
- **Database:** PostgreSQL 15
- **Assets:** Importmaps & Sprockets
