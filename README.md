# docker-spark
Docker-based setup for running Apache Spark locally or in development environments, supporting standalone or multi-node cluster configurations.

## Features

- Run Apache Spark in standalone or cluster mode using Docker Compose
- Easily configurable for single-node or multi-node setups
- Includes Spark master, worker(s), and optional Jupyter Notebook support

## Prerequisites

- [Docker](https://www.docker.com/get-started)
- [Docker Compose](https://docs.docker.com/compose/)

## Getting Started

1. **Clone the repository:**
    ```bash
    git clone https://github.com/yourusername/docker-spark.git
    cd docker-spark
    ```

2. **Start Spark in standalone mode:**
    ```bash
    docker-compose up
    ```
    This will start a Spark master and a single worker.

3. **Access Spark UI:**
- Spark History Server UI: [http://localhost:18080](http://localhost:18080)
- Spark Master  Server UI: [http://localhost:18080](http://localhost:9090)
      
4. **(Recommended) Install Make for easier usage:**
    - For simplified commands and workflow, install [Make](https://www.gnu.org/software/make/) and use the provided `Makefile`:
        ```bash
        # On macOS (with Homebrew)
        brew install make

        # On Ubuntu/Debian
        sudo apt-get install make
        ```
    - Then you can run:
        ```bash
        make run-scaled                                   # Start the cluster with 3 nodes
        make down                                         # Stop and remove containers
        make submit --app=path/to/file/file.py            # View logs
        ```

## Configuration

- Edit `docker-compose.yml` to adjust Spark settings, environment variables, or add/remove services.
- Mount local volumes for data persistence or sharing code.

## Stopping the Cluster

To stop and remove containers:
```bash
docker-compose down
```

## Troubleshooting

- Ensure Docker and Docker Compose are installed and running.
- Check container logs for errors:
  ```bash
  docker-compose logs
  ```

## License

Apache License