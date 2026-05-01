FROM nginx:alpine

# Copy your custom Nginx config
COPY docker/frontend/nginx.conf /etc/nginx/conf.d/default.conf

# Copy the static frontend files (assuming they are in app/frontend)
COPY dashboard/ /usr/share/nginx/html/

EXPOSE 80