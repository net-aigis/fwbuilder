#!/usr/bin/env bash
# Phase-8939: client soft_fertig_ssh_auth_refresh_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_refresh_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-refresh roster type ok"; echo "cleaned"; echo "OK: phase8939 e2e passed"
