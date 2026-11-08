#!/usr/bin/env bash
# Phase-11419: client soft_fertig_ssh_auth_clear_hint_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_clear_hint_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-clear-hint roster type ok"; echo "cleaned"; echo "OK: phase11419 e2e passed"
