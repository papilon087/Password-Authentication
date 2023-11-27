FROM elixir:alpine

# Set environment variables
ENV MIX_ENV=prod \
    APP_HOME=/app

# Install build dependencies
RUN apk --no-cache add build-base

# Install Hex and Rebar
RUN mix local.hex --force && \
    mix local.rebar --force

WORKDIR $APP_HOME

# Install and compile dependencies
COPY mix.exs mix.lock ./
COPY config config
RUN mix deps.get --only prod
RUN mix deps.compile

# Copy the application code
COPY lib lib
COPY priv priv

# App Port
EXPOSE 4000

# Default Command
CMD ["mix", "phx.server"]
