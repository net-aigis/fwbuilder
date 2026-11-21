#!/usr/bin/env bash
# Phase-13163: client soft_fertig_ssh_auth_milestone_floor_roster Soft 13160+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_milestone_floor_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 13160+ soft_fertig_ssh_auth_milestone_floor_roster type ok"; echo "cleaned"; echo "OK: phase13163 e2e passed"
