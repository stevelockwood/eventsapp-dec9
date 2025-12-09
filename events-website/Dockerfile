FROM public.ecr.aws/docker/library/node:slim
COPY . /app/
WORKDIR /app
RUN npm install 
CMD ["node", "server.js"]

