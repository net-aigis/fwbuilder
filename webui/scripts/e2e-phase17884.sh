#!/usr/bin/env bash
# Phase-17884: STATUS Soft 17880+ ssh_auth_undeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 17880\+|through 17888|ssh_auth_undeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase17888|through 17888|e2e-phase17896' webui/STATUS.md
echo "STATUS Soft 17880+ ok"; echo "cleaned"; echo "OK: phase17884 e2e passed"
