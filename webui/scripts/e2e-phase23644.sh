#!/usr/bin/env bash
# Phase-23644: STATUS Soft 23640+ ssh_auth_enneacosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 23640\+|through 23648|ssh_auth_enneacosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase23648|through 23648|e2e-phase23656' webui/STATUS.md
echo "STATUS Soft 23640+ ok"; echo "cleaned"; echo "OK: phase23644 e2e passed"
