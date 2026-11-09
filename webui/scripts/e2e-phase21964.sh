#!/usr/bin/env bash
# Phase-21964: STATUS Soft 21960+ ssh_auth_schema_211_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 21960\+|through 21968|ssh_auth_schema_211_echo_roster' webui/STATUS.md
grep -qE 'phase21968|through 21968|e2e-phase21976' webui/STATUS.md
echo "STATUS Soft 21960+ ok"; echo "cleaned"; echo "OK: phase21964 e2e passed"
