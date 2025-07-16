FROM python:3.10-bullseye as spark-base

# --- ENV VARIABLES ---
ENV SPARK_HOME=/opt/spark
ENV HADOOP_HOME=/opt/hadoop
ENV PATH="${SPARK_HOME}/sbin:${SPARK_HOME}/bin:${PATH}"
ENV SPARK_MASTER=spark://spark-master:7077
ENV SPARK_MASTER_HOST=spark-master
ENV SPARK_MASTER_PORT=7077
ENV PYSPARK_PYTHON=python3
ENV PYTHONPATH=${SPARK_HOME}/python:${PYTHONPATH}
ENV SPARK_VERSION=4.0.0

# --- SYSTEM DEPENDENCIES ---
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      sudo \
      curl \
      vim \
      unzip \
      rsync \
      openjdk-11-jdk \
      build-essential \
      software-properties-common \
      ssh && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# --- CREATE DIRECTORIES ---
RUN mkdir -p ${HADOOP_HOME} ${SPARK_HOME}
WORKDIR ${SPARK_HOME}

# --- INSTALL SPARK ---
RUN curl -fsSL https://dlcdn.apache.org/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop3.tgz -o spark.tgz && \
    tar -xvzf spark.tgz --strip-components=1 && \
    rm spark.tgz

# --- PYTHON DEPENDENCIES ---
COPY requirements.txt .
RUN pip3 install --no-cache-dir -r requirements.txt

# --- SPARK CONFIGURATION ---
COPY spark-defaults.conf ${SPARK_HOME}/conf/

# --- PERMISSIONS ---
RUN chmod +x ${SPARK_HOME}/sbin/* ${SPARK_HOME}/bin/*

# --- ENTRYPOINT ---
COPY entrypoint.sh .
RUN chmod +x entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
