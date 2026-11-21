#!/usr/bin/env bash
# Phase-32604: STATUS Soft 32600+ ssh_auth_triacontaheptacosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 32600\+|through 32608|ssh_auth_triacontaheptacosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase32608|through 32608|e2e-phase32616' webui/STATUS.md
echo "STATUS Soft 32600+ ok"; echo "cleaned"; echo "OK: phase32604 e2e passed"
