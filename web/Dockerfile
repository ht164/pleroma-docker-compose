FROM mpneuried/elixir-alpine:1.5.2

WORKDIR /pleroma

RUN apk -U upgrade \
  && apk add alpine-sdk \
      openssh \
      git

COPY pleroma/. /pleroma/.

RUN mix deps.get

COPY docker_entrypoint.sh /.

ENTRYPOINT ["/docker_entrypoint.sh"]
