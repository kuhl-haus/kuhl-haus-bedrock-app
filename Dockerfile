ARG BASE_IMAGE=python:3.12
FROM ${BASE_IMAGE}

RUN apt-get update && \
    apt-get install -y --no-install-recommends git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    pip install --no-cache-dir pdm

WORKDIR /libs/bedrock_app
COPY . /libs/bedrock_app/

# Install dependencies and build/install package
RUN pdm install -G testing

# Run tests
RUN pdm run pytest tests -v

# Build wheel
RUN pdm build

# Install into site-packages from wheel
RUN pip install --no-cache-dir /libs/bedrock_app/dist/*.whl
