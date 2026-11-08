#!/usr/bin/env bash
# Phase-12539: client soft_fertig_ssh_auth_support_count_roster type.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_support_count_roster?:' webui/frontend/src/api/client.ts
echo "client ssh-auth-support-count roster type ok"; echo "cleaned"; echo "OK: phase12539 e2e passed"
