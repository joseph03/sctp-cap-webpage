FROM nginx:alpine

# Install Node.js for backend proxy
RUN apk add --update nodejs npm

# Set up backend proxy
WORKDIR /app/backend
COPY backend/package*.json ./
RUN npm install --production
COPY backend/server.js ./

# Set up frontend
COPY frontend/index.html /usr/share/nginx/html/
COPY nginx.conf /etc/nginx/nginx.conf
COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 3000 8080
CMD ["/start.sh"]