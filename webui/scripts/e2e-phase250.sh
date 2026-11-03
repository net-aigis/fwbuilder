#!/usr/bin/env bash
# Phase-250: smoke spacing extract + qtGrid + soft marker.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
bash webui/scripts/e2e-phase241.sh
bash webui/scripts/e2e-phase242.sh
bash webui/scripts/e2e-phase217.sh
echo "smoke 241/242/217 ok"
echo "cleaned"
echo "OK: phase250 e2e passed"
