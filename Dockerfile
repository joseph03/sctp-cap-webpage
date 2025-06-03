# Pure Nginx frontend
FROM nginx:alpine
COPY index.html /usr/share/nginx/html/
COPY nginx.conf /etc/nginx/nginx.conf
# not sure why 80 cannot work
EXPOSE 80    
EXPOSE 3000 
CMD ["nginx", "-g", "daemon off;"]