# use the official OpenResty Alpine image
FROM openresty/openresty:alpine

# install build dependencies for LuaRocks
RUN apk add --no-cache build-base openssl-dev

# install Lapis and any other Lua rocks you need
RUN luarocks install lapis

# copy your local project files into the container
COPY . /app
WORKDIR /app

# expose the port Lapis will run on
EXPOSE 8080

# command to start the server
CMD ["lapis", "server"]
