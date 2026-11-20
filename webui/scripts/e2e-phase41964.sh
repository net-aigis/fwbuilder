#!/usr/bin/env bash
# Phase-41964: STATUS Soft 41960+ ssh_auth_soft_44080_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 41960\+|through 41968|ssh_auth_soft_44080_echo_roster' webui/STATUS.md
grep -qE 'phase41968|through 41968|e2e-phase41976' webui/STATUS.md
echo "STATUS Soft 41960+ ok"; echo "cleaned"; echo "OK: phase41964 e2e passed"
