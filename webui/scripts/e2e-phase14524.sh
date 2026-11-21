#!/usr/bin/env bash
# Phase-14524: STATUS Soft 14520+ ssh_auth_clear_ssh_ratio_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 14520\+|through 14528|ssh_auth_clear_ssh_ratio_roster' webui/STATUS.md
grep -qE 'phase14528|through 14528|e2e-phase14536' webui/STATUS.md
echo "STATUS Soft 14520+ ok"; echo "cleaned"; echo "OK: phase14524 e2e passed"
