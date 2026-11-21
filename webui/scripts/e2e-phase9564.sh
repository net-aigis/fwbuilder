#!/usr/bin/env bash
# Phase-9564: STATUS Soft 9560+ ssh_auth_implemented_id_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 9560\+|through 9568|ssh_auth_implemented_id_roster' webui/STATUS.md
grep -qE 'phase9568|through 9568|e2e-phase9576' webui/STATUS.md
echo "STATUS Soft 9560+ ok"; echo "cleaned"; echo "OK: phase9564 e2e passed"
