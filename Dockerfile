# Build executado na arquitetura nativa do runner
FROM --platform=$BUILDPLATFORM node:22-alpine AS build

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm ci

COPY . .
RUN npm run build


# Imagem final multi-arquitetura
FROM nginx:alpine

# Atualiza pacotes da imagem para versões corrigidas
RUN apk upgrade --no-cache

COPY --from=build /app/build /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
