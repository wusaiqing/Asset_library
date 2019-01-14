ApachePasswd说明


　　这是一个用于修改Apache中AuthUserFile的工具，编写时主要是为了远程修改基于Apache配置的Subversion的用户密码。
　　目前提供for apache2.0版本及for apache2.2版本。

　　当Subversion配置成作为Apache的一个模块运行时，在httpd.conf中可能是类似这下面这样的语句：
　　
<Location /svn>
DAV svn
SVNParentPath C:\SVN_repos
AuthType Basic
AuthName "Subversion repositories"
AuthUserFile C:\SVN_repos\passwd
AuthzSVNAccessFile C:\SVN_repos\access.conf
Require valid-user
</Location>

　　ApacehPasswd就是用来修改上面配置中的C:\SVN_repos\passwd这个文件的


　　使用方法：
　　1将文件Apache2xPasswd.cgi及Apache2xPasswd.cgi.ini复制到Apache的CGI脚本目录下，通常是cgi -bin目录。(这句话中的x请用相应的版本代替，如for apache2.0，则为Apache20Passwd.cgi)
　　2如果是for apache2.2版本，复制apache的bin目录下libapr-1.dll、libapriconv-1.dll、libaprutil-1.dll到Apache2xPasswd.cgi所在的目录
　　3修改配置文件Apache2xPasswd.cgi.ini中auth_user_file路径，如下

[path]
auth_user_file=这里改为你的Subversion所用的AuthUserFile全路径，如C:\SVN_repos\passwd

　　4现在访问你服务器的http://localhost/cgi-bin/Apache2xPasswd.cgi就可以看到修改subversion密码的界面了。

备注：
1配置文件可用的配置项

[path]
auth_user_file=这里改为你的Subversion所用的AuthUserFile全路径，如C:\SVN_repos\passwd
日志文件名
log_file=svnpass.log
[setup]
password_min_length=1
[html]
title=修改SubVersion密码
description=修改SubVersion密码
your_name = 用户名
old_password = 旧密码
new_password1 = 新密码
new_password2 = 验证新密码
btn_change = 修 改
btn_reset = 重 置

change_password_ok=成功修改密码
change_password_failed=修改密码失败
old_password_error=旧密码错误
server_error=服务器错误
password_must_greater=密码位数必须大于
two_password_not_matched=两密码不一致
please_enter_name=请输入用户名
back=返回

2我一般用时都是将Apache2xPasswd.cgi改名为svnpass,这样用户修改密码时可以少打些字，
如访问http://192.168.0.1/cgi-bin/svnpass就可以修改密码了，
当改名为svnpass时，配置文件Apache2xPasswd.cgi.ini要相应地改为svnpass.ini，因为这个脚本是根据自己的文件名找配置文件的



作者：PCplayer　(try876@gmail.com) http://www.iUseSVN.com
2006-6-9 23:46
修改2007-12-09