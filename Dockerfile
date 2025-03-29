ARG BASE_IMAGE=python:3.12-slim
FROM ${BASE_IMAGE}

WORKDIR /libs/bedrock_app
COPY . /libs/bedrock_app/

# Install PDM
RUN pip install --no-cache-dir pdm

# Install the package directly from the wheel
RUN pdm build && pip install --no-cache-dir /libs/bedrock_app/dist/*.whl

# Set entrypoint to python
ENTRYPOINT ["python"]
