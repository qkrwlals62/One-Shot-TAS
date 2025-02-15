# python -m torch.distributed.launch --nproc_per_node=8 --use_env supernet_train_original.py --data-path '/data' --gp \
# --change_qk --relative_position --mode super --dist-eval --cfg ./experiments/supernet/supernet-T.yaml --epochs 500 --warmup-epochs 20 \
# --resume '/OUTPUT_PATH/checkpoint-original-19.pth' --output /OUTPUT_PATH --batch-size 128 

##################

# python -m torch.distributed.launch --nproc_per_node=8 --use_env supernet_train_sn_not_original.py --data-path '/data' --gp \
# --change_qk --relative_position --mode super --dist-eval --cfg ./experiments/supernet/supernet-T.yaml --epochs 500 --warmup-epochs 20 \
# --output /OUTPUT_PATH --batch-size 128 \


# python -m torch.distributed.launch --nproc_per_node=8 --use_env supernet_train_sn1.py --data-path '/data' --gp \
# --change_qk --relative_position --mode super --dist-eval --cfg ./experiments/supernet/supernet-T.yaml --epochs 500 --warmup-epochs 20 \
# --resume '/OUTPUT_PATH/checkpoint-original-19.pth' --output /OUTPUT_PATH --batch-size 128 \
# --save_checkpoint_path 'checkpoint-sn-400-interval-5-top-' --save_log_path './log/supernet_greedy_spectral_norm_400ep_interval_5_topk.log' --interval 5

python -m torch.distributed.launch --nproc_per_node=8 --use_env supernet_train_sn1.py --data-path '/data' --gp \
--change_qk --relative_position --mode super --dist-eval --cfg ./experiments/supernet/supernet-T.yaml --epochs 500 --warmup-epochs 20 \
--resume '/OUTPUT_PATH/checkpoint-sn-not-original-0-prenas-aug19.pth' --output /OUTPUT_PATH --batch-size 128 \
--save_checkpoint_path 'checkpoint-sn-400-interval-1-top(data_aug)-' --save_log_path './log/supernet_greedy_spectral_norm_400ep_interval_1_topk(data_aug).log' --interval 1

python3 -m torch.distributed.launch --nproc_per_node=8 --use_env evolution.py --data-path '/data' --gp \
--change_qk --relative_position --dist-eval --cfg ./experiments/supernet/supernet-T.yaml --resume '/OUTPUT_PATH/checkpoint-sn-400-interval-1-top(data_aug)-25.pth' \
--min-param-limits 5 --param-limits 6 \
--log-file-path './log/search_sn_not_original_400-interval-1-top(data_aug)_6M.log'

python3 -m torch.distributed.launch --nproc_per_node=8 --use_env evolution.py --data-path '/data' --gp \
--change_qk --relative_position --dist-eval --cfg ./experiments/supernet/supernet-T.yaml --resume '/OUTPUT_PATH/checkpoint-sn-not-original-0-prenas-aug25.pth' \
--min-param-limits 5 --param-limits 6 \
--log-file-path './log/search_sn_not_original_500-top(data_aug)_6M.log'

# python -m torch.distributed.launch --nproc_per_node=8 --use_env supernet_train_sn1.py --data-path '/data' --gp \
# --change_qk --relative_position --mode super --dist-eval --cfg ./experiments/supernet/supernet-T.yaml --epochs 500 --warmup-epochs 20 \
# --resume '/OUTPUT_PATH/checkpoint-original-14.pth' --output /OUTPUT_PATH --batch-size 128 \
# --save_checkpoint_path 'checkpoint-sn-300-interval-1-top-' --save_log_path './log/supernet_greedy_spectral_norm_300ep_interval_1_topk.log' --interval 1

# top-k
# python -m torch.distributed.launch --nproc_per_node=8 --use_env supernet_train_sn1.py --data-path '/data' --gp \
# --change_qk --relative_position --mode super --dist-eval --cfg ./experiments/supernet/supernet-T.yaml --epochs 500 --warmup-epochs 20 \
# --resume '/OUTPUT_PATH/checkpoint-original-19.pth' --output /OUTPUT_PATH --batch-size 128 


# bottom-k
# python -m torch.distributed.launch --nproc_per_node=8 --use_env supernet_train_sn2.py --data-path '/data' --gp \
# --change_qk --relative_position --mode super --dist-eval --cfg ./experiments/supernet/supernet-T.yaml --epochs 500 --warmup-epochs 20 \
# --resume '/OUTPUT_PATH/checkpoint-original-19.pth' --output /OUTPUT_PATH --batch-size 128 