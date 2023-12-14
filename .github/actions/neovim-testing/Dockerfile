# Use a base image with necessary tools
FROM ubuntu:22.04

RUN apt-get update -y && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:neovim-ppa/unstable && \
    apt-get update -y && \
    apt-get install -y neovim curl

# Install dependencies
# Install Lua, LuaRocks, and their dependencies
RUN apt-get update -y && \
    apt-get install -y lua5.3 lua5.3-dev luarocks

# Install Busted
RUN luarocks install busted

# Set the work directory
WORKDIR /workspace

# Copy entrypoint script
#COPY entrypoint.sh /entrypoint.sh

# Make the entrypoint script executable
#RUN chmod +x /entrypoint.sh

# Set the entrypoint
#ENTRYPOINT ["/entrypoint.sh"]

