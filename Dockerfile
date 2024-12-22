# Use rocker/r-ver for multi-architecture support (ARM64 and AMD64)
FROM rocker/r-ver:4

# Set the working directory
WORKDIR /app

# Copy renv files early to leverage Docker caching
COPY renv.lock /app/
COPY renv/ /app/renv/

# Install system dependencies for R packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install renv and restore the environment
RUN R -e "install.packages('renv')" && \
    R -e "renv::restore()"

# Copy the application script
COPY main.R /app/

# Set the default command to run the R script
CMD ["Rscript", "main.R"]
