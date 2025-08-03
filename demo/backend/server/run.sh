PYTORCH_ENABLE_MPS_FALLBACK=1 \
APP_ROOT="$(pwd)/../../../" \
APP_URL=http://10.10.103.19:7263 \
MODEL_SIZE=base_plus \
DATA_PATH="$(pwd)/../../data" \
MODEL_SIZE='large' \
DEFAULT_VIDEO_PATH=gallery/AZWnq83o13_00-38-31_00-38-51.mp4 \
gunicorn \
    --worker-class gthread app:app \
    --workers 1 \
    --threads 2 \
    --bind 10.10.103.19:7263 \
    --timeout 60