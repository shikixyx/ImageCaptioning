FROM node:12

# アプリケーションディレクトリを作成する
WORKDIR /usr/src/app

# アプリケーションの依存関係をインストールする
# ワイルドカードを使用して、package.json と package-lock.json の両方が確実にコピーされるようにします。
# 可能であれば (npm@5+)
COPY ./app/package*.json ./

# RUN npm install
# RUN npm install --global yarn
# 本番用にコードを作成している場合
# RUN npm install --only=production

# Yarn
RUN yarn install

# アプリケーションのソースをバンドルする
COPY ./app/ .

EXPOSE 3000

CMD [ "yarn" ,"run","dev"]