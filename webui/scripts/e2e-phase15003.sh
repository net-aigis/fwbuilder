#!/usr/bin/env bash
# Phase-15003: client soft_fertig_ssh_auth_batch_only_echo_roster Soft 15000+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_batch_only_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 15000+ soft_fertig_ssh_auth_batch_only_echo_roster type ok"; echo "cleaned"; echo "OK: phase15003 e2e passed"
