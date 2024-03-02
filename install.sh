#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
LANG=en_US.UTF-8
Btapi_Url='http://www.btkaixin.net'
Check_Api=$(curl -Ss --connect-timeout 5 -m 2 $Btapi_Url/api/SetupCount)
if [ "$Check_Api" != 'ok' ];then
        Red_Error "此 宝 塔 第 三 方 云 端 无 法 连 接 ， 因 此 安 装 过 程 已 中 止 ！ ";
fi
if [ $(whoami) != "root" ];then
        echo "请 使 用 root权 限 执 行 宝 塔 安 装 命 令 ！ "
        exit 1;
fi
#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
LANG=en_US.UTF-8
Btapi_Url='http://www.btkaixin.net'
Check_Api=$(curl -Ss --connect-timeout 5 -m 2 $Btapi_Url/api/SetupCount)
if [ "$Check_Api" != 'ok' ];then
        Red_Error "此 宝 塔 第 三 方 云 端 无 法 连 接 ， 因 此 安 装 过 程 已 中 止 ！ ";
fi
if [ $(whoami) != "root" ];then
        echo "请 使 用 root权 限 执 行 宝 塔 安 装 命 令 ！ "
        exit 1;
fi
is64bit=$(getconf LONG_BIT)
if [ "${is64bit}" != '64' ];then
        Red_Error "抱 歉 , 当 前 面 板 版 本 不 支 持 32位 系 统 , 请 使 用 64位 系 统 或 安 装 >
宝 塔 5.9!";
fi
Centos6Check=$(cat /etc/redhat-release | grep ' 6.' | grep -iE 'centos|Red
 Hat')
if [ "${Centos6Check}" ];then
        echo "Centos6不 支 持 安 装 宝 塔 面 板 ， 请 更 换 Centos7/8安 装 宝 塔 面 板 "
        exit 1
fi
UbuntuCheck=$(cat /etc/issue|grep Ubuntu|awk '{print $2}'|cut -f 1 -d '.')
if [ "${UbuntuCheck}" ] && [ "${UbuntuCheck}" -lt "16" ];then
        echo "Ubuntu ${UbuntuCheck}不 支 持 安 装 宝 塔 面 板 ， 建 议 更 换 Ubuntu18/20
安 装 宝 塔 面 板 "
        exit 1
fi
cd ~
setup_path="/www"
python_bin=$setup_path/server/panel/pyenv/bin/python
cpu_cpunt=$(cat /proc/cpuinfo|grep processor|wc -l)
# if [ "$1" ];then
#       IDC_CODE=$1
# fi
GetSysInfo(){
        if [ -s "/etc/redhat-release" ];then
                SYS_VERSION=$(cat /etc/redhat-release)
        elif [ -s "/etc/issue" ]; then
                SYS_VERSION=$(cat /etc/issue)
        fi
        SYS_INFO=$(uname -a)
        SYS_BIT=$(getconf LONG_BIT)
        MEM_TOTAL=$(free -m|grep Mem|awk '{print $2}')
        CPU_INFO=$(getconf _NPROCESSORS_ONLN)
        echo -e ${SYS_VERSION}
