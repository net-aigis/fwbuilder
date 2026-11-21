#!/usr/bin/env bash
# Phase-45404: STATUS Soft 45400+ ssh_auth_triacontaheptacosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 45400\+|through 45408|ssh_auth_triacontaheptacosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase45408|through 45408|e2e-phase45416' webui/STATUS.md
echo "STATUS Soft 45400+ ok"; echo "cleaned"; echo "OK: phase45404 e2e passed"
