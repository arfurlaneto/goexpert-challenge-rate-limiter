FROM golang:1.21.1 as builder
WORKDIR /app
COPY . .
RUN GOOS=linux CGO_ENABLED=0 go build -ldflags="-w -s" -o server cmd/server/main.go

FROM scratch
COPY --from=builder /app/server .
CMD ["./server"]
