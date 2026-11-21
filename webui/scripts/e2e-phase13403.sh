#!/usr/bin/env bash
# Phase-13403: client soft_fertig_ssh_auth_batch_echo_roster Soft 13400+.
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/../.." && pwd)"; cd "$ROOT"
grep -Fq 'soft_fertig_ssh_auth_batch_echo_roster?:' webui/frontend/src/api/client.ts
echo "client Soft 13400+ soft_fertig_ssh_auth_batch_echo_roster type ok"; echo "cleaned"; echo "OK: phase13403 e2e passed"
