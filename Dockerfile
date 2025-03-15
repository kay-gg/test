# Use Golang image as the builder
FROM golang:1.24.1 AS build

# Set working directory
WORKDIR /app

# Copy go.mod and go.sum separately to use Docker caching
COPY go.mod go.sum ./
RUN go mod tidy

# Copy the rest of the source code
COPY . .

# Build the Go application
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /server .

# Use a minimal runtime image
FROM alpine:latest

# Install MySQL client (optional for debugging)
RUN apk add --no-cache mysql-client

# Set working directory
WORKDIR /app

# Copy the built binary from the build stage
COPY --from=build /server .

# Expose the port
EXPOSE 8080

# Run the application
CMD ["./server"]
