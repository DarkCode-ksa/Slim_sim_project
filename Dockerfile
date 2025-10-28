FROM jupyter/base-notebook

# Install dependencies
RUN apt-get update && apt-get install -y \
    gcc \
    g++ \
    make \
    wget \
    cmake \
    libgsl-dev \
    && rm -rf /var/lib/apt/lists/*

# Set up environment
COPY environment.yml /tmp/environment.yml
RUN conda env create -f /tmp/environment.yml && conda clean -a

# Copy SLiM installation script
COPY postBuild /tmp/postBuild
RUN bash /tmp/postBuild

# Set working directory
WORKDIR /home/jovyan

# Expose port
EXPOSE 8888
