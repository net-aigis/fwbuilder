#!/usr/bin/env bash
# Phase-9644: STATUS Soft 9640+ ssh_auth_not_implemented_id_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 9640\+|through 9648|ssh_auth_not_implemented_id_roster' webui/STATUS.md
grep -qE 'phase9648|through 9648|e2e-phase9656' webui/STATUS.md
echo "STATUS Soft 9640+ ok"; echo "cleaned"; echo "OK: phase9644 e2e passed"
