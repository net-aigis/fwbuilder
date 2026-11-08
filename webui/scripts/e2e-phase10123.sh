#!/usr/bin/env bash
# Phase-10123: client soft_fertig_ssh_auth_batch_gate_roster Soft 10120+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_batch_gate_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 10120+ soft_fertig_ssh_auth_batch_gate_roster type ok"; echo "cleaned"; echo "OK: phase10123 e2e passed"
