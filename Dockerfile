FROM elixir:1.15-alpine AS build

WORKDIR /app

RUN apk update && apk add --no-cache git build-base

COPY mix.exs mix.lock ./

RUN mix deps.get

COPY . .

RUN mix deps.compile

EXPOSE 4000

CMD ["mix", "phx.server"]
