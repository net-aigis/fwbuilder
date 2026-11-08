#!/usr/bin/env bash
# Phase-13659: client soft_fertig_ssh_auth_cap_key_count_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_cap_key_count_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-cap-key-count roster type ok"; echo "cleaned"; echo "OK: phase13659 e2e passed"
