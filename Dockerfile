FROM ubuntu:14.04 AS builder
WORKDIR /app
COPY src/main.go .
RUN go build -o execute-app main.go

FROM alpine:latest
WORKDIR /app
RUN adduser -D user
COPY --from=builder /app/execute-app .
USER user
CMD ["./execute-app"]
