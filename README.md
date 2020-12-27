# pptp-client-linux
pptp客户端的Docker镜像，不需要任何配置文件，只需在环境变量中设置服务端IP、用户名、密码、自定义VPN路由等信息即可。
已实现自动重连功能，VPN断开后，会自动进行重连，检查间隔为10秒。
## 启动PPTP客户端
使用Docker container启动：

````
docker run -d --privileged --net=host \
--name pptp-client-linux \
--env SERVER=xxx.xxx.xxx.xxx \
--env USERNAME=username \
--env PASSWORD=password \
--env ROUTES=172.18.0.0:255.255.255.0,192.168.0.0:255.255.255.0 \
azi03/pptp-client-linux
````
其中自定义路由（ROUTES）是由IP段和子网掩码组成，可设置多个路由，用半角逗号“,”分隔，IP段和子网掩码之间用半角冒号“:”分隔，设置的自定义路由将路由到ppp0的VPN中。



**注意：**在以“--net=host”模式启动容器之前，请阅读Docker中以“host”模式联网的工作原理：
https://docs.docker.com/reference/run/#mode-host
