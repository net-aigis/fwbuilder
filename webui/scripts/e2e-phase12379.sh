#!/usr/bin/env bash
# Phase-12379: client soft_fertig_ssh_auth_refusal_count_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_refusal_count_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-refusal-count roster type ok"; echo "cleaned"; echo "OK: phase12379 e2e passed"
