FROM nginx:alpine

# Supprime la page par défaut
RUN rm -rf /usr/share/nginx/html/*

# Donner les permissions nécessaires pour OpenShift
RUN mkdir -p /var/cache/nginx /var/run /var/log/nginx \
    && chmod -R 777 /var/cache/nginx /var/run /var/log/nginx /etc/nginx/conf.d

# Modifier le port d’écoute vers 8080
RUN sed -i 's/listen       80;/listen       8080;/' /etc/nginx/conf.d/default.conf

# Copier l'application
COPY app/ /usr/share/nginx/html/

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
