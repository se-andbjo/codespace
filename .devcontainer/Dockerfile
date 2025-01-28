ARG VARIANT="16"
FROM mcr.microsoft.com/devcontainers/javascript-node:1-${VARIANT}

# Set environment variables to disable prompts during gcloud CLI installation
ENV CLOUD_SDK_VERSION=437.0.1
ENV PATH="/google-cloud-sdk/bin:$PATH"

# Install dependencies and the gcloud CLI
RUN apt-get update && apt-get install -y \
    curl \
    apt-transport-https \
    ca-certificates && \
    curl -sSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    echo "deb https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
    apt-get update && apt-get install -y \
    google-cloud-sdk=${CLOUD_SDK_VERSION} && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Verify the installation
RUN gcloud --version

# Set the default command
CMD ["gcloud", "--help"]