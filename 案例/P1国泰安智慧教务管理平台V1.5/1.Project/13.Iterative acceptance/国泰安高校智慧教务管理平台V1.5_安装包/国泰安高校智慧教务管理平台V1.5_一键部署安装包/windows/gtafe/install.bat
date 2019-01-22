@echo off

%~dp0\redis\redis-server.exe --service-install %~dp0\redis\redis.windows.conf --loglevel verbose
sc start Redis

call %~dp0\gtafe-em\bin\service.bat install
sc config Tomcat8 start= delayed-auto
sc start Tomcat8

@echo 检查安装信息，无“Failed”、“失败”字样，即安装成功
pause