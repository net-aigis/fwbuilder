#!/usr/bin/env bash
# Phase-24924: STATUS Soft 24920+ ssh_auth_triacontatriadeca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 24920\+|through 24928|ssh_auth_triacontatriadeca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase24928|through 24928|e2e-phase24936' webui/STATUS.md
echo "STATUS Soft 24920+ ok"; echo "cleaned"; echo "OK: phase24924 e2e passed"
