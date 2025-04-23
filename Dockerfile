# Usa una imagen base de Node.js
FROM node:16

# Establece el directorio de trabajo
WORKDIR /app

# Copia los archivos de package y package-lock
COPY package*.json ./

# Instala las dependencias
RUN npm install --legacy-peer-deps

# Copia el resto de los archivos del proyecto
COPY . .

# Asegúrate de que el binario de Vite sea ejecutable
RUN chmod +x node_modules/.bin/vite

# Construye la aplicación para producción
RUN npm run build

# Expone el puerto de la aplicación
EXPOSE 3000

# Comando por defecto para ejecutar la aplicación
CMD ["npm", "run", "serve"]
