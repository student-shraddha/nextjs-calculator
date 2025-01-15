# Stage 1: Build the Next.js app
FROM node:18 AS builder

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json (or yarn.lock) to the container
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application to the container
COPY . .

# Build the Next.js app for production
RUN npm run build

# Stage 2: Serve with NGINX
FROM nginx:alpine

# Set the working directory for NGINX
WORKDIR /usr/share/nginx/html

# Copy the built Next.js app from the builder stage
COPY --from=builder /app/.next ./next
COPY --from=builder /app/public ./public

# Copy custom NGINX configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose the container on port 80
EXPOSE 80

# Start NGINX server
CMD ["nginx", "-g", "daemon off;"]

