FROM node:10-alpine

# before, I got the below error:
# Error: Could not locate the bindings file. Tried:
# → C:\Users\Admin_Ajay\edi_blockchain\node_modules\ursa\build\ursaNative.node
# ...
# the below piece of code is from here: https://github.com/nodejs/docker-node/issues/384#issuecomment-305208112
# So, first I put 'npm install --save ursa', and then this code
RUN apk --no-cache add --virtual native-deps \
  g++ gcc libgcc libstdc++ linux-headers make python && \
  npm install --quiet node-gyp -g &&\
  apk del native-deps
# End of code
