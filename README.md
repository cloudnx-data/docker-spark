# docker-spark

A Docker-based setup for running Apache Spark locally or in development environments, supporting both standalone and multi-node cluster configurations.

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
    This starts a Spark master and a single worker.

3. **Access Spark UIs:**
    - **Spark Master UI:** [http://localhost:9090](http://localhost:9090)
    - **Spark History Server UI:** [http://localhost:18080](http://localhost:18080)

4. **(Recommended) Install Make for easier usage:**
    For simplified commands and workflow, install [Make](https://www.gnu.org/software/make/) and use the provided `Makefile`:
    ```bash
    # On macOS (with Homebrew)
    brew install make

    # On Ubuntu/Debian
    sudo apt-get install make
    ```
    Then you can run:
    ```bash
    make run-scaled                                   # Start the cluster with 3 nodes
    make down                                         # Stop and remove containers
    make submit --app=path/to/file/file.py            # Submit a Spark job to the cluster
    ```

## Configuration

- Edit `docker-compose.yml` to adjust Spark settings, environment variables, or add/remove services.
- Mount local volumes for data persistence or to share code.

## Stopping the Cluster

To stop and remove containers:
```bash
docker-compose down
or 
make stop
```

## Troubleshooting

- Ensure Docker and Docker Compose are installed and running.
- Check container logs for errors:
    ```bash
    docker-compose logs
    ```

## License

[Apache License 2.0](https://www.apache.org/licenses/LICENSE-2.0)

## Reference

For the official and complete Docker setup for Apache Spark, see the [apache/spark-docker GitHub repository](https://github.com/apache/spark-docker/tree/master).