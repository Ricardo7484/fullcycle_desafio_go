FROM golang:alpine3.17 as build

WORKDIR /src

COPY app.go .

RUN go mod init github.com/google/UUID
RUN go build -o /app .

FROM scratch as bin

COPY --from=build app /

CMD ["/app"]