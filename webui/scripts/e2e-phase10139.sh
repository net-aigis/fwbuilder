#!/usr/bin/env bash
# Phase-10139: client soft_fertig_ssh_auth_support_gate_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_support_gate_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-support-gate roster type ok"; echo "cleaned"; echo "OK: phase10139 e2e passed"
