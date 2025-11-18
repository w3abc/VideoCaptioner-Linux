#!/bin/bash
# VideoCaptioner Launcher for Linux

# 检测Linux系统
if [[ "$OSTYPE" != "linux-gnu"* ]]; then
    echo "错误：此版本仅支持Linux系统"
    echo "如需Windows版本，请访问：https://github.com/WEIFENG2333/VideoCaptioner"
    exit 1
fi

# 检查Python 3安装
if ! command -v python3 &> /dev/null; then
    echo "错误：未找到Python 3。请安装Python 3.8+"
    echo "Ubuntu/Debian: sudo apt install python3 python3-pip python3-venv"
    echo "CentOS/RHEL 8/9: sudo dnf install python3 python3-pip python3-venv"
    echo "CentOS/RHEL 7: sudo yum install python3 python3-pip && sudo yum install python3-venv"
    echo "Arch Linux: sudo pacman -S python python-pip"
    echo "openSUSE: sudo zypper install python3 python3-pip python3-venv"
    exit 1
fi

# 设置Python命令
PYTHON_CMD="python3"
PIP_CMD="pip3"

# 检查main.py是否存在
if [ ! -f "main.py" ]; then
    echo "错误：未找到main.py。请在项目根目录运行此脚本"
    exit 1
fi

# 检查系统工具 - FFmpeg
if ! command -v ffmpeg &> /dev/null; then
    echo "错误：未找到FFmpeg。请安装FFmpeg用于音视频处理"
    echo "Ubuntu/Debian: sudo apt install ffmpeg"
    echo "CentOS/RHEL: sudo dnf install ffmpeg"
    echo "Arch Linux: sudo pacman -S ffmpeg"
    echo "openSUSE: sudo zypper install ffmpeg"
    exit 1
fi

# 检查系统工具 - aria2c
if ! command -v aria2c &> /dev/null; then
    echo "错误：未找到aria2c。请安装aria2c用于多线程下载"
    echo "Ubuntu/Debian: sudo apt install aria2"
    echo "CentOS/RHEL: sudo dnf install aria2"
    echo "Arch Linux: sudo pacman -S aria2"
    echo "openSUSE: sudo zypper install aria2"
    exit 1
fi

# 检查python3-venv模块
if ! $PYTHON_CMD -m venv --help &> /dev/null; then
    echo "错误：未找到python3-venv模块。请安装python3-venv"
    echo "Ubuntu/Debian: sudo apt install python3-venv"
    echo "CentOS/RHEL 8/9: sudo dnf install python3-venv"
    echo "CentOS/RHEL 7: sudo yum install python3-venv"
    echo "Arch Linux: sudo pacman -S python-virtualenv"
    echo "openSUSE: sudo zypper install python3-venv"
    exit 1
fi

# 创建虚拟环境（如果不存在）
if [ ! -d "venv" ]; then
    echo "正在创建Python虚拟环境..."
    $PYTHON_CMD -m venv venv
fi

# 激活虚拟环境
source venv/bin/activate

# 检查并安装Python依赖
if ! $PYTHON_CMD -c "import PyQt5" 2>/dev/null; then
    echo "正在安装Python依赖包..."
    pip install -r requirements.txt
fi

# 运行应用程序
echo "正在启动VideoCaptioner..."
$PYTHON_CMD main.py