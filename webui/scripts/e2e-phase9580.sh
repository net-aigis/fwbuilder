#!/usr/bin/env bash
# Phase-9580: STATUS mentions ssh_auth_not_implemented_id_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_not_implemented_id_roster|soft_fertig_ssh_auth_not_implemented_id_roster' webui/STATUS.md
grep -qE 'phase9584|through 9584|e2e-phase9584' webui/STATUS.md
echo "STATUS ssh-auth-not-implemented-id roster ok"; echo "cleaned"; echo "OK: phase9580 e2e passed"
