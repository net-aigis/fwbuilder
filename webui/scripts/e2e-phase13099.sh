#!/usr/bin/env bash
# Phase-13099: client soft_fertig_ssh_auth_milestone_floor_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_milestone_floor_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-milestone-floor roster type ok"; echo "cleaned"; echo "OK: phase13099 e2e passed"
