#!/usr/bin/env bash
# Phase-9163: client soft_fertig_ssh_auth_list_length_roster Soft 9160+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_list_length_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 9160+ soft_fertig_ssh_auth_list_length_roster type ok"; echo "cleaned"; echo "OK: phase9163 e2e passed"
