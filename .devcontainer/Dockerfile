ARG VARIANT="16"
FROM mcr.microsoft.com/devcontainers/javascript-node:1-${VARIANT}

# Set environment variables to disable prompts during gcloud CLI installation
ENV PATH="/google-cloud-sdk/bin:$PATH"

# Install dependencies and the gcloud CLI
#RUN apt-get update && apt-get install -y \
#    curl \
#    apt-transport-https \
#    ca-certificates && \
#    curl -sSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
#    echo "deb https://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-cli.list && \
#    apt-get update && apt-get install -y \
#    google-cloud-cli && \
#    apt-get update && apt-get install -y \
#    apt-get google-cloud-sdk-cloud-run-proxy && \
#    apt-get clean && rm -rf /var/lib/apt/lists/*

# Copy the scripts to the container
COPY scripts/* /workspace/scripts/

# Make all scripts executable
RUN chmod +x /workspace/scripts/*.sh

# Create the ~/.bash_aliases file and add aliases
# RUN touch /home/codespace/.bash_aliases && \
#    for script in /workspace/scripts/*.sh; do \
#    if [ -f "$script" ]; then \
#      script_name=$(basename "$script" .sh); \
#      echo "alias $script_name='bash $script'" | tee -a /home/codespace/.bash_aliases; \
#    fi; \
#  done
