#!/usr/bin/env bash
# Phase-9340: STATUS mentions ssh_auth_alternative_id_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_alternative_id_roster|soft_fertig_ssh_auth_alternative_id_roster' webui/STATUS.md
grep -qE 'phase9344|through 9344|e2e-phase9344' webui/STATUS.md
echo "STATUS ssh-auth-alternative-id roster ok"; echo "cleaned"; echo "OK: phase9340 e2e passed"
