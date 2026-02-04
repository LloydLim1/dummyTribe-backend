# 1. Start with a Linux computer that has Node.js 18 installed
FROM node:18-alpine

# 2. Create a folder inside the container for our app
WORKDIR /app

# 3. Copy our package files first (to install dependencies)
COPY package*.json ./

# 4. Install the dependencies inside the container
RUN npm install

# 5. Copy the rest of our code
COPY . .

# 6. Open port 3000 so the outside world can talk to the app
EXPOSE 3000

# 7. The command to start the app when the container turns on
CMD ["node", "server.js"]