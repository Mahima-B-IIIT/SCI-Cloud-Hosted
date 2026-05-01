FROM nginx:alpine

# Copy your index.html into the Nginx public folder
COPY app/dashboard/index.html /usr/share/nginx/html/index.html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]