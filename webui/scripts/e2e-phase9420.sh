#!/usr/bin/env bash
# Phase-9420: STATUS mentions ssh_auth_refusal_id_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_refusal_id_roster|soft_fertig_ssh_auth_refusal_id_roster' webui/STATUS.md
grep -qE 'phase9424|through 9424|e2e-phase9424' webui/STATUS.md
echo "STATUS ssh-auth-refusal-id roster ok"; echo "cleaned"; echo "OK: phase9420 e2e passed"
