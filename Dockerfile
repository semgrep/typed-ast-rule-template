FROM node:11.10.0-alpine

RUN apk add --no-cache git bash shadow

RUN groupadd -r analysis && useradd -m --no-log-init --system --gid analysis analysis
RUN chown -R analysis:analysis /home/analysis

USER analysis
COPY --chown=analysis:analysis src /analyzer
WORKDIR /analyzer/
RUN npm install
RUN npm run-script build

USER root
RUN apk del shadow

USER analysis
WORKDIR /
CMD ["/analyzer/analyze.sh"]
