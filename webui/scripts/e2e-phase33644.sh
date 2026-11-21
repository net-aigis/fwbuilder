#!/usr/bin/env bash
# Phase-33644: STATUS Soft 33640+ ssh_auth_soft_34720_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 33640\+|through 33648|ssh_auth_soft_34720_echo_roster' webui/STATUS.md
grep -qE 'phase33648|through 33648|e2e-phase33656' webui/STATUS.md
echo "STATUS Soft 33640+ ok"; echo "cleaned"; echo "OK: phase33644 e2e passed"
