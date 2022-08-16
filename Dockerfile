FROM golang:alpine
WORKDIR /go/src/github.com/josiokoko/movies-parser
COPY main.go go.mod ./
RUN apt -y update
RUN go get -v
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app main.go

FROM alpine:latest  
LABEL Maintainer josiokoko
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=0 /go/src/github.com/josiokoko/movies-parser/app .
CMD ["./app"] 
