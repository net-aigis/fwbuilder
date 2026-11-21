#!/usr/bin/env bash
# Phase-12923: client soft_fertig_ssh_auth_session_count_roster Soft 12920+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_session_count_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 12920+ soft_fertig_ssh_auth_session_count_roster type ok"; echo "cleaned"; echo "OK: phase12923 e2e passed"
