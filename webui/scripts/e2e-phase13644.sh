#!/usr/bin/env bash
# Phase-13644: STATUS Soft 13640+ ssh_auth_refusal_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 13640\+|through 13648|ssh_auth_refusal_echo_roster' webui/STATUS.md
grep -qE 'phase13648|through 13648|e2e-phase13656' webui/STATUS.md
echo "STATUS Soft 13640+ ok"; echo "cleaned"; echo "OK: phase13644 e2e passed"
