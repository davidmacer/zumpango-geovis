FROM davidmacer/shiny-geospatial
# Difine app/ como el directorio de trabajo dentro del contenedor
WORKDIR /app 
# Copia los archivos que están dentro de /serloc-app al directorio de trabajo
COPY ui.R .
COPY server.R .
# Otorga todos los permisos al workdir 
RUN chmod -R 777 .
# Expón el puerto del contenedor
EXPOSE 4040
# Agrega usuario para tener persmisos de administrador     
RUN useradd shiny_user
USER shiny_user
# Corre aplicación dentro del contenedor
CMD ["R", "-e", "shiny::runApp('/app', host = '0.0.0.0', port = 4040)"]
