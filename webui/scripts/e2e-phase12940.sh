#!/usr/bin/env bash
# Phase-12940: STATUS mentions ssh_auth_export_family_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_export_family_roster|soft_fertig_ssh_auth_export_family_roster' webui/STATUS.md
grep -qE 'phase12944|through 12944|e2e-phase12944' webui/STATUS.md
echo "STATUS ssh-auth-export-family roster ok"; echo "cleaned"; echo "OK: phase12940 e2e passed"
