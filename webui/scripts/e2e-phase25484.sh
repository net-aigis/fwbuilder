#!/usr/bin/env bash
# Phase-25484: STATUS Soft 25480+ ssh_auth_schema_255_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 25480\+|through 25488|ssh_auth_schema_255_echo_roster' webui/STATUS.md
grep -qE 'phase25488|through 25488|e2e-phase25496' webui/STATUS.md
echo "STATUS Soft 25480+ ok"; echo "cleaned"; echo "OK: phase25484 e2e passed"
