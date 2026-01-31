# # 1. Use the official image
# FROM n8nio/n8n:latest

# # 2. Switch to root user to install tools
# USER root

# # 3. Install FFmpeg and Fonts (Using apt-get for Debian)
# RUN apt-get update && \
#     apt-get install -y ffmpeg fonts-liberation fontconfig && \
#     rm -rf /var/lib/apt/lists/*

# # 4. Create the media folder (Safe permissions)
# RUN mkdir -p /home/node/media && \
#     chown -R node:node /home/node/media

# # 5. Switch back to the 'node' user
# USER node





# Use a minimal Alpine image temporarily to access apk utilities
FROM alpine:latest AS alpine

# Use the official n8n image as the base for our final image
FROM n8nio/n8n:latest

# Copy apk and its dependencies from the Alpine image
COPY --from=alpine /sbin/apk /sbin/apk
COPY --from=alpine /usr/lib/libapk.so* /usr/lib/

# Switch to the root user to perform system-level installations
USER root

# Install FFmpeg using apk and clean up cache files to reduce image size
RUN apk update && \
    apk add --no-cache ffmpeg && \
    rm -rf /var/cache/apk/*

# Switch back to the less-privileged 'node' user for security best practices
USER node
