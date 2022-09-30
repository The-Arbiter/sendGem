#!/usr/bin/env bash
set -e

[[ "$ETH_RPC_URL" && "$(cast chain)" == "ethlive"  ]] || { echo "Please set a mainnet ETH_RPC_URL"; exit 1;  }

# shellcheck disable=SC1091
source "./allow-optimize.sh"

export FOUNDRY_OPTIMIZER=1
export FOUNDRY_OPTIMIZER_RUNS=200

if [[ -z "$1" ]]; then
  forge test --fork-url="$ETH_RPC_URL" --use 0.6.12  -v
else
  forge test --fork-url="$ETH_RPC_URL" --use 0.6.12  --match "$1" -vv
fi
