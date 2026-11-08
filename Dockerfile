# hadolint ignore=DL3007
FROM ghcr.io/actions/actions-runner:latest

USER root

# hadolint ignore=DL3008,DL3015
RUN apt-get update && apt-get install -y \
    curl \
    gnupg \
    jq \
    git \
    unzip \
    && rm -rf /var/lib/apt/lists/*

# ---- Node ----
# hadolint ignore=DL3008,DL3015,DL4006
RUN curl -fsSL https://deb.nodesource.com/setup_26.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

# hadolint ignore=DL3016
RUN npm install -g yarn
# --------------

USER runner
