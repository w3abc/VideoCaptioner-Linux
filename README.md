# VideoCaptioner Linux版本

<div align="center">
  <img src="./docs/images/logo.png" alt="VideoCaptioner Logo" width="100">
  <p>卡卡字幕助手 - Linux版本</p>
  <h1>VideoCaptioner Linux 版本</h1>
  <p>一款基于大语言模型(LLM)的视频字幕处理助手，支持语音识别、字幕断句、优化、翻译全流程处理</p>
</div>

## 📖 项目说明

### 原项目信息
- **原项目地址**: https://github.com/WEIFENG2333/VideoCaptioner
- **原作者**: WEIFENG2333

### 本项目修改
由于原项目只支持windows，本版本是在原VideoCaptioner项目基础上进行修改的Linux适配版本：

- ✅ **完全适配Linux系统**: 移除了Windows依赖，完美支持Linux环境
- ✅ **Faster Whisper Linux版本**: 下载功能已改为Linux专用的二进制版本
- ✅ **保持原有功能**: 所有字幕处理功能完全保留
- ⚠️ **仅支持Linux**: 本版本仅支持Linux系统运行

#### 🔧 代码修改总结

**主要修改的文件**：

1. **FasterWhisperSettingWidget.py** - 核心UI和下载逻辑

2. **config.py** - 程序名称配置

### 核心功能
- 无需GPU即可使用强大的语音识别引擎，生成精准字幕
- 基于LLM的智能分割与断句，字幕阅读更自然流畅
- AI字幕多线程优化与翻译，调整字幕格式、表达更地道专业
- 支持批量视频字幕合成，提升处理效率
- 直观的字幕编辑查看界面，支持实时预览和快捷编辑

## 🚀 快速开始

### 系统要求
- Linux操作系统（Ubuntu、CentOS、Debian等）
- Python 3.8+
- Python venv模块（用于创建虚拟环境）
- FFmpeg（用于音视频处理，界面字幕预览渲染）
- aria2c（用于多线程下载Faster Whisper程序和模型）

### 安装步骤

1. **克隆项目**
   ```bash
   git clone https://github.com/WEIFENG2333/VideoCaptioner.git
   cd VideoCaptioner
   ```

2. **运行程序**
   ```bash
   chmod +x run.sh
   ./run.sh
   ```

`run.sh`脚本会自动完成：
- 检测Python环境
- 创建虚拟环境并安装Python依赖
- 检测系统工具（ffmpeg、aria2）
- 启动应用程序

## 🔧 配置说明

### 1. LLM API配置
LLM大模型用于字幕段句、字幕优化、以及字幕翻译：

| 配置项         | 说明 |
| -------------- | ---- |
| SiliconCloud   | [SiliconCloud官网](https://cloud.siliconflow.cn/i/goCV1JVB) |
| DeepSeek       | [DeepSeek官网](https://platform.deepseek.com) |
| Ollama本地     | [Ollama官网](https://ollama.com) |
| OpenAI兼容接口 | 支持其他服务商的API |

### 2. 语音识别接口

| 接口名称         | 说明 |
| ---------------- | ---- |
| B接口            | 免费在线识别，仅支持中英文 |
| J接口            | 免费在线识别，仅支持中英文 |
| fasterWhisper 👍 | **推荐使用**，需要下载程序和模型，支持99种语言 |

### 3. Faster Whisper配置
本版本已适配Linux系统的Faster Whisper：

- **下载方式**: 在软件"设置"→"Faster Whisper设置"→"管理模型"中一键下载
- **程序版本**: Linux二进制版本（CPU+GPU统一版本）
- **模型支持**: Tiny、Base、Small、Medium、Large-v1/v2/v3、Large-v3-turbo
- **自动安装**: 下载后自动解压并设置可执行权限

## 📂 项目结构

```
VideoCaptioner/
├── app/                         # 应用主代码
├── resource/                    # 资源文件目录
│   └── bin/                     # 二进制程序目录
│       └── Faster-Whisper-XXL/   # Faster Whisper Linux程序
├── work-dir/                    # 工作目录
├── AppData/                     # 应用数据目录
├── run.sh                       # Linux启动脚本
└── requirements.txt             # Python依赖
```

## ⚡ 性能测试

全流程处理一个14分钟1080P的英文TED视频：
- 使用本地Whisper模型进行语音识别
- 使用`gpt-4o-mini`模型优化和翻译为中文
- 总共处理时间约**4分钟**

## 🐛 问题反馈

如果您在使用本Linux版本时遇到问题，请：

1. **检查系统依赖**：
   ```bash
   # 检查Python版本（需要3.8+）
   python3 --version

   # 检查venv模块是否可用
   python3 -m venv --help

   # 检查FFmpeg是否安装
   ffmpeg --version

   # 检查aria2c是否安装
   aria2c --version
   ```

2. **常见问题解决**：
   - 如果`python3 -m venv`提示找不到模块，请安装`python3-venv`
   - 如果pip安装依赖时出现权限问题，确保使用了虚拟环境
   - 如果FFmpeg未找到，请按照上面的安装命令安装
   - 如果下载Faster Whisper时提示"没有那个文件或目录: 'aria2c'"，请安装`aria2`

3. **查看日志文件**：
   - 查看AppData/logs/目录下的日志文件获取详细错误信息

4. **提交Issue**：
   - 在GitHub上提交Issue时请注明是Linux版本
   - 提供您的Linux发行版信息和错误日志

## 🙏 致谢

- 感谢原作者 **WEIFENG2333** 开发了这么优秀的VideoCaptioner项目
- 感谢linux版的faster whisper主程序支持项目：https://github.com/Purfview/whisper-standalone-win
- 感谢 Faster Whisper 项目提供的优秀语音识别引擎
- 感谢所有为原项目做出贡献的开发者们

## 📄 许可证

本项目遵循原项目的许可证。

---

**注意**: 本版本仅支持Linux系统。如果您需要Windows版本，请使用原项目：https://github.com/WEIFENG2333/VideoCaptioner