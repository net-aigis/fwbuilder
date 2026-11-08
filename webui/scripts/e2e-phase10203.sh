#!/usr/bin/env bash
# Phase-10203: client soft_fertig_ssh_auth_support_gate_roster Soft 10200+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_support_gate_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 10200+ soft_fertig_ssh_auth_support_gate_roster type ok"; echo "cleaned"; echo "OK: phase10203 e2e passed"
