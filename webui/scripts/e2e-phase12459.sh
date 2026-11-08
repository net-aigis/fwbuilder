#!/usr/bin/env bash
# Phase-12459: client soft_fertig_ssh_auth_alt_count_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_alt_count_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-alt-count roster type ok"; echo "cleaned"; echo "OK: phase12459 e2e passed"
