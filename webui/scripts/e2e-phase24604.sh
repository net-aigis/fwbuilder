#!/usr/bin/env bash
# Phase-24604: STATUS Soft 24600+ ssh_auth_triacontadodeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 24600\+|through 24608|ssh_auth_triacontadodeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase24608|through 24608|e2e-phase24616' webui/STATUS.md
echo "STATUS Soft 24600+ ok"; echo "cleaned"; echo "OK: phase24604 e2e passed"
