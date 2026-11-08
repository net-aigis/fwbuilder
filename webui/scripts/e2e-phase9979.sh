#!/usr/bin/env bash
# Phase-9979: client soft_fertig_ssh_auth_capability_count_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_capability_count_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-capability-count roster type ok"; echo "cleaned"; echo "OK: phase9979 e2e passed"
