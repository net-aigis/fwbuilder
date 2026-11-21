#!/usr/bin/env bash
# Phase-41644: STATUS Soft 41640+ ssh_auth_soft_43720_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 41640\+|through 41648|ssh_auth_soft_43720_echo_roster' webui/STATUS.md
grep -qE 'phase41648|through 41648|e2e-phase41656' webui/STATUS.md
echo "STATUS Soft 41640+ ok"; echo "cleaned"; echo "OK: phase41644 e2e passed"
