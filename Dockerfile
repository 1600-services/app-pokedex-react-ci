# Etapa de construcción
FROM node:14 AS build-frontend

WORKDIR /app

COPY package*.json ./
RUN npm install

# Copia el resto de los archivos de tu aplicación
COPY . .

# Compila tu aplicación
RUN npm run build

# Etapa de producción
FROM node:14-alpine AS production-frontend

WORKDIR /app

# Copia los archivos de la etapa de construcción
COPY --from=build-frontend /app ./

# Expón el puerto si es necesario
EXPOSE 5000

CMD ["npm", "start"]
