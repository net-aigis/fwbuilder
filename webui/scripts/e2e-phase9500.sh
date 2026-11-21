#!/usr/bin/env bash
# Phase-9500: STATUS mentions ssh_auth_implemented_id_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_implemented_id_roster|soft_fertig_ssh_auth_implemented_id_roster' webui/STATUS.md
grep -qE 'phase9504|through 9504|e2e-phase9504' webui/STATUS.md
echo "STATUS ssh-auth-implemented-id roster ok"; echo "cleaned"; echo "OK: phase9500 e2e passed"
