# SAM 2 标注demo

## 环境安装

### 本机安装

#### 安装后端环境

```bash
conda create --name sam2-demo python=3.10 --yes
conda activate sam2-demo
conda install -c conda-forge ffmpeg
pip install -e '.[interactive-demo]'
```

#### 安装前端环境

1. 安装nodejs [Node.js website](https://nodejs.org/en/download/).

```bash
npm install -g yarn
```

### docker安装（可选）

参考[README](demo/README.md)

## 下载模型

```bash
cd checkpoints && \
./download_ckpts.sh && \
cd ..
```

or individually from:

- [sam2.1_hiera_tiny.pt](https://dl.fbaipublicfiles.com/segment_anything_2/092824/sam2.1_hiera_tiny.pt)
- [sam2.1_hiera_small.pt](https://dl.fbaipublicfiles.com/segment_anything_2/092824/sam2.1_hiera_small.pt)
- [sam2.1_hiera_base_plus.pt](https://dl.fbaipublicfiles.com/segment_anything_2/092824/sam2.1_hiera_base_plus.pt)
- [sam2.1_hiera_large.pt](https://dl.fbaipublicfiles.com/segment_anything_2/092824/sam2.1_hiera_large.pt)


## 准备数据

1. 准备10～20秒的片段一次不能超过100个
2. 放到demo/data/gallery
3. 配置demo/data/gallery中的一个文件为默认加载文件
  - 修改demo/backend/server/run.sh中'01_dog.mp4'为demo/data/gallery中的一个文件

## 修改ip（替换'192.168.31.20'为实际ip）

修改文件路径:

1. demo/backend/server/app.conf.py 
2. demo/backend/server/run.sh
3. demo/frontend/src/demo/DemoConfig.tsx
2. demo/frontend/run.sh

## 修改sam结果保存路径

- 修改demo/backend/server/inference/predictor.py 361行 saved_path

## 启动

### 启动后端

```bash
cd demo/backend/server/
./run.sh
```

### 启动前端

```bash
cd demo/frontend
yarn install
./run.sh
```

## 开始标注

### 配置浏览器

1. 使用demo需要chrome或者edge浏览器
2. 搜索框输入：chrome://flags/；
3. 搜索insecure，选择enable，配置http://192.168.31.20:7262/
4. 重启浏览器

### 加载网站

访问：http://192.168.31.20:7262/

### 点击track object完成后结果自动保存

### 结果导出

- 所有任务标注完成后，下载sam结果保存路径中的标注文件

### 从准备数据开始分配新任务