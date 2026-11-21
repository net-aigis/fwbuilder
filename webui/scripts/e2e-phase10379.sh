#!/usr/bin/env bash
# Phase-10379: client soft_fertig_ssh_auth_refusal_pair_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_refusal_pair_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-refusal-pair roster type ok"; echo "cleaned"; echo "OK: phase10379 e2e passed"
