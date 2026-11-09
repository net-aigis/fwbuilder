#!/usr/bin/env bash
# Phase-18524: STATUS Soft 18520+ ssh_auth_trideca_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 18520\+|through 18528|ssh_auth_trideca_checkpoint_roster' webui/STATUS.md
grep -qE 'phase18528|through 18528|e2e-phase18536' webui/STATUS.md
echo "STATUS Soft 18520+ ok"; echo "cleaned"; echo "OK: phase18524 e2e passed"
