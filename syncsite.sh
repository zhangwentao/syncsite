#!/bin/bash
LOCAL_TO_REMOTE=localToRemote
REMOTE_TO_LOCAL=remoteToLocal

USER_NAME='wentao_zhang'
HOST='wentao.me'
LOCAL_ROOT='/home/wentao/test/www.wentao.com/'
REMOTE_ROOT='/home/wentao_zhang/test/www.wentao.com/'

param=''

#file or folder will be sync
itemForSync=$1

#sync dirction
direction=$2

#check the file exist or not
if [[ !(-e $itemForSync) ]];then
	echo $itemForSync is not exist!!!
	exit 1
fi

#item's local absolute path
itemAbsolutePath=`readlink -f $itemForSync`
if [ -d $itemForSync ];then
	param='-r'
fi

#item's local relate path with LOCAL_ROOT
itemRelativePath=${itemAbsolutePath#"$LOCAL_ROOT"}
#item's remote absolute path 
itemRemoteAbsolutePath=$REMOTE_ROOT$itemRelativePath

echo syncing...
echo LOCAL:$itemAbsolutePath
echo REMOTE:$itemRemoteAbsolutePath
if [[ $direction == $REMOTE_TO_LOCAL ]];then
	echo direction:$REMOTE_TO_LOCAL
	scp $param $USER_NAME@$HOST:$itemRemoteAbsolutePath $itemAbsolutePath
else
	echo direction:$LOCAL_TO_REMOTE
	scp $param $itemAbsolutePath $USER_NAME@$HOST:$itemRemoteAbsolutePath
fi
echo sync complete!!!
