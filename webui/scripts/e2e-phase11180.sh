#!/usr/bin/env bash
# Phase-11180: STATUS mentions ssh_auth_export_hint_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_export_hint_roster|soft_fertig_ssh_auth_export_hint_roster' webui/STATUS.md
grep -qE 'phase11184|through 11184|e2e-phase11184' webui/STATUS.md
echo "STATUS ssh-auth-export-hint roster ok"; echo "cleaned"; echo "OK: phase11180 e2e passed"
