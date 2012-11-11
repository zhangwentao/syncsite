#syncsite

##who use it
if your work like this:you are building a site,all file of the site are within a directory(I call this ROOT),and you have two copies of it,one on your local computer,one on a remote test machine.you need to edit files on local,and need to test on the remote.
so you often need to sync the files between local and remote,down file override the local copy or upload file to remote to override the remote copy.

##usage	
	#these 4 const you need to specify
	#your account name on remote computer
	USER_NAME='wentao_zhang'
	#host name or ip addr of remote compter
	HOST='wentao.me'
	#the site root directory on local
	LOCAL_ROOT='/home/wentahttps://raw.github.com/zhangwentao/syncsite/master/syncsite.sho/test/www.wentao.com/'
	#the site root directory on remote 
	REMOTE_ROOT='/home/wentao_zhang/test/www.wentao.com/'
###param
	syncsite.sh file_will_be_sync direction
direction have two options: localToRemote(use local file to override copy on remote,this is default option) ,remoteToLocal

###example
you have a file named 'siteconfig.conf',after you edit,you want sync it to remote,you can exec this comment on your shell:

	syncsite.sh siteconfig.conf
contrary:
	syncsite.sh siteconfig.conf remoteTolocal

##download
[click this](https://raw.github.com/zhangwentao/syncsite/master/syncsite.sh)