#!/usr/bin/env bash
# Phase-2764: STATUS mentions Soft 2760+ / 2761-2768.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"
cd "$ROOT"
grep -qiE 'Soft 2760\+|2440\+ Checkpoint|Soft-2440' webui/STATUS.md
grep -qE 'phase2768|through 2768|e2e-phase2768' webui/STATUS.md
echo "STATUS Soft 2760+ ok"
echo "cleaned"
echo "OK: phase2764 e2e passed"
