# Start from the Jupyter minimal-notebook image
FROM quay.io/jupyter/minimal-notebook:afe30f0c9ad8

# Switch to root so we can install packages into the base environment
USER root

# Copy the conda lock file into the image
# (If your file is named conda-lock.yml instead, adjust accordingly)
COPY conda-linux-64.lock /tmp/conda-linux-64.lock

# Install packages from the explicit lock file
RUN mamba install --yes --name base --file /tmp/conda-linux-64.lock && \
    mamba clean --all -f -y

# Switch back to the default notebook user
USER ${NB_UID}
