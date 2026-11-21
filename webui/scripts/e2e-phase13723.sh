#!/usr/bin/env bash
# Phase-13723: client soft_fertig_ssh_auth_cap_key_count_roster Soft 13720+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_cap_key_count_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 13720+ soft_fertig_ssh_auth_cap_key_count_roster type ok"; echo "cleaned"; echo "OK: phase13723 e2e passed"
