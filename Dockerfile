ARG BASE_IMAGE=ghcr.io/kuhl-haus/kuhl-haus-metrics:latest
FROM ${BASE_IMAGE}

WORKDIR /libs/bedrock_app
COPY . /libs/bedrock_app/
RUN pip install --no-cache-dir --upgrade -r /libs/bedrock_app/requirements.txt
RUN pip install --no-cache-dir .
RUN pytest /libs/bedrock_app/tests -v
