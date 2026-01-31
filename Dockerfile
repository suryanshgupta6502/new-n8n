# 1. Start with the official n8n image (using Alpine Linux)
FROM n8nio/n8n:latest

# 2. Switch to root user to install new software
USER root

# 3. Install FFmpeg and Fonts
# We use 'apk' because the base image is Alpine Linux
RUN apk add --update ffmpeg font-liberation ttf-dejavu && \
    rm -rf /var/cache/apk/*

# 4. Create a specific folder for media processing to avoid permission errors
RUN mkdir -p /home/node/media && \
    chown -R node:node /home/node/media

# 5. Switch back to the standard 'node' user for security
USER node
