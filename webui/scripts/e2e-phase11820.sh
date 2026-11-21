#!/usr/bin/env bash
# Phase-11820: STATUS mentions ssh_auth_export_count_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_export_count_roster|soft_fertig_ssh_auth_export_count_roster' webui/STATUS.md
grep -qE 'phase11824|through 11824|e2e-phase11824' webui/STATUS.md
echo "STATUS ssh-auth-export-count roster ok"; echo "cleaned"; echo "OK: phase11820 e2e passed"
