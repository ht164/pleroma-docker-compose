FROM mpneuried/elixir-alpine

WORKDIR /pleroma

RUN apk -U upgrade \
  && apk add alpine-sdk \
      openssh \
      git

COPY pleroma/. /pleroma/.

RUN mix deps.get

COPY docker_entrypoint.sh /.

ENTRYPOINT ["/docker_entrypoint.sh"]
