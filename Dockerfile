FROM elixir:1.14

ARG ENV=prod

ENV MIX_ENV=$ENV

WORKDIR /opt/build

ADD ./bin/release.sh ./bin/release.sh

CMD ["bin/release.sh", $ENV]
