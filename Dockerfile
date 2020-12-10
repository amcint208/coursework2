# sets a base image using node

FROM node:6.14.2

# opens required ports

EXPOSE 8080

# copies server.js file

COPY server.js .

# command to run container

CMD node server.js
