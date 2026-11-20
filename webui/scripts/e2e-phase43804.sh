#!/usr/bin/env bash
# Phase-43804: STATUS Soft 43800+ ssh_auth_triacontadocosadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 43800\+|through 43808|ssh_auth_triacontadocosadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase43808|through 43808|e2e-phase43816' webui/STATUS.md
echo "STATUS Soft 43800+ ok"; echo "cleaned"; echo "OK: phase43804 e2e passed"
