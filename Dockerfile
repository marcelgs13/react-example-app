# Imagem antiga deliberadamente vulnerável para validação do Trivy
FROM node:14.15.0-buster
WORKDIR /app
COPY . .
CMD ["npm", "start"]
