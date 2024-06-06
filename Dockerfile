FROM heroku/heroku:22-build
RUN apt-get update && apt-get install -y golang-go

ADD . /go/src/github.com/m-lab/prometheus-bigquery-exporter
WORKDIR /go/src/github.com/m-lab/prometheus-bigquery-exporter
ENV CGO_ENABLED 0
ENV GOPATH /go
RUN go vet && \
    go get -t . && \
    go install .

# FROM heroku/heroku:22
# COPY --from=builder /go/bin/prometheus-bigquery-exporter /app/bin/prometheus-bigquery-exporter
# ENTRYPOINT  [ "/app/bin/prometheus-bigquery-exporter" ]
