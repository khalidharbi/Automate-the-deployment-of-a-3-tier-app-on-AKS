

# Use Node.js 20 Alpine as base image
FROM node:20-alpine AS builder

WORKDIR /app
COPY package*.json ./
RUN npm ci

# Copy source and build
COPY . .
RUN npm run build   # <---- this creates /app/dist if your project builds

# ===== RUNTIME STAGE =====
FROM node:20-alpine
WORKDIR /app

COPY package*.json ./
RUN npm ci --only=production

# Copy built app
COPY --from=builder /app/dist ./dist

EXPOSE 3001
CMD ["npm", "start"]
