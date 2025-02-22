set -xe
pip install -r requirements.txt

# model name or path
MODEL="facebook/opt-350m"

# path for saving model
OUTPUT_PATH="./output_model.bin"

# plugin(training strategy)
# can only be one of "torch_ddp"/"torch_ddp_fp16"/"low_level_zero"/"gemini"
PLUGIN="hybrid_parallel"

# number of gpus to use
GPUNUM=4

# batch size per gpu
BS=16

# learning rate
LR="5e-5"

# number of epoch
EPOCH=10

# weight decay
WEIGHT_DECAY=0.01

# ratio of warmup steps
WARMUP_RATIO=0.1

# run the script for demo
torchrun \
  --standalone \
  --nproc_per_node ${GPUNUM} \
  opt_train_demo.py \
  --model_name_or_path ${MODEL} \
  --output_path ${OUTPUT_PATH} \
  --plugin ${PLUGIN} \
  --batch_size ${BS} \
  --num_epoch ${EPOCH} \
  --learning_rate ${LR} \
  --weight_decay ${WEIGHT_DECAY} \
  --warmup_ratio ${WARMUP_RATIO}
