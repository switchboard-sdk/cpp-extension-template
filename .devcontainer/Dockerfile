ARG ARCH=amd64
FROM --platform=linux/$ARCH ubuntu:jammy

ARG ARCH

RUN export DEBIAN_FRONTEND=noninteractive && \
  apt-get update && \
  apt-get install -yqq --no-install-recommends \
          build-essential \
          curl \
          git \
          gdb \
          libssl-dev \
          ninja-build \
          openjdk-17-jdk \
          python3 \
          python3-invoke \
          tzdata \
          unzip \
          shellcheck \
          libchromaprint-tools \
          libasound2-dev \
          libpulse-dev \
          awscli && \
  apt-get autoremove -yqq --purge && \
  rm -rf /var/lib/apt/lists/*

# Install CMake 3.30.5
RUN CMAKE_ARCH=$(uname -m) && \
    curl -fsSL -o cmake_install.sh "https://github.com/Kitware/CMake/releases/download/v3.30.5/cmake-3.30.5-linux-${CMAKE_ARCH}.sh" && \
    chmod +x cmake_install.sh && \
    ./cmake_install.sh --skip-license --prefix=/usr/local/ && \
    rm cmake_install.sh

# Create invoke completion script on Linux
RUN inv --print-completion-script bash > ~/.invoke-completion.sh
# Source the script at startup of each shell
RUN echo "source ~/.invoke-completion.sh" >> ~/.bashrc

RUN git config --system --add safe.directory '*'

WORKDIR /switchboard
