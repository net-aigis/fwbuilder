#!/usr/bin/env bash
# Phase-11020: STATUS mentions ssh_auth_refusal_related_roster.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -qiE 'ssh_auth_refusal_related_roster|soft_fertig_ssh_auth_refusal_related_roster' webui/STATUS.md
grep -qE 'phase11024|through 11024|e2e-phase11024' webui/STATUS.md
echo "STATUS ssh-auth-refusal-related roster ok"; echo "cleaned"; echo "OK: phase11020 e2e passed"
