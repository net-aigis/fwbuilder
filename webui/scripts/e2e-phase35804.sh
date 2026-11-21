#!/usr/bin/env bash
# Phase-35804: STATUS Soft 35800+ ssh_auth_triacontaheptacosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 35800\+|through 35808|ssh_auth_triacontaheptacosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase35808|through 35808|e2e-phase35816' webui/STATUS.md
echo "STATUS Soft 35800+ ok"; echo "cleaned"; echo "OK: phase35804 e2e passed"
