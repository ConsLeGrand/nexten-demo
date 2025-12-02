FROM nginx:alpine

# Supprime la page par défaut
RUN rm -rf /usr/share/nginx/html/*

# Copie ton application dans le dossier web
COPY app/ /usr/share/nginx/html/

RUN sed -i 's/listen       80;/listen       8080;/' /etc/nginx/conf.d/default.conf

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
