# Usa una imagen oficial de Node.js
FROM node:18

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia el package.json y package-lock.json
COPY package*.json ./

# Instala las dependencias
RUN npm install --legacy-peer-deps

# Copia el resto de los archivos del frontend
COPY . .

# Asegúrate de que el comando vite tenga permisos de ejecución
RUN chmod +x node_modules/.bin/vite

# Construye la aplicación para producción
RUN npm run build

# Expone el puerto para la aplicación
EXPOSE 3000

# Define el comando para ejecutar el servidor de la app
CMD ["npm", "run", "preview"]
