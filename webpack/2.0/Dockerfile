FROM node:6.11.0

RUN apt-get update && apt-get install -yyq \
  sudo \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["bash"]
