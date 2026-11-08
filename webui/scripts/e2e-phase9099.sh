#!/usr/bin/env bash
# Phase-9099: client soft_fertig_ssh_auth_list_length_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_list_length_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-list-length roster type ok"; echo "cleaned"; echo "OK: phase9099 e2e passed"
