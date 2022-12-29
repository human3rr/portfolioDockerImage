FROM debian:11.6
RUN apt update && apt install -y nodejs openssl git npm
RUN DEBIAN_FRONTEND="noninteractive" apt-get -y install tzdata
RUN git clone https://github.com/human3rr/portfolioServer.git
WORKDIR /portfolioServer
RUN npm install
RUN mkdir cert; 
WORKDIR /portfolioServer/cert
RUN openssl genrsa -out key.pem; openssl req -new -key key.pem -out csr.pem -subj "/C=GB/ST=London/L=London/O=Global Security/OU=IT Department/CN=example.com"
RUN openssl x509 -req -days 365 -in csr.pem -signkey key.pem -out cert.pem; mv key.pem private.key.pem; mv cert.pem domain.cert.pem
WORKDIR /portfolioServer
RUN git clone https://github.com/human3rr/portfolio.git
WORKDIR /portfolioServer/portfolio
RUN git clone https://github.com/human3rr/memoryGame.git
RUN git clone https://github.com/human3rr/snake.git
RUN git clone https://github.com/human3rr/motivation-tracker.git
WORKDIR /portfolioServer/portfolio/motivation-tracker
RUN npm install; npm run build
WORKDIR /portfolioServer
ADD pullAndRun.sh .
CMD ./pullAndRun.sh
#CMD node serveFiles.js
