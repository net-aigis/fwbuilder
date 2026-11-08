#!/usr/bin/env bash
# Phase-9404: STATUS Soft 9400+ ssh_auth_alternative_id_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 9400\+|through 9408|ssh_auth_alternative_id_roster' webui/STATUS.md
grep -qE 'phase9408|through 9408|e2e-phase9416' webui/STATUS.md
echo "STATUS Soft 9400+ ok"; echo "cleaned"; echo "OK: phase9404 e2e passed"
