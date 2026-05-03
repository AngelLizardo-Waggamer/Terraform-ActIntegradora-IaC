FROM nginx:1.27-alpine

# Remove default nginx config and page
RUN rm /etc/nginx/conf.d/default.conf /usr/share/nginx/html/*

# Copy custom nginx config and app files
COPY app/nginx.conf /etc/nginx/conf.d/default.conf
COPY app/index.html /usr/share/nginx/html/index.html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
