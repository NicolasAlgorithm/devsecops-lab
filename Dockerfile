FROM golang:alpine AS builder
WORKDIR /app
COPY src/main.go .
RUN go build -o execute-app main.go

FROM ubuntu:14.04
WORKDIR /app
RUN adduser -D user
COPY --from=builder /app/execute-app .
USER user
CMD ["./execute-app"]
