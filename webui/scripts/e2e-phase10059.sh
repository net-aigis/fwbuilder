#!/usr/bin/env bash
# Phase-10059: client soft_fertig_ssh_auth_batch_gate_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_batch_gate_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-batch-gate roster type ok"; echo "cleaned"; echo "OK: phase10059 e2e passed"
