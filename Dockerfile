# Run container via:
# docker build --no-cache -t v0.29.1 --build-arg source_version=v0.29.1 --build-arg source_repo=github.com/tendermint/tendermint .
FROM golang:1.10.3-alpine AS build-env

ARG source_repo
ARG source_version
RUN apk add --no-cache make git bash

RUN go get -u ${source_repo}/...
WORKDIR /go/src/github.com/tendermint/tendermint

RUN git fetch --tags ; git checkout ${source_version} -b build; \
    git clean -fd

RUN make get_tools && \
    make get_vendor_deps && \
    make build

# -----------------------------------------------------------------------------------
# Final image
FROM alpine:3.8

COPY --from=build-env /go/src/github.com/tendermint/tendermint/build/tendermint /bin/tendermint

# Tendermint will be looking for genesis file in /tendermint (unless you change
# `genesis_file` in config.toml). You can put your config.toml and private
# validator file into /tendermint.
#
# The /tendermint/data dir is used by tendermint to store state.
ENV DATA_ROOT /tendermint
ENV TMHOME $DATA_ROOT

# Set user right away for determinism
RUN addgroup tmuser && \
    adduser -S -G tmuser tmuser

# Create directory for persistence and give our user ownership
RUN mkdir -p $DATA_ROOT && \
    chown -R tmuser:tmuser $DATA_ROOT

# jq and curl used for extracting `pub_key` from private validator while
# deploying tendermint with Kubernetes. It is nice to have bash so the users
# could execute bash commands.
RUN apk add --no-cache bash curl jq


# Expose the data directory as a volume since there's mutable state in there
VOLUME $DATA_ROOT

# p2p port
EXPOSE 26656
# rpc port
EXPOSE 26657

ENTRYPOINT ["tendermint"]

CMD ["node", "--moniker=`hostname`"]
