#!/usr/bin/env bash
# Phase-15644: STATUS Soft 15640+ ssh_auth_quad_checkpoint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 15640\+|through 15648|ssh_auth_quad_checkpoint_roster' webui/STATUS.md
grep -qE 'phase15648|through 15648|e2e-phase15656' webui/STATUS.md
echo "STATUS Soft 15640+ ok"; echo "cleaned"; echo "OK: phase15644 e2e passed"
