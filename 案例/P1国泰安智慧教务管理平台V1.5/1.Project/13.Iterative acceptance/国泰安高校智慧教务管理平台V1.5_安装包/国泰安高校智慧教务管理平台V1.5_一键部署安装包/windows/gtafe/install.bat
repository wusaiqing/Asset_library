@echo off

%~dp0\redis\redis-server.exe --service-install %~dp0\redis\redis.windows.conf --loglevel verbose
sc start Redis

call %~dp0\gtafe-em\bin\service.bat install
sc config Tomcat8 start= delayed-auto
sc start Tomcat8

@echo ��鰲װ��Ϣ���ޡ�Failed������ʧ�ܡ�����������װ�ɹ�
pause