from node:latest

WORKDIR server
RUN npm install http-server -g
RUN echo "it works!" > index.html
CMD http-server . -p 80
