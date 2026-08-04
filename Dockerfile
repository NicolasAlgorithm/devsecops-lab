FROM golang:alpine AS builder
WORKDIR /app
COPY src/main.go .
RUN go build -o execute-app main.go

FROM alpine:latest
WORKDIR /app
COPY --from=builder /app/execute-app .
EXPOSE 8080
CMD ["./execute-app"]
