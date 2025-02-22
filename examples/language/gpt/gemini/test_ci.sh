set -x
$(cd `dirname $0`;pwd)
export TRAIN_STEP=200

for MODEL_TYPE in "gpt2_medium"; do
  for DISTPLAN in "CAI_ZeRO1" "CAI_ZeRO2" "CAI_Gemini"; do
    for BATCH_SIZE in 32; do
      for GPUNUM in 2; do
        MODEL_TYPE=${MODEL_TYPE} DISTPLAN=${DISTPLAN} BATCH_SIZE=${BATCH_SIZE} GPUNUM=${GPUNUM} \
        bash ./run_gemini.sh
        done
      done
    done
done
