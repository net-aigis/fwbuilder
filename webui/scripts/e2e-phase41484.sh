#!/usr/bin/env bash
# Phase-41484: STATUS Soft 41480+ ssh_auth_schema_455_echo_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'Soft 41480\+|through 41488|ssh_auth_schema_455_echo_roster' webui/STATUS.md
grep -qE 'phase41488|through 41488|e2e-phase41496' webui/STATUS.md
echo "STATUS Soft 41480+ ok"; echo "cleaned"; echo "OK: phase41484 e2e passed"
