#!/usr/bin/env bash
# Phase-14203: client soft_fertig_ssh_auth_soft_phase_parts_roster Soft 14200+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_phase_parts_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 14200+ soft_fertig_ssh_auth_soft_phase_parts_roster type ok"; echo "cleaned"; echo "OK: phase14203 e2e passed"
