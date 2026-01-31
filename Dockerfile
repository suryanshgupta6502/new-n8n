# 1. Use the official image
FROM n8nio/n8n:latest

# 2. Switch to root user to install tools
USER root

# 3. Install FFmpeg and Fonts (Using apt-get for Debian)
RUN apt-get update && \
    apt-get install -y ffmpeg fonts-liberation fontconfig && \
    rm -rf /var/lib/apt/lists/*

# 4. Create the media folder (Safe permissions)
RUN mkdir -p /home/node/media && \
    chown -R node:node /home/node/media

# 5. Switch back to the 'node' user
USER node
