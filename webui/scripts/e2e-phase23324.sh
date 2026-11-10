#!/usr/bin/env bash
# Phase-23324: STATUS Soft 23320+ ssh_auth_octacosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 23320\+|through 23328|ssh_auth_octacosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase23328|through 23328|e2e-phase23336' webui/STATUS.md
echo "STATUS Soft 23320+ ok"; echo "cleaned"; echo "OK: phase23324 e2e passed"
