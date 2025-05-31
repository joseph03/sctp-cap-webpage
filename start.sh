#!/bin/sh
# Start backend proxy
node /app/backend/server.js &

# Start nginx
nginx -g 'daemon off;'