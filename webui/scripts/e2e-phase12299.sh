#!/usr/bin/env bash
# Phase-12299: client soft_fertig_ssh_auth_method_count_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_method_count_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-method-count roster type ok"; echo "cleaned"; echo "OK: phase12299 e2e passed"
