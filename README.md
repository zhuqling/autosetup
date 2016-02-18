# autosetup
automation setup software

## centos

### redis

```bash
curl -s https://raw.githubusercontent.com/zhuqling/autosetup/master/centos_redis_install.sh | tr -d '\r' > redis_install.sh && bash redis_install.sh VERSION
```

while service and daemon command can not run in machine, should run this:

```bash
curl -s https://raw.githubusercontent.com/zhuqling/autosetup/master/centos_redis_install_no_service_platform.sh | tr -d '\r' > centos_redis_install_no_service_platform.sh && bash redis_install.sh VERSION
```