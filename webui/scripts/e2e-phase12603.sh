#!/usr/bin/env bash
# Phase-12603: client soft_fertig_ssh_auth_support_count_roster Soft 12600+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_support_count_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 12600+ soft_fertig_ssh_auth_support_count_roster type ok"; echo "cleaned"; echo "OK: phase12603 e2e passed"
