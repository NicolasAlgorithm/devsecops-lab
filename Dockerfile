FROM golang:alpine AS builder
WORKDIR /app
COPY src/main.go .
RUN go build -o execute-app main.go

FROM alpine:3.11
WORKDIR /app
COPY --from=builder /app/execute-app .
CMD ["./execute-app"]
