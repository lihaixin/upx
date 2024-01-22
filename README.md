## 构建镜像

```
docker buildx build --platform linux/arm64,linux/amd64 -t lihaixin/upx . --push

docker buildx build --platform linux/amd64  -t lihaixin/upx . --push
docker buildx build --platform linux/arm64  -t lihaixin/upx .
docker buildx build --platform linux/arm  -t lihaixin/upx .
docker buildx build --platform linux/386  -t lihaixin/upx .
```


```
docker pull lihaixin/upx
docker stop upx  && docker rm upx 
docker run -itd \
--name upx \
--restart=always \
--net=host \
lihaixin/upx
```
