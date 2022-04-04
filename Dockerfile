FROM public.ecr.aws/lambda/nodejs:12

ARG RELEASE=''

ENV RELEASE=${RELEASE}


COPY package.json /var/task/package.json

COPY node_modules /var/task/node_modules/

COPY dist /var/task/dist/
