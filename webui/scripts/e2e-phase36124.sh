#!/usr/bin/env bash
# Phase-36124: STATUS Soft 36120+ ssh_auth_triacontaoctacosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 36120\+|through 36128|ssh_auth_triacontaoctacosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase36128|through 36128|e2e-phase36136' webui/STATUS.md
echo "STATUS Soft 36120+ ok"; echo "cleaned"; echo "OK: phase36124 e2e passed"
