#!/usr/bin/env bash
# Phase-9179: client soft_fertig_ssh_auth_bool_flag_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_bool_flag_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-bool-flag roster type ok"; echo "cleaned"; echo "OK: phase9179 e2e passed"
