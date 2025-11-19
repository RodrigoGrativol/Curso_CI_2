FROM golang:1.21 AS builder

WORKDIR /app
COPY . .

RUN go build -o main .

# imagem final
FROM ubuntu:latest

WORKDIR /app
COPY --from=builder /app/main .

EXPOSE 8000
CMD ["./main"]
