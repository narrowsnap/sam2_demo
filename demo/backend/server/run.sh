PYTORCH_ENABLE_MPS_FALLBACK=1 CUDA_VISIBLE_DEVICES=0 \
APP_ROOT="$(pwd)/../../../" \
APP_URL=http://192.168.31.20:7263 \
DATA_PATH="$(pwd)/../../data" \
MODEL_SIZE='base_plus' \
DEFAULT_VIDEO_PATH=gallery/01_dog.mp4 \
gunicorn \
    --worker-class gthread app:app \
    --workers 1 \
    --threads 2 \
    --bind 192.168.31.20:7263 \
    --timeout 60