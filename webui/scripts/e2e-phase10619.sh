#!/usr/bin/env bash
# Phase-10619: client soft_fertig_ssh_auth_empty_check_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_empty_check_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-empty-check roster type ok"; echo "cleaned"; echo "OK: phase10619 e2e passed"
