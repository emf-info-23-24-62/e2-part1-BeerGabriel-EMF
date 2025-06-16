# Utilisation de l'image Node.js version 18 avec Alpine Linux (version allégée)
FROM node:18-alpine

# Définition du répertoire de travail dans le conteneur
WORKDIR /app

# Installation de Git pour pouvoir cloner le repository
RUN apk add --no-cache git

# Clonage du repository officiel de Hastebin depuis GitHub
RUN git clone https://github.com/toptal/haste-server.git .

# Installation des dépendances Node.js définies dans package.json
RUN npm install

# Copie du fichier de configuration personnalisé depuis le host vers le conteneur
# Le fichier est renommé de config.json à config.js comme requis par l'application
COPY settings/config.json ./config.js

# Copie du fichier HTML personnalisé dans le dossier static de l'application
# Ce fichier contient les personnalisations d'interface (nom, suppression logo Twitter)
COPY settings/index.html ./static/index.html

# Exposition du port 8085 sur lequel l'application sera accessible
EXPOSE 8085

# Commande par défaut pour démarrer l'application
CMD ["npm", "start"] 