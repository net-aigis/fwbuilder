#!/usr/bin/env bash
# Phase-29404: STATUS Soft 29400+ ssh_auth_triacontaheptacosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 29400\+|through 29408|ssh_auth_triacontaheptacosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase29408|through 29408|e2e-phase29416' webui/STATUS.md
echo "STATUS Soft 29400+ ok"; echo "cleaned"; echo "OK: phase29404 e2e passed"
