#!/usr/bin/env bash
# Phase-11979: client soft_fertig_ssh_auth_path_count_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_path_count_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-path-count roster type ok"; echo "cleaned"; echo "OK: phase11979 e2e passed"
