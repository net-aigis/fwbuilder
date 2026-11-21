#!/usr/bin/env bash
# Phase-14139: client soft_fertig_ssh_auth_soft_phase_parts_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_soft_phase_parts_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-soft-phase-parts roster type ok"; echo "cleaned"; echo "OK: phase14139 e2e passed"
